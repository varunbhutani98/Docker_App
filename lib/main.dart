import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

String osname;
String imagename;

class MyApp extends StatelessWidget {
  web(osName, imageName) async {
    // print(osname);
    var url =
        "http://192.168.247.3/cgi-bin/flutterdocker.py?x=${osName}&y=${imageName}";
    var response = await http.get(url);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Docker App",
            style: TextStyle(
                color: Colors.black87,
                fontStyle: FontStyle.italic,
                decorationStyle: TextDecorationStyle.wavy),
          ),
        ),
        //body: Text("textfield"),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            height: 550,
            width: 350,
            color: Colors.blue.shade300,
            // decoration: BoxDecoration(image: Image.asset('name')),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: Center(
                    child: TextField(
                      autocorrect: false,
                      onChanged: (value) {
                        osname = value;
                        // print(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.launch),
                        border: OutlineInputBorder(),
                        //border: InputBorder.none,
                        hintText: 'Enter the Docker Osname',
                      ),
                      cursorColor: Colors.blue,
                      style: TextStyle(height: 1),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Card(
                    child: TextField(
                      autocorrect: false,
                      onChanged: (value) {
                        imagename = value;
                        // print(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.launch),
                        border: OutlineInputBorder(),
                        //border: InputBorder.none,
                        hintText: 'Enter the Docker Image Name',
                      ),
                      cursorColor: Colors.blue,
                      style: TextStyle(height: 1),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(7.0),
                //   child: Card(
                //     child: TextField(
                //       autocorrect: false,
                //       onChanged: (value) {
                //         imagename = value;
                //         // print(value);
                //       },
                //       decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.launch),
                //         border: OutlineInputBorder(),
                //         //border: InputBorder.none,
                //         hintText: 'Enter the Docker Image Name',
                //       ),
                //       cursorColor: Colors.blue,
                //       style: TextStyle(height: 1),
                //     ),
                //   ),
                // ),

                Card(
                    color: Colors.blueGrey,
                    //margin: MainAxisAlignment.center,
                    child: FlatButton(
                        color: Colors.grey.shade200,
                        textColor: Colors.black87,
                        splashColor: Colors.blueAccent,
                        focusColor: Colors.blue,
                        onPressed: () {
                          web(osname, imagename);
                        },
                        child: Text('Submit'))),
                //Card(child: Text("submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
