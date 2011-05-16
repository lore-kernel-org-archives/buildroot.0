From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 May 2011 14:27:24 +0200
Subject: [Buildroot] [git commit] qt: fix build when script+dbus are enabled,
	but gui isn't
Message-ID: <20110516122801.33E7483533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f5a106e22abd4142c95687f440c99befda4f4d45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt-4.7.3-script-qtdbus-no-gui.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/qt/qt-4.7.3-script-qtdbus-no-gui.patch

diff --git a/package/qt/qt-4.7.3-script-qtdbus-no-gui.patch b/package/qt/qt-4.7.3-script-qtdbus-no-gui.patch
new file mode 100644
index 0000000..e29e9e4
--- /dev/null
+++ b/package/qt/qt-4.7.3-script-qtdbus-no-gui.patch
@@ -0,0 +1,22 @@
+[PATCH] fix build with script+dbus enabled, but no gui
+
+The script/qtdbus plugin doesn't need gui support, so don't try to
+link it against libQtGui.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/plugins/script/qtdbus/qtdbus.pro |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qt-4.7.3/src/plugins/script/qtdbus/qtdbus.pro
+===================================================================
+--- qt-4.7.3.orig/src/plugins/script/qtdbus/qtdbus.pro
++++ qt-4.7.3/src/plugins/script/qtdbus/qtdbus.pro
+@@ -1,6 +1,6 @@
+ TARGET  = qtscriptdbus
+ include(../../qpluginbase.pri)
+-QT = core gui script
++QT = core script
+ CONFIG += qdbus
+ 
+ SOURCES += main.cpp
-- 
1.7.3.4
