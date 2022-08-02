import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/widgets/mediumtext.dart';

class PopularPage extends StatefulWidget {
  final String name;
  final String rest;
  final String url;
  final String description;
  const PopularPage(
      {Key? key,
      required this.name,
      required this.rest,
      required this.url,
      required this.description})
      : super(key: key);

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
              heroTag: null,
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.purple.shade50,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.purple,
              )),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                backgroundColor: Colors.purple.shade50,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.purple,
                )),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: (Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(widget.url))),
                ),
                Positioned(
                  height: 350,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    // width: double.infinity,

                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MdText(
                              text: widget.name,
                              weight: FontWeight.w500,
                              size: 24,
                            ),
                            MdText(
                              text: widget.rest,
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            color: Colors.deepPurple.shade300,
                                            size: 14,
                                          )),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                MdText(
                                  text: "4.5",
                                  color: Colors.grey.shade800,
                                  size: 12,
                                ),
                                MdText(
                                  text: "1287  comments",
                                  color: Colors.grey.shade800,
                                  size: 12,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                iconText(Icons.circle, "Normal", Colors.yellow),
                                const SizedBox(
                                  width: 5,
                                ),
                                iconText(
                                    Icons.location_on, "10km ", Colors.green),
                                const SizedBox(
                                  width: 5,
                                ),
                                iconText(Icons.access_time, "14min ",
                                    Colors.red.shade400)
                              ],
                            ),
                            MdText(
                              text: "Description",
                            ),
                            Text(widget.description)
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                  color: Colors.purple.shade50,
                  padding: EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          )
                        ]),
                  )))
        ],
      )),
    );
  }

  Container iconText(IconData icon, String text, Color color) {
    return Container(
        child: Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 18,
        ),
        SizedBox(
          width: 5,
        ),
        MdText(text: text, size: 12, color: Colors.grey.shade800)
      ],
    ));
  }
}
