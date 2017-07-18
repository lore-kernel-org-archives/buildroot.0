From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:46:51 +0200
Subject: [Buildroot] [git commit] kernel-module-imx-gpu-viv: bump revision
	to a05d9b23
Message-ID: <20170718214252.7F59B7FF7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11f1ec7bc0c89d6526e52aac776eb1a5c97094bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog since previous revision:
6a01dfb fix for memory leak in gc_hal_kernel_os.c
f73c35b Add support for PREEMPT_RT kernels

Also updating the help text to make sure users know this module won't
build with Mainline kernel but only with NXP forks.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/kernel-module-imx-gpu-viv/Config.in             | 4 +++-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash          | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk            | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in b/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
index bcc5517..9872678 100644
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
index 9c43ea3..f9d4004 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	51dd137bd67ae991fa58fff4151c6bd7dd46bafd613f43e83d8403ec37217a90  kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2.tar.gz
+sha256	0d45472a967d747bc1948b0332f77c8cd9f6ec1620b0922e82ca5ddd053b40ea  kernel-module-imx-gpu-viv-a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7.tar.gz
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index d232134..6dbf9a0 100644
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
