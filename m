From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:43 +0100
Subject: [Buildroot] [PATCH 08/20] xdriver_xf86-video-i740: remove package
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f6b11a9c606d40565705aea8c748ba182a57b6af.1357125961.git.thomas.petazzoni@free-electrons.com>
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
 package/x11r7/xdriver_xf86-video-i740/Config.in    |   11 -----------
 .../xdriver_xf86-video-i740.mk                     |   12 ------------
 3 files changed, 24 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-i740/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 8c6a659..2f890da 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -188,7 +188,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-glide/Config.in
 		source package/x11r7/xdriver_xf86-video-glint/Config.in
 		source package/x11r7/xdriver_xf86-video-i128/Config.in
-		source package/x11r7/xdriver_xf86-video-i740/Config.in
 		source package/x11r7/xdriver_xf86-video-intel/Config.in
 		source package/x11r7/xdriver_xf86-video-mach64/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-i740/Config.in b/package/x11r7/xdriver_xf86-video-i740/Config.in
deleted file mode 100644
index 9d1a040..0000000
--- a/package/x11r7/xdriver_xf86-video-i740/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740
-	bool "xf86-video-i740"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Intel i740 video driver
diff --git a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
deleted file mode 100644
index 06d8083..0000000
--- a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-i740 -- Intel i740 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_I740_VERSION = 1.3.2
-XDRIVER_XF86_VIDEO_I740_SOURCE = xf86-video-i740-$(XDRIVER_XF86_VIDEO_I740_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_I740_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_I740_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.9.5
