From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Oct 2014 09:29:40 -0300
Subject: [Buildroot] [PATCH 05/19] qemu/microblazebe-mmu: update to the
	latest versions
In-Reply-To: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412684994-28760-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../microblazebe-mmu/{linux-3.16.config => linux-3.17.config}  |  4 ----
 board/qemu/microblazebe-mmu/readme.txt                         |  2 +-
 configs/qemu_microblazebe_mmu_defconfig                        | 10 +++++-----
 3 files changed, 6 insertions(+), 10 deletions(-)
 rename board/qemu/microblazebe-mmu/{linux-3.16.config => linux-3.17.config} (92%)

diff --git a/board/qemu/microblazebe-mmu/linux-3.16.config b/board/qemu/microblazebe-mmu/linux-3.17.config
similarity index 92%
rename from board/qemu/microblazebe-mmu/linux-3.16.config
rename to board/qemu/microblazebe-mmu/linux-3.17.config
index d7e3235..fc25c9d 100644
--- a/board/qemu/microblazebe-mmu/linux-3.16.config
+++ b/board/qemu/microblazebe-mmu/linux-3.17.config
@@ -3,7 +3,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
-CONFIG_INITRAMFS_COMPRESSION_GZIP=y
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_BASE_FULL is not set
@@ -32,11 +31,9 @@ CONFIG_UNIX=y
 CONFIG_INET=y
 # CONFIG_INET_LRO is not set
 # CONFIG_IPV6 is not set
-CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_NETDEVICES=y
-CONFIG_NET_VENDOR_XILINX=y
 CONFIG_XILINX_EMACLITE=y
 # CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
@@ -46,7 +43,6 @@ CONFIG_SERIAL_UARTLITE_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_NFS_FS=y
 CONFIG_CIFS=y
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 66a2f9b..eec9175 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.0
+Tested with QEMU 2.1.2
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 4f78c32..176e16d 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
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
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.16.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.17.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
-- 
2.0.4
