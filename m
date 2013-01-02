From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:52 +0100
Subject: [Buildroot] [PATCH 17/20] xdriver_xf86-video-tseng: remove package
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f0617493d002c714fcb7d09e1ec45e87cf7f2065.1357125961.git.thomas.petazzoni@free-electrons.com>
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
 package/x11r7/xdriver_xf86-video-tseng/Config.in   |   11 -----------
 .../xdriver_xf86-video-tseng.mk                    |   12 ------------
 3 files changed, 24 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-tseng/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index b03531e..0649086 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -204,7 +204,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
 		source package/x11r7/xdriver_xf86-video-tga/Config.in
 		source package/x11r7/xdriver_xf86-video-trident/Config.in
-		source package/x11r7/xdriver_xf86-video-tseng/Config.in
 		source package/x11r7/xdriver_xf86-video-v4l/Config.in
 		source package/x11r7/xdriver_xf86-video-vesa/Config.in
 		source package/x11r7/xdriver_xf86-video-vmware/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-tseng/Config.in b/package/x11r7/xdriver_xf86-video-tseng/Config.in
deleted file mode 100644
index f72b87b..0000000
--- a/package/x11r7/xdriver_xf86-video-tseng/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
-	bool "xf86-video-tseng"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Tseng Labs video driver
diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
deleted file mode 100644
index 8127c7d..0000000
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-tseng -- Tseng Labs video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_TSENG_VERSION = 1.2.4
-XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.9.5
