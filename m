From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:20 +0100
Subject: [Buildroot] [PATCH 16/91] xdriver_xf86-video-vmware: Bump version
	to 13.0.2, add mesa3d dependency
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP91EF68BF4756702F397DF3D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xdriver_xf86-video-vmware/Config.in                  |    2 ++
 .../x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
index 2ab70e3..a4d2052 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vmware/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	bool "xf86-video-vmware"
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index 53a87be..e77e5b8 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VMWARE_VERSION = 12.0.2
+XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.0.2
 XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = mesa3d xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
 $(eval $(autotools-package))
-- 
1.7.10.4
