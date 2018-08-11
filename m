From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 19:36:09 +0200
Subject: [Buildroot] [git commit branch/next] imx-vpu: bump version to 5.4.38
Message-ID: <20180812121126.86B048B909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea9efdf5675df29e6b4b7e48616a4f5da922c22f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

No changelog provided by NXP.
Added COPYING hash value to track license changes.
Reworked the help text to specify which CPU has Chips&Media VPU.
Also removed the dependency on BR2_arm as
BR2_PACKAGE_FREESCALE_IMX_HAS_VPU is sufficient.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
[Thomas: add hash for EULA file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-vpu/Config.in    | 13 +++++--------
 package/freescale-imx/imx-vpu/imx-vpu.hash |  4 +++-
 package/freescale-imx/imx-vpu/imx-vpu.mk   |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
index 779717f5ed..dd3507eb96 100644
--- a/package/freescale-imx/imx-vpu/Config.in
+++ b/package/freescale-imx/imx-vpu/Config.in
@@ -1,17 +1,14 @@
 comment "imx-vpu needs an i.MX platform with VPU support"
-	depends on BR2_arm
 	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 
 config BR2_PACKAGE_IMX_VPU
 	bool "imx-vpu"
-	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_FIRMWARE_IMX
 	help
-	  Library of userspace helpers specific for the Freescale i.MX
-	  platform. It wraps the kernel interfaces for the i.MX platform
-	  Video Processing Unit (VPU) driver. It requires a kernel that
-	  includes the i.MX specific headers to be built.
+	  Library of userspace helpers specific for the NXP i.MX SoC
+	  integrating a Chips&Media CODA Video Processing Unit (VPU)
+	  such as the i.MX27/i.MX5x/i.MX6x.
 
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
+	  This library is provided by NXP as-is and doesn't have an
+	  upstream.
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index 0ac0f3d0c2..5fa93d8055 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256	ee265e88d17c7369bd9cb917e7cce035b8c7ee2ba4491645fdab9f382f54beb0  imx-vpu-5.4.37.bin
+sha256  34bed0ddf6c797f444bddfa5d5495adc751ff268b6431d8beb48129c89c9e47f  imx-vpu-5.4.38.bin
+sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
+sha256  fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 2bcfe53eba..e30237508e 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.37
+IMX_VPU_VERSION = 5.4.38
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
