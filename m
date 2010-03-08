From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete proxymngr
Message-ID: <20100308133621.5EBCE776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=260c5af1c968a5a944c8d25b56a7716d3691f2cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                        |    1 -
 package/x11r7/xapp_proxymngr/Config.in         |    9 ---------
 package/x11r7/xapp_proxymngr/xapp_proxymngr.mk |   14 --------------
 3 files changed, 0 insertions(+), 24 deletions(-)
 delete mode 100644 package/x11r7/xapp_proxymngr/Config.in
 delete mode 100644 package/x11r7/xapp_proxymngr/xapp_proxymngr.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 3fff8fb..8ac4bd7 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -104,7 +104,6 @@ endmenu
 		source package/x11r7/xapp_mkfontdir/Config.in
 		source package/x11r7/xapp_mkfontscale/Config.in
 		source package/x11r7/xapp_oclock/Config.in
-		source package/x11r7/xapp_proxymngr/Config.in
 		source package/x11r7/xapp_rgb/Config.in
 		source package/x11r7/xapp_rstart/Config.in
 		source package/x11r7/xapp_scripts/Config.in
diff --git a/package/x11r7/xapp_proxymngr/Config.in b/package/x11r7/xapp_proxymngr/Config.in
deleted file mode 100644
index 6a069d1..0000000
--- a/package/x11r7/xapp_proxymngr/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XAPP_PROXYMNGR
-	bool "proxymngr"
-	select BR2_PACKAGE_XLIB_LIBICE
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
-	help
-	  proxymngr 1.0.1
-	  proxy manager service
diff --git a/package/x11r7/xapp_proxymngr/xapp_proxymngr.mk b/package/x11r7/xapp_proxymngr/xapp_proxymngr.mk
deleted file mode 100644
index cfb5b4b..0000000
--- a/package/x11r7/xapp_proxymngr/xapp_proxymngr.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xapp_proxymngr -- proxy manager service
-#
-################################################################################
-
-XAPP_PROXYMNGR_VERSION = 1.0.1
-XAPP_PROXYMNGR_SOURCE = proxymngr-$(XAPP_PROXYMNGR_VERSION).tar.bz2
-XAPP_PROXYMNGR_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_PROXYMNGR_AUTORECONF = NO
-XAPP_PROXYMNGR_DEPENDENCIES = xlib_libICE xlib_libX11 xlib_libXt xproto_xproxymanagementprotocol xapp_lbxproxy
-XAPP_PROXYMNGR_CONF_ENV = ac_cv_path_LBXPROXY=$(STAGING_DIR)/usr/lib
-
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_proxymngr))
-- 
1.6.3.3
