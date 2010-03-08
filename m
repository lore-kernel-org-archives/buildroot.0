From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete xf86-video-vermilion
Message-ID: <20100308133637.DC96C776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4d28fd67272fdc467aed61891f67dd0eb17e8e16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                            |    1 -
 .../x11r7/xdriver_xf86-video-vermilion/Config.in   |   12 ------------
 .../xdriver_xf86-video-vermilion.mk                |   14 --------------
 3 files changed, 0 insertions(+), 27 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-vermilion/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-vermilion/xdriver_xf86-video-vermilion.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 6aac70b..21d2003 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -227,7 +227,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-trident/Config.in
 		source package/x11r7/xdriver_xf86-video-tseng/Config.in
 		source package/x11r7/xdriver_xf86-video-v4l/Config.in
-		source package/x11r7/xdriver_xf86-video-vermilion/Config.in
 		source package/x11r7/xdriver_xf86-video-vesa/Config.in
 		source package/x11r7/xdriver_xf86-video-vmware/Config.in
 		source package/x11r7/xdriver_xf86-video-voodoo/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-vermilion/Config.in b/package/x11r7/xdriver_xf86-video-vermilion/Config.in
deleted file mode 100644
index ffc46fc..0000000
--- a/package/x11r7/xdriver_xf86-video-vermilion/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VERMILION
-	bool "xf86-video-vermilion"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  xf86-video-vermilion 1.0.1
-	  Vermilion video driver
diff --git a/package/x11r7/xdriver_xf86-video-vermilion/xdriver_xf86-video-vermilion.mk b/package/x11r7/xdriver_xf86-video-vermilion/xdriver_xf86-video-vermilion.mk
deleted file mode 100644
index 43769f1..0000000
--- a/package/x11r7/xdriver_xf86-video-vermilion/xdriver_xf86-video-vermilion.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-vermilion -- vermilion video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_VERMILION_VERSION = 1.0.1
-XDRIVER_XF86_VIDEO_VERMILION_SOURCE = xf86-video-vermilion-$(XDRIVER_XF86_VIDEO_VERMILION_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_VERMILION_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_VERMILION_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_VERMILION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_VERMILION_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-vermilion))
-- 
1.6.3.3
