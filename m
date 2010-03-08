From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete xwfp
Message-ID: <20100308133621.D3ABE776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8d1db67889093c8b6f7890ef47e373e414e481bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in              |    1 -
 package/x11r7/xapp_xfwp/Config.in    |    8 --------
 package/x11r7/xapp_xfwp/xapp_xfwp.mk |   13 -------------
 3 files changed, 0 insertions(+), 22 deletions(-)
 delete mode 100644 package/x11r7/xapp_xfwp/Config.in
 delete mode 100644 package/x11r7/xapp_xfwp/xapp_xfwp.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index fcd0793..e9c868b 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -135,7 +135,6 @@ endmenu
 		source package/x11r7/xapp_xfontsel/Config.in
 		source package/x11r7/xapp_xfs/Config.in
 		source package/x11r7/xapp_xfsinfo/Config.in
-		source package/x11r7/xapp_xfwp/Config.in
 		source package/x11r7/xapp_xgamma/Config.in
 		source package/x11r7/xapp_xgc/Config.in
 		source package/x11r7/xapp_xhost/Config.in
diff --git a/package/x11r7/xapp_xfwp/Config.in b/package/x11r7/xapp_xfwp/Config.in
deleted file mode 100644
index 2ba046a..0000000
--- a/package/x11r7/xapp_xfwp/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_XFWP
-	bool "xfwp"
-	select BR2_PACKAGE_XLIB_LIBICE
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
-	help
-	  xfwp 1.0.1
-	  X.Org xfwp application
diff --git a/package/x11r7/xapp_xfwp/xapp_xfwp.mk b/package/x11r7/xapp_xfwp/xapp_xfwp.mk
deleted file mode 100644
index a1dbff4..0000000
--- a/package/x11r7/xapp_xfwp/xapp_xfwp.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xfwp -- X.Org xfwp application
-#
-################################################################################
-
-XAPP_XFWP_VERSION = 1.0.1
-XAPP_XFWP_SOURCE = xfwp-$(XAPP_XFWP_VERSION).tar.bz2
-XAPP_XFWP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFWP_AUTORECONF = NO
-XAPP_XFWP_DEPENDENCIES = xlib_libICE xlib_libX11 xproto_xproxymanagementprotocol
-
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xfwp))
-- 
1.6.3.3
