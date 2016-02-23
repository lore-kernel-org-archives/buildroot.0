From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 21:49:36 +0100
Subject: [Buildroot] [git commit] configs: atmel: ensure EABIhf is selected
	for sama5d*
Message-ID: <20160223210554.B386D8183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca57e0ba650c9a9596242009393f9501e157dd2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent changes in Config.in.arm regarding the VFP selection broke the
atmel_sama5d* defconfigs. Ensure EABIhf is selected as all the sama5 have a
vfp.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/atmel_sama5d3_xplained_defconfig     | 3 +--
 configs/atmel_sama5d3_xplained_mmc_defconfig | 2 +-
 configs/atmel_sama5d3xek_defconfig           | 3 +--
 configs/atmel_sama5d4_xplained_defconfig     | 3 +--
 configs/atmel_sama5d4ek_defconfig            | 3 +--
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index 74f613c..665a3d7 100644
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
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index a0c1329..1a75767 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a5=y
-BR2_ARM_EABIHF=y
+BR2_ARM_ENABLE_VFP=y
 
 # Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
index 64eabe8..193fa13 100644
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
index 67e2eb2..0991f86 100644
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
index 73d0a18..92b0840 100644
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
