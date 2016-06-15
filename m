From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] imx-vpu: bump to version 5.4.33
Message-ID: <20160615204850.4A3527FD1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77cb513912e2f02eb9fc4b2c9394ff03b1674b66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
VPU firmware has been changed to the format of Linux codec driver firmware.
Change VPU library to adapt to firmware format change.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/f5e1056

Implicitly tested through gstreamer as the plugins rely on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Andrew Webster <awebster@arcx.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index c828c2b..67ebaf2 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	f11b91dcdb84bfefd3c88f10a9c1c1bc3420e4bbaadc38b9280fb52f7769eca8  imx-vpu-5.4.32.bin
+sha256	2e670ef2337a5dbe6c32fa07128ad9aad32afdbf472c23d44133245ec6a66d46  imx-vpu-5.4.33.bin
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 949fefa..09ff5a8 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.32
+IMX_VPU_VERSION = 5.4.33
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
@@ -16,7 +16,7 @@ IMX_VPU_MAKE_ENV = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
 
-IMX_VPU_LICENSE = Freescale Semiconductor Software License Agreement
+IMX_VPU_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_LICENSE_FILES = EULA COPYING
 IMX_VPU_REDISTRIBUTE = NO
 
