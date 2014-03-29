From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:13:53 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-vmware: Bump version to
	13.0.2, add mesa3d dependency
Message-ID: <20140329222158.368F39C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2dc5bff0b3a95fee6471cfe66b2d8ee11bf0b7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    2 ++
 .../xdriver_xf86-video-vmware.mk                   |    4 ++--
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
