From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:49 +0100
Subject: [Buildroot] [PATCH 09/14] imx-vpu: bump to version 5.4.32
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-10-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Support AVcVuiInfo for Decoder through DecInitialInfo or DecOutputInfo
- Clear structure iram IOGetIramBase() fails to set them to avoid
using uninitialized variables.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/be030922

This package has been implicitely tested through gstreamer as the
plugins rely on it for vpu decoding:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index 3fdd092..c828c2b 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a266ab317fbd866541eae506d68983bcd361f49d1162a66bb34cb8088ceec88c imx-vpu-5.4.31.bin
+sha256	f11b91dcdb84bfefd3c88f10a9c1c1bc3420e4bbaadc38b9280fb52f7769eca8  imx-vpu-5.4.32.bin
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 571cc40..949fefa 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.31
+IMX_VPU_VERSION = 5.4.32
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
-- 
2.7.0
