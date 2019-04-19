From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Fri, 19 Apr 2019 15:27:16 +0530
Subject: [Buildroot] [PATCH 2/4] configs/amarula_vyasa_rk3288: Bump to linux
 5.0 and uboot 2019.01
In-Reply-To: <20190419095718.8444-1-shyam.saini@amarulasolutions.com>
References: <20190419095718.8444-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190419095718.8444-2-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to linux/linux-headers 5.0 and u-boot version 2019.01
and use mainline linux.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index c70958d530..1394cd860a 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_KERNEL_HEADERS_4_14=y
+# Linux headers same as kernel, a 5.0 series
+BR2_KERNEL_HEADERS_5_0=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -21,8 +21,8 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,openedev,linux-openedev,d127129e85a020879f334154300ddd3f7ec21c1e)/linux-d127129e85a020879f334154300ddd3f7ec21c1e.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-- 
2.11.0
