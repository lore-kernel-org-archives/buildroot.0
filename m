From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 22:13:05 +0100
Subject: [Buildroot] [PATCH] configs/orangepi_{lite2,
 one_plus}: use correct kernel headers version
Message-ID: <20190222211305.15300-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the following commits:

85f4bd9425b4ee74839202ab012d193a0175c5fa configs/orangepi_lite2: fix kernel headers option
506cdeb2d08811f309c6dc80c0098bf1ccdee21a configs/orangepi_one_plus: fix kernel headers option

We fixed the orangepi_lite2 and orangepi_one_plus defconfigs to use
the BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_X_Y option. However, we were
mistaken by the existing comment saying that 4.18 kernel headers
should be used. This was wrong, as the kernel source code in use is
4.19, so this commit fixes the
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_X_Y to use the correct version.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/165766089
  https://gitlab.com/buildroot.org/buildroot/-/jobs/165766093

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_lite2_defconfig    | 4 ++--
 configs/orangepi_one_plus_defconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
index 2d4ae70eab..c6be1c46b4 100644
--- a/configs/orangepi_lite2_defconfig
+++ b/configs/orangepi_lite2_defconfig
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
diff --git a/configs/orangepi_one_plus_defconfig b/configs/orangepi_one_plus_defconfig
index 30c422efc2..1084d42233 100644
--- a/configs/orangepi_one_plus_defconfig
+++ b/configs/orangepi_one_plus_defconfig
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-- 
2.20.1
