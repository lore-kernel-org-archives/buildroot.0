From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 May 2014 22:37:10 +0200
Subject: [Buildroot] [git commit] qt5connectivity: the poster example needs
	no widgets, but it needs quick
Message-ID: <20140511204727.C01159CAFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d7133b9e9b96c527c595868b6904894784b87a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding an upstream patch to fix an autobuild failure.

Upstream commit:
   https://qt.gitorious.org/qt/qtconnectivity/commit/0156038682cc40d44fedfc28dc9b78d1a0e6203b

Fixes:
   http://autobuild.buildroot.net/results/d12/d120355cbb42307d35e59bc4528e973a2b12150e/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ample-needs-no-widgets-but-it-needs-quick.patch |   67 ++++++++++++++++++++
 1 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5connectivity/qt5connectivity-0002-the-poster-example-needs-no-widgets-but-it-needs-quick.patch b/package/qt5/qt5connectivity/qt5connectivity-0002-the-poster-example-needs-no-widgets-but-it-needs-quick.patch
new file mode 100644
index 0000000..d8b75f4
--- /dev/null
+++ b/package/qt5/qt5connectivity/qt5connectivity-0002-the-poster-example-needs-no-widgets-but-it-needs-quick.patch
@@ -0,0 +1,67 @@
+qt5connectivity: the poster example needs no widgets, but it needs quick
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 0156038682cc40d44fedfc28dc9b78d1a0e6203b Mon Sep 17 00:00:00 2001
+From: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
+Date: Tue, 18 Feb 2014 15:28:48 +0100
+Subject: [PATCH] the poster example needs no widgets, but it needs quick
+
+Task-number: QTBUG-36893
+Change-Id: Ic77fe07aa450001386be0b2e0d4a99f2e674dbb2
+Reviewed-by: Alex Blasche <alexander.blasche@digia.com>
+Reviewed-by: Rolf Eike Beer <eb@emlix.com>
+---
+ examples/nfc/nfc.pro              |    5 ++++-
+ examples/nfc/poster/poster.pro    |    2 +-
+ examples/nfc/poster/qmlposter.cpp |    4 ++--
+ 3 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/examples/nfc/nfc.pro b/examples/nfc/nfc.pro
+index e4f7e35..0076a71 100644
+--- a/examples/nfc/nfc.pro
++++ b/examples/nfc/nfc.pro
+@@ -2,7 +2,10 @@ TEMPLATE = subdirs
+ qtHaveModule(widgets) {
+     SUBDIRS += \
+         annotatedurl \
+-        ndefeditor \
++        ndefeditor
++}
++qtHaveModule(quick) {
++    SUBDIRS += \
+         poster
+ }
+ 
+diff --git a/examples/nfc/poster/poster.pro b/examples/nfc/poster/poster.pro
+index 47de298..b6e87ed 100644
+--- a/examples/nfc/poster/poster.pro
++++ b/examples/nfc/poster/poster.pro
+@@ -1,4 +1,4 @@
+-QT += qml quick network nfc widgets
++QT += qml quick network nfc
+ 
+ SOURCES += \
+     qmlposter.cpp
+diff --git a/examples/nfc/poster/qmlposter.cpp b/examples/nfc/poster/qmlposter.cpp
+index 89f3695..2fc943d 100644
+--- a/examples/nfc/poster/qmlposter.cpp
++++ b/examples/nfc/poster/qmlposter.cpp
+@@ -38,13 +38,13 @@
+ **
+ ****************************************************************************/
+ 
+-#include <QtWidgets/QApplication>
++#include <QtGui/QGuiApplication>
+ #include <QtQml/QQmlEngine>
+ #include <QtQuick/QQuickView>
+ 
+ int main(int argc, char *argv[])
+ {
+-    QApplication application(argc, argv);
++    QGuiApplication application(argc, argv);
+     const QString mainQmlApp = QLatin1String("qrc:/poster.qml");
+     QQuickView view;
+     view.setSource(QUrl(mainQmlApp));
+-- 
+1.7.1
+
