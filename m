From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  5 Jan 2013 09:57:08 -0300
Subject: [Buildroot] [PATCH 1/2] xdriver_xf86-video-suncg6: remove package
Message-ID: <1357390629-597-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CG6 was an old SBUS video card used in Sun SPARC workstations from
the 90s.
Highly unlikely a target for buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-suncg6/Config.in  |    9 ---------
 .../xdriver_xf86-video-suncg6.mk                   |   12 ------------
 3 files changed, 0 insertions(+), 22 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg6/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 184afd2..fccf33f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -199,7 +199,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-savage/Config.in
 		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
 		source package/x11r7/xdriver_xf86-video-sis/Config.in
-		source package/x11r7/xdriver_xf86-video-suncg6/Config.in
 		source package/x11r7/xdriver_xf86-video-sunffb/Config.in
 		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
 		source package/x11r7/xdriver_xf86-video-tga/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/Config.in b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
deleted file mode 100644
index 9496f8d..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg6/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
-	bool "xf86-video-suncg6"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  GX/Turbo GX video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
deleted file mode 100644
index 1314fea..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-suncg6 -- GX/Turbo GX video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNCG6_VERSION = 1.1.1
-XDRIVER_XF86_VIDEO_SUNCG6_SOURCE = xf86-video-suncg6-$(XDRIVER_XF86_VIDEO_SUNCG6_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNCG6_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.8.6
