From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Feb 2016 18:59:28 +0000
Subject: [Buildroot] [PATCH v2 14/15] configs: Add a tested working
	STM32F469-DISCO defconfig
In-Reply-To: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1456167569-8713-15-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately, the toolchain built with Buildroot does not currently
support this platform.  Thus, the tested-working one is being referenced
instead.  Once the Buildroot toolchain works, this will be swapped out.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 configs/stm32f469_disco_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 configs/stm32f469_disco_defconfig

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
new file mode 100644
index 0000000..0b68fe0
--- /dev/null
+++ b/configs/stm32f469_disco_defconfig
@@ -0,0 +1,18 @@
+BR2_arm=y
+BR2_cortex_m3=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32/stm32f469-disco/patches/"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_LATEST_VERSION=y
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_GZIP=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_INTREE_DTS=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
+BR2_TARGET_AFBOOT_STM32=y
+BR2_PACKAGE_HOST_OPENOCD=y
-- 
1.9.1
