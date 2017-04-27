From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 27 Apr 2017 23:01:50 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix examples compile with disabled
	gui module
Message-ID: <20170427210150.1838-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  Project ERROR: Could not find feature opengl.

[1] http://autobuild.buildroot.net/results/040/040ab283dbbec623fe5ff4eaece754d9701fafc5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...4-examples-fix-compile-without-gui-module.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch

diff --git a/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch b/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch
new file mode 100644
index 000000000..148ced800
--- /dev/null
+++ b/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch
@@ -0,0 +1,42 @@
+From fe8a9bacf781fcf290e04a08f2b8e37d881d58bb Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 27 Apr 2017 22:41:28 +0200
+Subject: [PATCH] examples: fix compile without gui module
+
+Fixes:
+
+  Project ERROR: Could not find feature opengl.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/gui/gui.pro         | 2 +-
+ examples/widgets/widgets.pro | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/examples/gui/gui.pro b/examples/gui/gui.pro
+index a4d960d3f5..b8080c2075 100644
+--- a/examples/gui/gui.pro
++++ b/examples/gui/gui.pro
+@@ -6,5 +6,5 @@ CONFIG += no_docs_target
+ 
+ SUBDIRS += analogclock
+ SUBDIRS += rasterwindow
+-qtConfig(opengl): \
++qtHaveModule(gui):qtConfig(opengl): \
+     SUBDIRS += openglwindow
+diff --git a/examples/widgets/widgets.pro b/examples/widgets/widgets.pro
+index 513ddc91f2..cef4936d32 100644
+--- a/examples/widgets/widgets.pro
++++ b/examples/widgets/widgets.pro
+@@ -22,7 +22,7 @@ SUBDIRS       = \
+                 tutorials \
+                 widgets
+ 
+-qtConfig(opengl): \
++qtHaveModule(gui):qtConfig(opengl): \
+     SUBDIRS += windowcontainer
+ 
+ contains(DEFINES, QT_NO_CURSOR): SUBDIRS -= mainwindows
+-- 
+2.11.0
+
-- 
2.11.0
