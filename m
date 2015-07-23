From: Julien Corjon <corjon.j@ecagroup.com>
Date: Thu, 23 Jul 2015 14:40:20 +0200
Subject: [Buildroot] [PATCH 1/1] qt/qt5base: Fix INCLUDE_PATH when no
	JPEG/PNG/GIF support
Message-ID: <1437655220-12168-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 ...008-QtGui-force-image-dir-in-include_path.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch

diff --git a/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch b/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
new file mode 100644
index 0000000..4e5068b
--- /dev/null
+++ b/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
@@ -0,0 +1,33 @@
+From 6065be41dbd04690236418098fca504140fc205c Mon Sep 17 00:00:00 2001
+From: Julien Corjon <corjon.j@ecagroup.com>
+Date: Thu, 23 Jul 2015 13:32:47 +0200
+Subject: [PATCH 1/1] QtGui: force image directory in INCLUDE_PATH
+
+If PNG/JPEG/GIF support is not set qplaformpixmap inclusion then
+image/qplatformpixmap.h cannot be found from painting/qbrush.cpp
+
+Change-Id: I165c888b2afc51de47267607883615d3aa3bae40
+
+Upstream-Status: https://bugreports.qt.io/browse/QTBUG-47400
+
+Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
+---
+ src/gui/image/image.pri | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/gui/image/image.pri b/src/gui/image/image.pri
+index 8db944e..af6e0fa 100644
+--- a/src/gui/image/image.pri
++++ b/src/gui/image/image.pri
+@@ -3,6 +3,8 @@
+ 
+ # Qt kernel module
+ 
++INCLUDEPATH *= $$PWD
++
+ HEADERS += \
+         image/qbitmap.h \
+         image/qimage.h \
+-- 
+2.1.0
+
-- 
2.1.0
