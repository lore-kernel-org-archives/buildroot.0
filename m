From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:42 +0100
Subject: [Buildroot] [PATCH 07/20] xdriver_xf86-video-chips: remove package
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <435133a8e8cc69c76736a82261b31c2d03e2b0cf.1357125961.git.thomas.petazzoni@free-electrons.com>
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
 package/x11r7/xdriver_xf86-video-chips/Config.in   |   10 ----------
 .../xdriver_xf86-video-chips.mk                    |   12 ------------
 3 files changed, 23 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-chips/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 7a7666e..8c6a659 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -181,7 +181,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-ark/Config.in
 		source package/x11r7/xdriver_xf86-video-ast/Config.in
 		source package/x11r7/xdriver_xf86-video-ati/Config.in
-		source package/x11r7/xdriver_xf86-video-chips/Config.in
 		source package/x11r7/xdriver_xf86-video-cirrus/Config.in
 		source package/x11r7/xdriver_xf86-video-dummy/Config.in
 		source package/x11r7/xdriver_xf86-video-fbdev/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-chips/Config.in b/package/x11r7/xdriver_xf86-video-chips/Config.in
deleted file mode 100644
index 29a99ec..0000000
--- a/package/x11r7/xdriver_xf86-video-chips/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
-	bool "xf86-video-chips"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Chips and Technologies video driver
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
deleted file mode 100644
index 9856ecb..0000000
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-chips -- Chips and Technologies video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_CHIPS_VERSION = 1.2.3
-XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.9.5
