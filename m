From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:38:42 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-imx-viv: bump to
	version 5.0.11 p4.5
Message-ID: <20150919134123.715CC7FC34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5abe552d49118498dcf2d54948a0494656dab29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Modify the version to match the version of imx-gpu-viv. Also add the
package hash file.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/45582680

The following xorg.conf was used in order to force the use of the
vivante module:
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

Note that the X server must be started with the "noreset" option to
avoid crashes when closing X apps.
 # X -noreset

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-imx-viv.hash                |    2 ++
 .../xdriver_xf86-video-imx-viv.mk                  |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
new file mode 100644
index 0000000..9b3c7d3
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	1a0b25a91b493e99dfa94a802290320ea998ebd45d7aab0f73d7c7bb521b7e84  xserver-xorg-video-imx-viv-5.0.11.p4.5.tar.gz
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index f5cb946..a3a3167 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = $(FREESCALE_IMX_VERSION)
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p4.5
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv xserver_xorg-server \
