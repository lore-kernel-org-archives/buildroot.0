From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 19:27:46 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-imx-viv: bump version
	to 5.0.11.p8.6
Message-ID: <20161101182816.D765180DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8182b741b021616beea06c927e4b199e18869675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/0c40332c

The following xorg.conf was used in order to force the use of the
vivante module:
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

Note that the X server must be started with the "noreset" option to
avoid crashes when closing X apps.
Tested with:
 # X -noreset &
 # cd /usr/share/examples/viv_samples/vdk/
 # DISPLAY=:0 ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash    | 2 +-
 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index 2cdf2d0..7d7da84 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1 +1 @@
-sha256	ddb6de9e00ce0b22f6c905eaf6694424413eade53ef6cd3b36e20ac99dcc0e0f  xserver-xorg-video-imx-viv-5.0.11.p8.4.tar.gz
+sha256	3eed38193e31bb5ba8d2c817bd9b4f6e2fe7540d2cab36de9098cb4f11946a9f  xserver-xorg-video-imx-viv-5.0.11.p8.6.tar.gz
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index 9ce08ef..2a3e997 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p8.4
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p8.6
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv xserver_xorg-server \
