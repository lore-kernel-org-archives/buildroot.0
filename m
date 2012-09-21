From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 11:54:21 -0300
Subject: [Buildroot] [PATCH 01/11] qemu/arm-versatile: update to use kernel
	3.5.4
Message-ID: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-3.3.config => linux-3.5.config}         |    0
 configs/qemu_arm_versatile_defconfig               |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/qemu/arm-versatile/{linux-3.3.config => linux-3.5.config} (100%)

diff --git a/board/qemu/arm-versatile/linux-3.3.config b/board/qemu/arm-versatile/linux-3.5.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.3.config
rename to board/qemu/arm-versatile/linux-3.5.config
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 5385f28..2037565 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_3=y
+# Lock to 3.5 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.5.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.8.6
