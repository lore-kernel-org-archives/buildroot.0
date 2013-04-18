From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Apr 2013 10:13:05 -0300
Subject: [Buildroot] [PATCH] qemu/arm-versatile: update to use kernel 3.8.8
Message-ID: <1366290785-14346-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The IRQ mapping failures have been fixed in 3.8.8 so update it to the
latest kernel series.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-versatile/{linux-3.7.config => linux-3.8.config} | 0
 configs/qemu_arm_versatile_defconfig                            | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename board/qemu/arm-versatile/{linux-3.7.config => linux-3.8.config} (100%)

diff --git a/board/qemu/arm-versatile/linux-3.7.config b/board/qemu/arm-versatile/linux-3.8.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.7.config
rename to board/qemu/arm-versatile/linux-3.8.config
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index ff264c7..db18d5b 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -11,12 +11,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.8.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.1.5
