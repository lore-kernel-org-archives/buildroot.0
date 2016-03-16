From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:50 +0100
Subject: [Buildroot] [PATCH 10/14] firmware-imx: bump to version 5.3
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-11-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Add basic epdc firmware copy to correct output path
- Move legacy epdc firmware to this package out of kernel
- VPU firmware upgrade to v3.1.1_r46070

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/0fdf829

This package has been implicitely tested through gstreamer as the
plugins rely on them for vpu decoding for instance:
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 3 +--
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 06d5a54..a5bc82c 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,2 +1 @@
-# locally computed
-sha256 8cc2df128c0e2d2f5224d73389fbe6e4d6fa9ede76f8c0a9adaf7ec0986d0f1f  firmware-imx-5.2.bin
+sha256 fd14c3666eb3c12f4f2665d95caf383bb1d0277bb12e2de28fefc8d1230604f2  firmware-imx-5.3.bin
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 35cfb6d..8f81c57 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 5.2
+FIRMWARE_IMX_VERSION = 5.3
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.7.0
