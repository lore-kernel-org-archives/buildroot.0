From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:10 +0100
Subject: [Buildroot] [PATCH 06/91] Remove package xdriver_xf86-video-newport
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP370A82072D1A31E4433F42D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://patchwork.freedesktop.org/patch/14670/ (State Accepted)
"This driver has not received server updates such as mibstore removal
and conditional compiling of xaa architecture. This indicate an implicite
decisison to remove the driver from active support and future releases.

This driver is used for SGI workstations Indy and Indigo2. Manufacturing
stopped in 1997 and SGI support ended in 2012."

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/Config.in                                  |    1 -
 package/x11r7/xdriver_xf86-video-newport/Config.in       |    9 ---------
 .../xdriver_xf86-video-newport.mk                        |   14 --------------
 3 files changed, 24 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-newport/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 458d09f..8685ca1 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -164,7 +164,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-mach64/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
 		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
-		source package/x11r7/xdriver_xf86-video-newport/Config.in
 		source package/x11r7/xdriver_xf86-video-nv/Config.in
 		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
 		source package/x11r7/xdriver_xf86-video-r128/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-newport/Config.in b/package/x11r7/xdriver_xf86-video-newport/Config.in
deleted file mode 100644
index d9c89b1..0000000
--- a/package/x11r7/xdriver_xf86-video-newport/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
-	bool "xf86-video-newport"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Newport video driver
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
deleted file mode 100644
index cacf39f..0000000
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-newport
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_NEWPORT_VERSION = 0.2.4
-XDRIVER_XF86_VIDEO_NEWPORT_SOURCE = xf86-video-newport-$(XDRIVER_XF86_VIDEO_NEWPORT_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_NEWPORT_LICENSE = MIT
-XDRIVER_XF86_VIDEO_NEWPORT_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_NEWPORT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.10.4
