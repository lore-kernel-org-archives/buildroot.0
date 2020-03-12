From: nimaim <nimaim@gmail.com>
Date: Thu, 12 Mar 2020 09:20:28 -0500 (CDT)
Subject: [Buildroot] 2020.02 Buildroot - Qt 5.12 missing XmlListModel
Message-ID: <1584022828143-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To the Qt maintainers ... it seems Qt 5.12 moved some libs from the old, now
deprecated qt5declarative package to qt5xmlpatterns. See here:
https://bugs.archlinux.org/task/60889. Some of the components such as
XmlListModel are no longer working (as well as other libs that it included,
I'm guessing). See directory listing for this particular module between 5.9
and 5.12 builds in Buildroot:

5.9:

find . -name *"xmllistmodel*"
./qt5declarative-5.9.4/src/quick/doc/images/qml-xmllistmodel-example.png
./qt5declarative-5.9.4/src/imports/xmllistmodel
./qt5declarative-5.9.4/src/imports/xmllistmodel/xmllistmodel.pro
./qt5declarative-5.9.4/src/imports/xmllistmodel/.obj/qqmlxmllistmodel.o
./qt5declarative-5.9.4/src/imports/xmllistmodel/.obj/moc_qqmlxmllistmodel_p.o
./qt5declarative-5.9.4/src/imports/xmllistmodel/.moc/moc_qqmlxmllistmodel_p.cpp
./qt5declarative-5.9.4/src/imports/xmllistmodel/.moc/qqmlxmllistmodel.moc
./qt5declarative-5.9.4/src/imports/xmllistmodel/qqmlxmllistmodel_p.h
./qt5declarative-5.9.4/src/imports/xmllistmodel/qqmlxmllistmodel.cpp
./qt5declarative-5.9.4/qml/QtQuick/XmlListModel/libqmlxmllistmodelplugin.so
./qt5declarative-5.9.4/tests/auto/quick/qquickxmllistmodel
./qt5declarative-5.9.4/tests/auto/quick/qquickxmllistmodel/qquickxmllistmodel.pro
./qt5declarative-5.9.4/tests/auto/quick/qquickxmllistmodel/tst_qquickxmllistmodel.cpp

5.12:

find . -iname "*xmllistmodel*"
NO RESULTS

Taking another directory listing from the official installer on my 64 bit
Mint host shows they should be there:

~/Qt/5.12.5/gcc_64$ find . -iname "*xmllistmodel*"
./qml/QtQuick/XmlListModel
./qml/QtQuick/XmlListModel/libqmlxmllistmodelplugin.so

I just wanted to make sure I'm not missing anything. This change broke my
Qt5 project. Any simple patch to this?





--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
