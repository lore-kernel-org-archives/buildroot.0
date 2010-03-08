From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete xfindproxy
Message-ID: <20100308133621.97774776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2d3df1508f694a3964033100e61a391002c4332a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                          |    1 -
 package/x11r7/xapp_xfindproxy/Config.in          |    8 --------
 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk |   13 -------------
 3 files changed, 0 insertions(+), 22 deletions(-)
 delete mode 100644 package/x11r7/xapp_xfindproxy/Config.in
 delete mode 100644 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 8ac4bd7..fcd0793 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -132,7 +132,6 @@ endmenu
 		source package/x11r7/xapp_xeyes/Config.in
 		source package/x11r7/xapp_xf86dga/Config.in
 		source package/x11r7/xapp_xfd/Config.in
-		source package/x11r7/xapp_xfindproxy/Config.in
 		source package/x11r7/xapp_xfontsel/Config.in
 		source package/x11r7/xapp_xfs/Config.in
 		source package/x11r7/xapp_xfsinfo/Config.in
diff --git a/package/x11r7/xapp_xfindproxy/Config.in b/package/x11r7/xapp_xfindproxy/Config.in
deleted file mode 100644
index c9ecc58..0000000
--- a/package/x11r7/xapp_xfindproxy/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_XFINDPROXY
-	bool "xfindproxy"
-	select BR2_PACKAGE_XLIB_LIBICE
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  xfindproxy 1.0.1
-	  X.Org xfindproxy application
diff --git a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
deleted file mode 100644
index 842a3fc..0000000
--- a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xfindproxy -- X.Org xfindproxy application
-#
-################################################################################
-
-XAPP_XFINDPROXY_VERSION = 1.0.1
-XAPP_XFINDPROXY_SOURCE = xfindproxy-$(XAPP_XFINDPROXY_VERSION).tar.bz2
-XAPP_XFINDPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFINDPROXY_AUTORECONF = NO
-XAPP_XFINDPROXY_DEPENDENCIES = xlib_libICE xlib_libX11 xlib_libXt xproto_xproxymanagementprotocol
-
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xfindproxy))
-- 
1.6.3.3
