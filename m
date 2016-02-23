From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 23 Feb 2016 17:19:04 +0100
Subject: [Buildroot] [PATCH] configs: atmel: ensure EABIhf is selected for
	sama5d*
Message-ID: <1456244344-12726-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent changes in Config.in.arm regarding the VFP selection broke the
atmel_sama5d* defconfigs. Ensure EABIhf is selected as all the sama5 have a
vfp.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 configs/atmel_sama5d3_xplained_defconfig | 3 +--
 configs/atmel_sama5d3xek_defconfig       | 3 +--
 configs/atmel_sama5d4_xplained_defconfig | 3 +--
 configs/atmel_sama5d4ek_defconfig        | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index 74f613c55894..665a3d7cb33f 100644
--- a/configs/atmel_sama5d3_xplained_defconfig
+++ b/configs/atmel_sama5d3_xplained_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_a5=y
-BR2_ARM_EABIHF=y
-BR2_ARM_FPU_VFPV4D16=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
index 64eabe81dee5..193fa1365108 100644
--- a/configs/atmel_sama5d3xek_defconfig
+++ b/configs/atmel_sama5d3xek_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_a5=y
-BR2_ARM_EABIHF=y
-BR2_ARM_FPU_VFPV4D16=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
index 67e2eb2fbb89..0991f86fa682 100644
--- a/configs/atmel_sama5d4_xplained_defconfig
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -1,8 +1,7 @@
 BR2_arm=y
 BR2_cortex_a5=y
-BR2_ARM_EABIHF=y
 BR2_ARM_ENABLE_NEON=y
-BR2_ARM_FPU_VFPV4D16=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
diff --git a/configs/atmel_sama5d4ek_defconfig b/configs/atmel_sama5d4ek_defconfig
index 73d0a185190c..92b08400124f 100644
--- a/configs/atmel_sama5d4ek_defconfig
+++ b/configs/atmel_sama5d4ek_defconfig
@@ -1,8 +1,7 @@
 BR2_arm=y
 BR2_cortex_a5=y
-BR2_ARM_EABIHF=y
 BR2_ARM_ENABLE_NEON=y
-BR2_ARM_FPU_VFPV4D16=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
-- 
2.7.0
