From: Andrew Webster <awebster@arcx.com>
Date: Fri, 10 Jun 2016 14:12:14 -0400
Subject: [Buildroot] [PATCH v2 08/14] imx-vpu: bump to version 5.4.33
In-Reply-To: <cover.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
Message-ID: <6c346c15852f06257f0f42601439319ec247f258.1465578220.git.awebster@arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - added test procedure to comment

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
 
-- 
1.9.1
