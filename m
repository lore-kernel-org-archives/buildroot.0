From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 25 Jul 2018 17:01:47 +0200
Subject: [Buildroot] [PATCH 6/8] imx-vpuwrap: bump version to 4.3.5
In-Reply-To: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
Message-ID: <20180725150149.30774-7-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No changelog provided for 4.3.5 but it can now builds against the
following VPU backeds:
- Chips&Media
- Hantro
- Amphion (not supported in BR yet)

Changes in 4.3.2:
- Add vpu_wrapper_test
- Add gst_dump tools
- Add gl sink
- Enable RMVB/VC1/DIVX3
- Add webp support

Changes in 4.3.4:
- set hasColorDesc and fullRange in VPU_DecGetInitialInfo.
- Fix H264 failure due to too many MBI buffers.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-vpuwrap/Config.in        | 4 ++--
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash | 3 ++-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpuwrap/Config.in b/package/freescale-imx/imx-vpuwrap/Config.in
index 87303cca9d..54050bf7af 100644
--- a/package/freescale-imx/imx-vpuwrap/Config.in
+++ b/package/freescale-imx/imx-vpuwrap/Config.in
@@ -1,5 +1,5 @@
 comment "imx-vpuwrap needs an imx-specific Linux kernel to be built"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
 comment "imx-vpuwrap needs an i.MX VPU backend provider"
@@ -9,7 +9,7 @@ comment "imx-vpuwrap needs an i.MX VPU backend provider"
 config BR2_PACKAGE_IMX_VPUWRAP
 	bool "imx-vpuwrap"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_arm || BR2_aarch64 # Only relevant for i.MX
 	depends on BR2_PACKAGE_HAS_IMX_VPU
 	help
 	  Wrapper library for the vpu library, giving it a different
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
index 2999984d2c..28c73c002c 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256	282e7f8766ce385d8752bd29f04ddeff709ece0846be97547cf982183bbe241e  imx-vpuwrap-1.0.68.bin
+sha256  5c08b4b7c771404c998779f0e27a75564b57958d463e2df152c910d76cca9e44  imx-vpuwrap-4.3.5.bin
+sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index edba87279f..e456f67cfd 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPUWRAP_VERSION = 1.0.68
+IMX_VPUWRAP_VERSION = 4.3.5
 IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
 IMX_VPUWRAP_DEPENDENCIES = imx-vpu
-- 
2.18.0
