From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:47 +0100
Subject: [Buildroot] [PATCH 12/20] xdriver_xf86-video-sisusb: remove package
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a11ed189e2fa3053ab1f083ec9ccbacb4f296155.1357125961.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-sisusb/Config.in  |   12 ------------
 .../xdriver_xf86-video-sisusb.mk                   |   12 ------------
 3 files changed, 25 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-sisusb/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index ee5fb04..d6a8bcd 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -199,7 +199,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-savage/Config.in
 		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
 		source package/x11r7/xdriver_xf86-video-sis/Config.in
-		source package/x11r7/xdriver_xf86-video-sisusb/Config.in
 		source package/x11r7/xdriver_xf86-video-suncg14/Config.in
 		source package/x11r7/xdriver_xf86-video-suncg3/Config.in
 		source package/x11r7/xdriver_xf86-video-suncg6/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/Config.in b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
deleted file mode 100644
index b00a8a7..0000000
--- a/package/x11r7/xdriver_xf86-video-sisusb/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
-	bool "xf86-video-sisusb"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  SiS USB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
deleted file mode 100644
index c59b876..0000000
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-sisusb -- SiS USB video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SISUSB_VERSION = 0.9.4
-XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.9.5
