import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('note${soundNumber}.wav'),
    );
  }

  Expanded buildKey({soundNumber, color}) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          color: color,
        ),
        onTap: () => playSound(soundNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(soundNumber: 1, color: Colors.red),
            buildKey(soundNumber: 2, color: Colors.orange),
            buildKey(soundNumber: 3, color: Colors.yellow),
            buildKey(soundNumber: 4, color: Colors.green),
            buildKey(soundNumber: 5, color: Colors.cyan),
            buildKey(soundNumber: 6, color: Colors.blue),
            buildKey(soundNumber: 7, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}
