From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 30 Jul 2018 15:01:41 +0200
Subject: [Buildroot] [PATCH v3 2/5] imx-vpu: bump version to 5.4.38
In-Reply-To: <20180730130144.31110-1-gary.bisson@boundarydevices.com>
References: <20180730130144.31110-1-gary.bisson@boundarydevices.com>
Message-ID: <20180730130144.31110-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No changelog provided by NXP.
Added COPYING hash value to track license changes.
Reworked the help text to specify which CPU has Chips&Media VPU.
Also removed the dependency on BR2_arm as
BR2_PACKAGE_FREESCALE_IMX_HAS_VPU is sufficient.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-vpu/Config.in    | 13 +++++--------
 package/freescale-imx/imx-vpu/imx-vpu.hash |  3 ++-
 package/freescale-imx/imx-vpu/imx-vpu.mk   |  2 +-
 3 files changed, 8 insertions(+), 10 deletions(-)

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
index 0ac0f3d0c2..822286dceb 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	ee265e88d17c7369bd9cb917e7cce035b8c7ee2ba4491645fdab9f382f54beb0  imx-vpu-5.4.37.bin
+sha256  34bed0ddf6c797f444bddfa5d5495adc751ff268b6431d8beb48129c89c9e47f  imx-vpu-5.4.38.bin
+sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
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
 
-- 
2.18.0
