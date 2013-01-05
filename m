From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:43:18 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-xgi: remove package
Message-ID: <20130105124712.C10CA9A63B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2decde6b6f96e25e9a0dabb46b45c9dfa4bc79b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    2 --
 package/x11r7/xdriver_xf86-video-xgi/Config.in     |   11 -----------
 .../xdriver_xf86-video-xgi.mk                      |   13 -------------
 3 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 0649086..184afd2 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -209,8 +209,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-vmware/Config.in
 		source package/x11r7/xdriver_xf86-video-voodoo/Config.in
 		source package/x11r7/xdriver_xf86-video-wsfb/Config.in
-		source package/x11r7/xdriver_xf86-video-xgi/Config.in
-		source package/x11r7/xdriver_xf86-video-xgixp/Config.in
 	endmenu
 	endif
 	menu "X11R7 Fonts"
diff --git a/package/x11r7/xdriver_xf86-video-xgi/Config.in b/package/x11r7/xdriver_xf86-video-xgi/Config.in
deleted file mode 100644
index d0fe665..0000000
--- a/package/x11r7/xdriver_xf86-video-xgi/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
-	bool "xf86-video-xgi"
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  XGI based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
deleted file mode 100644
index 491f4e8..0000000
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-xgi -- XGI video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_XGI_VERSION = 1.6.0
-XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_XGI_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_XGI_CONF_OPT = --enable-dri
-
-$(eval $(autotools-package))
