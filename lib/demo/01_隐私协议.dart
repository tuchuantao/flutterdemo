import 'package:flutter/material.dart';

// void main() {
//   // 入口函数
//   // 1、runApp函数
//   runApp(const MyApp());
// }
main() => runApp(const MyApp());

/*
 * Widget:
 * 有状态Widget: StatefulWidget   在运行过程中有一些状态（data）需要改变
 * 无状态Widget: StatelessWidget  内容是确定没有状态（data）的改变
 */
class MyApp extends StatelessWidget {
  // NOTE: StatelessWidget 无状态widget
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 热重载最主要是执行 build方法
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to Flutter',
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
        backgroundColor: Colors.green,
      ),
      body: HomePageBody(),
    );
  }
}

// StatefullWidget: 继承自StatefulWidget的类(可以接收父Widget传过来的数据)/State类(状态)
// flag: 状态
// Stateful不能定义状态 -> 创建一个单独的类, 这个类负责维护状态
class HomePageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomPageBodyState();
  }
}

class HomPageBodyState extends State<HomePageBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: flag,
              onChanged: (value) {
                setState(() { // NOTE: 更新状态
                  flag = value ?? true;
                  print(value);
                });
              }),
          const Text("隐私协议", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
