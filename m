From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete xrx
Message-ID: <20100308133622.CD73F776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2febd7152874c9b4124a9bdf89d8ddc3c9e174a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in            |    1 -
 package/x11r7/xapp_xrx/Config.in   |    8 --------
 package/x11r7/xapp_xrx/xapp_xrx.mk |   13 -------------
 3 files changed, 0 insertions(+), 22 deletions(-)
 delete mode 100644 package/x11r7/xapp_xrx/Config.in
 delete mode 100644 package/x11r7/xapp_xrx/xapp_xrx.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 68c6f54..02bd4e1 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -164,7 +164,6 @@ endmenu
 		source package/x11r7/xapp_xrandr/Config.in
 		source package/x11r7/xapp_xrdb/Config.in
 		source package/x11r7/xapp_xrefresh/Config.in
-		source package/x11r7/xapp_xrx/Config.in
 		source package/x11r7/xapp_xset/Config.in
 		source package/x11r7/xapp_xsetmode/Config.in
 		source package/x11r7/xapp_xsetpointer/Config.in
diff --git a/package/x11r7/xapp_xrx/Config.in b/package/x11r7/xapp_xrx/Config.in
deleted file mode 100644
index 08830aa..0000000
--- a/package/x11r7/xapp_xrx/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_XRX
-	bool "xrx"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  xrx 1.0.1
-	  X.Org xrx application
diff --git a/package/x11r7/xapp_xrx/xapp_xrx.mk b/package/x11r7/xapp_xrx/xapp_xrx.mk
deleted file mode 100644
index 56b1293..0000000
--- a/package/x11r7/xapp_xrx/xapp_xrx.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xrx -- X.Org xrx application
-#
-################################################################################
-
-XAPP_XRX_VERSION = 1.0.1
-XAPP_XRX_SOURCE = xrx-$(XAPP_XRX_VERSION).tar.bz2
-XAPP_XRX_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XRX_AUTORECONF = NO
-XAPP_XRX_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt
-
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xrx))
-- 
1.6.3.3
