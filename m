From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Aug 2020 20:25:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5imageformats: fix build with
 jasper
In-Reply-To: <20200822182535.1835260-1-fontaine.fabrice@gmail.com>
References: <20200822182535.1835260-1-fontaine.fabrice@gmail.com>
Message-ID: <20200822182535.1835260-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ea3bc0d3110cb54421ecf433317ca79ca0ff834a
 - http://autobuild.buildroot.org/results/6831dfdd1ecaaa3812de481882040c1742a72aec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-on-Arch-Linux.patch        | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/qt5/qt5imageformats/0001-fix-build-on-Arch-Linux.patch

diff --git a/package/qt5/qt5imageformats/0001-fix-build-on-Arch-Linux.patch b/package/qt5/qt5imageformats/0001-fix-build-on-Arch-Linux.patch
new file mode 100644
index 0000000000..c348c65260
--- /dev/null
+++ b/package/qt5/qt5imageformats/0001-fix-build-on-Arch-Linux.patch
@@ -0,0 +1,37 @@
+From 704868db61be1542c2d9e2b75ead00c45c56cc36 Mon Sep 17 00:00:00 2001
+From: "Evgeniy A. Dushistov" <dushistov@mail.ru>
+Date: Sat, 15 Aug 2020 15:09:08 +0300
+Subject: fix build on Arch Linux
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+qtimageformats/src/plugins/imageformats/jp2/qjp2handler.cpp:844:41:
+error: no declaration of ?pow?
+  844 |     const double jasperRate = minRate + pow((double(quality) / double(maxQuality)), 2) * maxRate;
+
+Pick-to: 5.15
+Change-Id: I085996c2db2251903b2a3e52e6e648831637c8f9
+Reviewed-by: Shawn Rutledge <shawn.rutledge@qt.io>
+[Retrieved from:
+https://code.qt.io/cgit/qt/qtimageformats.git/commit/?id=704868db61be1542c2d9e2b75ead00c45c56cc36]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/plugins/imageformats/jp2/qjp2handler.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/imageformats/jp2/qjp2handler.cpp b/src/plugins/imageformats/jp2/qjp2handler.cpp
+index 4311d26..05c7bc1 100644
+--- a/src/plugins/imageformats/jp2/qjp2handler.cpp
++++ b/src/plugins/imageformats/jp2/qjp2handler.cpp
+@@ -45,6 +45,7 @@
+ #include "qcolor.h"
+ 
+ #include <jasper/jasper.h>
++#include <math.h> // for pow
+ 
+ QT_BEGIN_NAMESPACE
+ 
+-- 
+cgit v1.2.1
+
-- 
2.28.0
