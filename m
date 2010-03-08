From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete lbxproxy
Message-ID: <20100308133621.249BD776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1ae8bd2daf8954f690d6311615aff02cbdb9cf7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                      |    1 -
 package/x11r7/xapp_lbxproxy/Config.in        |   11 -----------
 package/x11r7/xapp_lbxproxy/xapp_lbxproxy.mk |   13 -------------
 3 files changed, 0 insertions(+), 25 deletions(-)
 delete mode 100644 package/x11r7/xapp_lbxproxy/Config.in
 delete mode 100644 package/x11r7/xapp_lbxproxy/xapp_lbxproxy.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index a457b9f..3fff8fb 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -99,7 +99,6 @@ endmenu
 		source package/x11r7/xapp_fstobdf/Config.in
 		source package/x11r7/xapp_iceauth/Config.in
 		source package/x11r7/xapp_ico/Config.in
-		source package/x11r7/xapp_lbxproxy/Config.in
 		source package/x11r7/xapp_listres/Config.in
 		source package/x11r7/xapp_luit/Config.in
 		source package/x11r7/xapp_mkfontdir/Config.in
diff --git a/package/x11r7/xapp_lbxproxy/Config.in b/package/x11r7/xapp_lbxproxy/Config.in
deleted file mode 100644
index 895a806..0000000
--- a/package/x11r7/xapp_lbxproxy/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XAPP_LBXPROXY
-	bool "lbxproxy"
-	select BR2_PACKAGE_XLIB_LIBICE
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBLBXUTIL
-	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
-	help
-	  lbxproxy 1.0.1
-	  Low BandWidth X proxy
diff --git a/package/x11r7/xapp_lbxproxy/xapp_lbxproxy.mk b/package/x11r7/xapp_lbxproxy/xapp_lbxproxy.mk
deleted file mode 100644
index 782c03b..0000000
--- a/package/x11r7/xapp_lbxproxy/xapp_lbxproxy.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_lbxproxy -- Low BandWidth X proxy
-#
-################################################################################
-
-XAPP_LBXPROXY_VERSION = 1.0.1
-XAPP_LBXPROXY_SOURCE = lbxproxy-$(XAPP_LBXPROXY_VERSION).tar.bz2
-XAPP_LBXPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_LBXPROXY_AUTORECONF = NO
-XAPP_LBXPROXY_DEPENDENCIES = xlib_libICE xlib_libX11 xlib_libXext xlib_liblbxutil xlib_xtrans xproto_xproxymanagementprotocol
-
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_lbxproxy))
-- 
1.6.3.3
