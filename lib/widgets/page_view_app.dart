
import 'package:flutter/cupertino.dart';
import 'package:nubank_flutter/widgets/card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate; //Fazendo o nosso próprio callback
  final bool showMenu;

  const PageViewApp({Key key, this.top, this.onChanged, this.onPanUpdate, this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        top: top,
        height: MediaQuery.of(context).size.height * 0.45,
        left: 0,
        right: 0,
        //width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onPanUpdate: onPanUpdate, //Move o item quando é clicado
          child: PageView(
            onPageChanged: onChanged,
                physics: showMenu ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(), //Não mover quando a condição for verdadeira
                children: <Widget>[
                  CardApp(),
                  CardApp(),
                  CardApp()
                ]
          ),
        ),
    );
  }
}