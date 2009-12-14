From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Dec 2009 17:29:59 +0100
Subject: [Buildroot] [git commit master] qt: tweak gui kconfig
Message-ID: <20091214163129.579107777C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=518804f35ab1d823226eabaf7f4a0494f5f224f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/qt/Config.in |   10 +++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5217452..4851a9f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, gst-plugins-bad, iw, libfuse, libpcap, lighttpd,
-	mesa, mtd-utils, pcre, sshfs, tremor, usbutils
+	mesa, mtd-utils, pcre, qt, sshfs, tremor, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 044f65d..3f8c929 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -62,7 +62,7 @@ config BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_NETWORK
 	default y
 	help
-	  Turns on support to Gui applications. If your board don't have
+	  Turns on support for Gui applications. If your board doesn't have
 	  video output, or you don't require Qt GUI, say n.
 
 if BR2_PACKAGE_QT_GUI_MODULE
@@ -100,23 +100,19 @@ config BR2_PACKAGE_QT_PIXEL_DEPTH_32
 	default y
 
 endmenu
-endif
 
 config BR2_PACKAGE_QT_GIF
 	bool "Enable GIF support"
-	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  This compiles and installs the plugin for GIF reading support.
 
 config BR2_PACKAGE_QT_LIBMNG
 	bool "Enable libmng support"
-	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  This compiles and installs the plugin for MNG support.
 
 choice
 	prompt "JPEG support"
-	depends on BR2_PACKAGE_QT_GUI_MODULE
 	default BR2_PACKAGE_QT_NOJPEG
 	help
 	  Select libjpeg support.
@@ -140,7 +136,6 @@ endchoice
 
 choice
 	prompt "PNG support"
-	depends on BR2_PACKAGE_QT_GUI_MODULE
 	default BR2_PACKAGE_QT_NOPNG
 	help
 	  Select which library to use if PNG support should be enabled.
@@ -158,7 +153,6 @@ endchoice
 
 choice
 	prompt "TIFF support"
-	depends on BR2_PACKAGE_QT_GUI_MODULE
 	default BR2_PACKAGE_QT_NOTIFF
 	help
 	  Select which library to use if TIFF support should be enabled.
@@ -174,6 +168,8 @@ config BR2_PACKAGE_QT_QTTIFF
 	bool "Use Qt bundled libtiff"
 endchoice
 
+endif # BR2_PACKAGE_QT_GUI_MODULE
+
 choice
 	prompt "zlib support"
 	default BR2_PACKAGE_QT_QTZLIB
-- 
1.6.3.3
