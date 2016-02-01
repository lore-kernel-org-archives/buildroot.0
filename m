From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:46:28 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-imx-viv: bump to
	version 5.0.11 p7.1
Message-ID: <20160201224715.BCFE47F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=972e65805827bc9c2611785bcf1532322524e4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is now provided in the package.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/1195b71

The following xorg.conf was used in order to force the use of the
vivante module:
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics
/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

Note that the X server must be started with the "noreset" option to
avoid crashes when closing X apps.
 # X -noreset

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash   | 2 +-
 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index 9b3c7d3..72608dd 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	1a0b25a91b493e99dfa94a802290320ea998ebd45d7aab0f73d7c7bb521b7e84  xserver-xorg-video-imx-viv-5.0.11.p4.5.tar.gz
+sha256	ab6a896cafba324105d26f52b7dad2c41d04d75cc9e48b66e8041a95660a04ee  xserver-xorg-video-imx-viv-5.0.11.p7.1.tar.gz
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index a3a3167..884b30e 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p4.5
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p7.1
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv xserver_xorg-server \
 	xproto_xproto xproto_xf86driproto libdrm
 XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = GPLv2+
+XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE_FILES = COPYING-GPL-2
 XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING = YES
 XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD = $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/EXA/src -f makefile.linux
 
