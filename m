From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete xf86-video-sunbw2
Message-ID: <20100308133634.67041776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=830fbe326aa7349751167aefa4fca47a7fcc2c2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-sunbw2/Config.in  |    8 --------
 .../xdriver_xf86-video-sunbw2.mk                   |   14 --------------
 3 files changed, 0 insertions(+), 23 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunbw2/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunbw2/xdriver_xf86-video-sunbw2.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 46d2ab6..6aac70b 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -216,7 +216,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
 		source package/x11r7/xdriver_xf86-video-sis/Config.in
 		source package/x11r7/xdriver_xf86-video-sisusb/Config.in
-		source package/x11r7/xdriver_xf86-video-sunbw2/Config.in
 		source package/x11r7/xdriver_xf86-video-suncg14/Config.in
 		source package/x11r7/xdriver_xf86-video-suncg3/Config.in
 		source package/x11r7/xdriver_xf86-video-suncg6/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-sunbw2/Config.in b/package/x11r7/xdriver_xf86-video-sunbw2/Config.in
deleted file mode 100644
index 1330521..0000000
--- a/package/x11r7/xdriver_xf86-video-sunbw2/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNBW2
-	bool "xf86-video-sunbw2"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  xf86-video-sunbw2 1.1.0
-	  BW2 video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunbw2/xdriver_xf86-video-sunbw2.mk b/package/x11r7/xdriver_xf86-video-sunbw2/xdriver_xf86-video-sunbw2.mk
deleted file mode 100644
index 00e564a..0000000
--- a/package/x11r7/xdriver_xf86-video-sunbw2/xdriver_xf86-video-sunbw2.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-sunbw2 -- BW2 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNBW2_VERSION = 1.1.0
-XDRIVER_XF86_VIDEO_SUNBW2_SOURCE = xf86-video-sunbw2-$(XDRIVER_XF86_VIDEO_SUNBW2_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNBW2_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNBW2_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_SUNBW2_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_xproto
-XDRIVER_XF86_VIDEO_SUNBW2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sunbw2))
-- 
1.6.3.3
