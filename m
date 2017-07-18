From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 18 Jul 2017 14:58:00 +0200
Subject: [Buildroot] [PATCH] kernel-module-imx-gpu-viv: bump revision to
	a05d9b23
Message-ID: <20170718125800.28223-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog since previous revision:
6a01dfb fix for memory leak in gc_hal_kernel_os.c
f73c35b Add support for PREEMPT_RT kernels

Also updating the help text to make sure users know this module won't
build with Mainline kernel but only with NXP forks.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

Let me know if the text is explicit enough as-is.

Also, I'm not sure if you'd rather have two patches for this (one for
the bump, the other for the help text update).

Regards,
Gary
---
 package/freescale-imx/kernel-module-imx-gpu-viv/Config.in             | 4 +++-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash          | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk            | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in b/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
index bcc55175bc..9872678623 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV
 
 	  This package uses an exact copy of the GPU kernel driver source code
 	  of the same version as base and include fixes and improvements
-	  developed by FSL Community
+	  developed by FSL Community.
+
+	  This module is only meant for NXP-based kernel up to 4.1.x.
 
 	  https://github.com/Freescale/kernel-module-imx-gpu-viv
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 9c43ea39e7..f9d400459e 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	51dd137bd67ae991fa58fff4151c6bd7dd46bafd613f43e83d8403ec37217a90  kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2.tar.gz
+sha256	0d45472a967d747bc1948b0332f77c8cd9f6ec1620b0922e82ca5ddd053b40ea  kernel-module-imx-gpu-viv-a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7.tar.gz
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index d23213424e..6dbf9a0271 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = bfa78b095a892705a09afe9514fc5d236b3124d2
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.11.0
