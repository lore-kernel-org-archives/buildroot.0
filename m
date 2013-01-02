From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:41 +0100
Subject: [Buildroot] [PATCH 06/20] xdriver_xf86-video-apm: remove package
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8ca15095f3b5ec420695e764a8a0714fcc1d9a0d.1357125961.git.thomas.petazzoni@free-electrons.com>
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
 package/x11r7/xdriver_xf86-video-apm/Config.in     |   12 ------------
 .../xdriver_xf86-video-apm.mk                      |   12 ------------
 3 files changed, 25 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-apm/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 985b72f..7a7666e 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -178,7 +178,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-input-tslib/Config.in
 		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
 		source package/x11r7/xdriver_xf86-input-void/Config.in
-		source package/x11r7/xdriver_xf86-video-apm/Config.in
 		source package/x11r7/xdriver_xf86-video-ark/Config.in
 		source package/x11r7/xdriver_xf86-video-ast/Config.in
 		source package/x11r7/xdriver_xf86-video-ati/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-apm/Config.in b/package/x11r7/xdriver_xf86-video-apm/Config.in
deleted file mode 100644
index dea5258..0000000
--- a/package/x11r7/xdriver_xf86-video-apm/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
-	bool "xf86-video-apm"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Alliance ProMotion video driver
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
deleted file mode 100644
index d0317f5..0000000
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-apm -- Alliance ProMotion video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_APM_VERSION = 1.2.3
-XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.9.5
