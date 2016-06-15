From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] firmware-imx: bump to version 5.4
Message-ID: <20160615204849.26FC07FD1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7d08f9d935cb479de4c9f5e6c2b560e7b90e608
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Upgrade to FW v3.1.1_r46072
- v3.1.1_r46070 plus 2 patches 391/392
- FSLARIK-391 [Decoder/H.264] VPU is always busy when decoding an
erroneous H264 bitstream
- FSLARIK-392 [Decoder/VC1] VPU outputs only 1 picture
- Change to the format of Linux coda driver firmware

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/dbb8773

Implicitly tested through gstreamer as the plugin relies on it:
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Andrew Webster <awebster@arcx.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index a5bc82c..a6e5bd5 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1 +1 @@
-sha256 fd14c3666eb3c12f4f2665d95caf383bb1d0277bb12e2de28fefc8d1230604f2  firmware-imx-5.3.bin
+sha256 c5bd4bff48cce9715a5d6d2c190ff3cd2262c7196f7facb9b0eda231c92cc223  firmware-imx-5.4.bin
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 8f81c57..1893929 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 5.3
+FIRMWARE_IMX_VERSION = 5.4
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
-	Atheros license (ath6k)
+FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
 FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
