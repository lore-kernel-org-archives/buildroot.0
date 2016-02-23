From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 22:05:11 +0100
Subject: [Buildroot] [git commit] configs: ensure ARM EABIhf is enabled for
	configurations using cortex A9
Message-ID: <20160223210554.C2668802DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f143be8a09c093d94d33e09c547f304305b7b6c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the issue with the Atmel A5 based boards, the VFP is optional on
A9 - So we need to enable it to be able to use EABIhf.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/altera_socdk_defconfig    | 2 +-
 configs/altera_sockit_defconfig   | 2 +-
 configs/riotboard_defconfig       | 2 +-
 configs/udoo_quad_defconfig       | 3 +--
 configs/via_imx6_vab820_defconfig | 3 +--
 configs/xilinx_zc706_defconfig    | 2 +-
 6 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/configs/altera_socdk_defconfig b/configs/altera_socdk_defconfig
index f1916df..6b05a27 100644
--- a/configs/altera_socdk_defconfig
+++ b/configs/altera_socdk_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 
-BR2_ARM_EABIHF=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_NEON=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index d2f219f..6bd3a71 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 
-BR2_ARM_EABIHF=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_NEON=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index b6d69a8..73677c7 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -1,7 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_ARM_EABIHF=y
+BR2_ARM_ENABLE_VFP=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/udoo_quad_defconfig b/configs/udoo_quad_defconfig
index bcc1923..6cb05be 100644
--- a/configs/udoo_quad_defconfig
+++ b/configs/udoo_quad_defconfig
@@ -1,8 +1,7 @@
 # Architceture
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_ARM_EABIHF=y
-BR2_ARM_FPU_VFPV3=y
+BR2_ARM_ENABLE_VFP=y
 
 # Linux headers same as kernel, a 3.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
index 268b96e..d2f62c5 100644
--- a/configs/via_imx6_vab820_defconfig
+++ b/configs/via_imx6_vab820_defconfig
@@ -1,8 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_ARM_EABIHF=y
-BR2_ARM_FPU_VFPV3=y
+BR2_ARM_ENABLE_VFP=y
 
 # Linux headers same as kernel, a 3.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
diff --git a/configs/xilinx_zc706_defconfig b/configs/xilinx_zc706_defconfig
index 5563dc8..d1a46ca 100644
--- a/configs/xilinx_zc706_defconfig
+++ b/configs/xilinx_zc706_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_ARM_EABIHF=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_ENABLE_NEON=y
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
