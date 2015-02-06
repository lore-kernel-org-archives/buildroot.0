From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 20:02:07 +0100
Subject: [Buildroot] [git commit] qt5/qt5base: Fix build on big endian
	systems
Message-ID: <20150206190353.A8AE581798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b201ec438606e27245e64a7eb4a2b79a7c2f0cac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backporting an upstream patch to fix a qt5base build failure on big
endian systems. This is the error message:

image/qimage_conversions.cpp:2257:9: error: expected '}' before numeric
constant

Upstream commit:

  https://qt.gitorious.org/qt/qtbase/commit/404f4281fda764cafdaa5635db995dabc4f1de8c

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ersions.cpp-Fix-build-on-big-endian-syste.patch |   51 ++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch b/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch
new file mode 100644
index 0000000..1e7705f
--- /dev/null
+++ b/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch
@@ -0,0 +1,51 @@
+qimage_conversions.cpp: Fix build on big endian systems
+
+Backporting an upstream patch to fix a qt5base build failure on big
+endian systems. This is the error message:
+
+image/qimage_conversions.cpp:2257:9: error: expected '}' before numeric 
+constant
+
+Upstream commit:
+
+  https://qt.gitorious.org/qt/qtbase/commit/404f4281fda764cafdaa5635db995dabc4f1de8c
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 404f4281fda764cafdaa5635db995dabc4f1de8c Mon Sep 17 00:00:00 2001
+From: Dmitry Shachnev <mitya57@gmail.com>
+Date: Tue, 9 Dec 2014 09:27:53 +0300
+Subject: [PATCH] qimage_conversions.cpp: Fix build on big endian systems
+
+Change-Id: I8149eb2deaa101daf85a957ff48c3a7140c43bbc
+Reviewed-by: Timo Jyrinki <timo.jyrinki@canonical.com>
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
+---
+ src/gui/image/qimage_conversions.cpp |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/gui/image/qimage_conversions.cpp b/src/gui/image/qimage_conversions.cpp
+index 17563b1..858a0d9 100644
+--- a/src/gui/image/qimage_conversions.cpp
++++ b/src/gui/image/qimage_conversions.cpp
+@@ -2252,7 +2252,7 @@ Image_Converter qimage_converter_map[QImage::NImageFormats][QImage::NImageFormat
+         convert_ARGB_to_ARGB_PM,
+ #else
+         0,
+-        0
++        0,
+ #endif
+         0, 0, 0, 0
+     }, // Format_RGBA8888
+@@ -2281,7 +2281,7 @@ Image_Converter qimage_converter_map[QImage::NImageFormats][QImage::NImageFormat
+ #else
+         0,
+         0,
+-        0
++        0,
+ #endif
+         0, 0, 0, 0
+     }, // Format_RGBA8888_Premultiplied
+-- 
+1.7.1
+
