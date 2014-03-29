From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:15:16 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-mach64: Bump version to
	6.9.4, add correct mesa3d dependency
Message-ID: <20140329222158.874459C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63a572550235568194a1a224b6d733a7a45e051d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    3 ++-
 .../xdriver_xf86-video-mach64.mk                   |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index 31f4c58..674071c 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	bool "xf86-video-mach64"
-	select BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 7534d29..60a8a93 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.3
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.4
 XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_LICENSE = MIT
