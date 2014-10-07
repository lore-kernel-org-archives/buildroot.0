From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Oct 2014 09:29:38 -0300
Subject: [Buildroot] [PATCH 03/19] qemu/arm-versatile: update to the latest
	versions
In-Reply-To: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412684994-28760-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../arm-versatile/{linux-3.16.config => linux-3.17.config}     |  2 +-
 board/qemu/arm-versatile/readme.txt                            |  2 +-
 configs/qemu_arm_versatile_defconfig                           | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename board/qemu/arm-versatile/{linux-3.16.config => linux-3.17.config} (98%)

diff --git a/board/qemu/arm-versatile/linux-3.16.config b/board/qemu/arm-versatile/linux-3.17.config
similarity index 98%
rename from board/qemu/arm-versatile/linux-3.16.config
rename to board/qemu/arm-versatile/linux-3.17.config
index 38c6466..e425d45 100644
--- a/board/qemu/arm-versatile/linux-3.16.config
+++ b/board/qemu/arm-versatile/linux-3.17.config
@@ -59,7 +59,7 @@ CONFIG_SND_PCM_OSS=m
 CONFIG_SND_ARMAACI=m
 CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=m
-CONFIG_EXT2_FS=y
+CONFIG_EXT4_FS=y
 CONFIG_VFAT_FS=m
 CONFIG_JFFS2_FS=y
 CONFIG_CRAMFS=y
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index d2eeb19..f2a5cd1 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.1.0
+Tested with QEMU 2.1.2
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 510e739..c3d90d7 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.16 headers to avoid breaking with newer kernels
+# Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.16.3"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
+BR2_DEFAULT_KERNEL_VERSION="3.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.16.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.17.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
2.0.4
