From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:44 +0100
Subject: [Buildroot] [PATCH 04/14] imx-gpu-viv: bump version to 5.0.11 p7.4
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-5-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is released with 3.14.52-1.1.0_ga release.

Includes many of the bug fixes and stability improvements.
For more information refer to i.MX Linux Release Notes from NXP website:
L3.14.52_1.1.0_LINUX_DOCS package is under Supporting Information.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/f1161869

This package has been tested with both X11 and Framebuffer backends:
 # cd /usr/share/examples/viv_samples/vdk/
 # apitrace trace --api egl ./tutorial7
 # gmem_info
 ... display memory use per PID ...
 #?apitrace replay tutorial7.trace
 #?eglretrace tutorial7.trace

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 4 ++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 149afc2..4119388 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256	43fea6ebbb1222e0f594fff3b48147f4bb6173b85f2caa9fa6bf04a1c85ee93a  imx-gpu-viv-5.0.11.p7.1-sfp.bin
-sha256	e49ca1d31ca83bb50f6672325db37ae3754eb9073ad98a37790ab1209ea5cba8  imx-gpu-viv-5.0.11.p7.1-hfp.bin
+sha256	3ea201f91ce9b56455e4983ab1055e8175415fbbf2800dc097d47e78ceefba34  imx-gpu-viv-5.0.11.p7.4-sfp.bin
+sha256	b80838104f2f2e3b0baf2f1aacdca263c1c92589ce919b3be40aaad23f686b7f  imx-gpu-viv-5.0.11.p7.4-hfp.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 6171080..84ac53f 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_BASE_VERSION = 5.0.11.p7.1
+IMX_GPU_VIV_BASE_VERSION = 5.0.11.p7.4
 ifeq ($(BR2_ARM_EABIHF),y)
 IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-hfp
 else
-- 
2.7.0
