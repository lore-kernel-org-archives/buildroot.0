From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Nov 2012 17:25:41 -0300
Subject: [Buildroot] [PATCH 08/11] qemu/arm-versatile: update to use kernel
	3.6.6
In-Reply-To: <1353011144-28584-1-git-send-email-gustavo@zacarias.com.ar>
References: <1353011144-28584-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1353011144-28584-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-3.5.config => linux-3.6.config}         |    0
 board/qemu/arm-versatile/readme.txt                |    2 ++
 configs/qemu_arm_versatile_defconfig               |    8 ++++----
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename board/qemu/arm-versatile/{linux-3.5.config => linux-3.6.config} (100%)

diff --git a/board/qemu/arm-versatile/linux-3.5.config b/board/qemu/arm-versatile/linux-3.6.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.5.config
rename to board/qemu/arm-versatile/linux-3.6.config
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 2ca5dec..7868204 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -4,3 +4,5 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
+
+Tested with QEMU 1.2.0
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 2037565..85efa2b 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.5 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_5=y
+# Lock to 3.6 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.6.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.8.6
