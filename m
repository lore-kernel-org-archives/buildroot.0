From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  5 Jan 2013 09:57:09 -0300
Subject: [Buildroot] [PATCH 2/2] xdriver_xf86-video-sunffb: remove package
In-Reply-To: <1357390629-597-1-git-send-email-gustavo@zacarias.com.ar>
References: <1357390629-597-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1357390629-597-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FFB was an old SBUS video card used in Sun SPARC workstations
from the 90s.
Highly unlikely a target for buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-sunffb/Config.in  |   12 ------------
 .../xdriver_xf86-video-sunffb.mk                   |   12 ------------
 3 files changed, 0 insertions(+), 25 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunffb/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index fccf33f..2aac5a2 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -199,7 +199,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-savage/Config.in
 		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
 		source package/x11r7/xdriver_xf86-video-sis/Config.in
-		source package/x11r7/xdriver_xf86-video-sunffb/Config.in
 		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
 		source package/x11r7/xdriver_xf86-video-tga/Config.in
 		source package/x11r7/xdriver_xf86-video-trident/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/Config.in b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
deleted file mode 100644
index 76f5b9a..0000000
--- a/package/x11r7/xdriver_xf86-video-sunffb/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
-	bool "xf86-video-sunffb"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  SUNFFB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
deleted file mode 100644
index a3e1d7c..0000000
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-sunffb -- SUNFFB video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNFFB_VERSION = 1.2.1
-XDRIVER_XF86_VIDEO_SUNFFB_SOURCE = xf86-video-sunffb-$(XDRIVER_XF86_VIDEO_SUNFFB_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.8.6
