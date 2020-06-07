From: Joris Offouga <offougajoris@gmail.com>
Date: Sun,  7 Jun 2020 17:06:14 +0200
Subject: [Buildroot] [PATCH 5/5] configs/stm32mp157c_dk2: Bump Kernel and
 U-Boot
In-Reply-To: <20200607150614.410703-1-offougajoris@gmail.com>
References: <20200607150614.410703-1-offougajoris@gmail.com>
Message-ID: <20200607150614.410703-5-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kernel to version 5.7.1 and U-Boot to 2020.04

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 configs/stm32mp157c_dk2_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index d38fa5bab4..ca72049cb2 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.26"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^metadata_csum"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.25.1
