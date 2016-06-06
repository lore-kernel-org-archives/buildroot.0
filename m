From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jun 2016 21:39:06 +0200
Subject: [Buildroot] [git commit] configs/minnowboard_max: bump kernel to
	4.6.1
Message-ID: <20160606195009.01A8C818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bdbee2311ed4ad7737b63116c36950384f25be2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, rebase kernel config and adapt kernel command line in grub config file
to follow mmc numbering change.

[Peter: drop now unused linux-4.4.config]
Signed-off-by: Vincent Stehl?? <vincent.stehle@intel.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard/grub-minnowboard-max.cfg               | 2 +-
 board/minnowboard/{linux-4.4.config => linux-4.6.config} | 3 +--
 configs/minnowboard_max-graphical_defconfig              | 6 +++---
 configs/minnowboard_max_defconfig                        | 8 ++++----
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/board/minnowboard/grub-minnowboard-max.cfg b/board/minnowboard/grub-minnowboard-max.cfg
index f38db8f..3d6feb7 100644
--- a/board/minnowboard/grub-minnowboard-max.cfg
+++ b/board/minnowboard/grub-minnowboard-max.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /bzImage root=/dev/mmcblk0p2 rootwait console=tty0 console=ttyS0,115200
+	linux /bzImage root=/dev/mmcblk2p2 rootwait console=tty0 console=ttyS0,115200
 }
diff --git a/board/minnowboard/linux-4.4.config b/board/minnowboard/linux-4.6.config
similarity index 98%
rename from board/minnowboard/linux-4.4.config
rename to board/minnowboard/linux-4.6.config
index 3498423..3bc1ffd 100644
--- a/board/minnowboard/linux-4.4.config
+++ b/board/minnowboard/linux-4.6.config
@@ -28,8 +28,8 @@ CONFIG_I2C_I801=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_DESIGNWARE_PCI=y
 CONFIG_SPI=y
-CONFIG_SPI_PXA2XX=y
 CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_PXA2XX=y
 CONFIG_PINCTRL_BAYTRAIL=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
@@ -52,5 +52,4 @@ CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PCI=y
 CONFIG_MMC_SDHCI_ACPI=y
 CONFIG_PWM=y
-CONFIG_PWM_LPSS=y
 CONFIG_EXT4_FS=y
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 8634c54..a5f60a7 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -3,7 +3,7 @@ BR2_x86_64=y
 BR2_x86_atom=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
@@ -23,9 +23,9 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Linux
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.6.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 7c418c5..1bb22f9 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -9,8 +9,8 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard-max"
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
@@ -22,9 +22,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.6.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
