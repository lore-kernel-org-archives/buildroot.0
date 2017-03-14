From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:58:56 -0700
Subject: [Buildroot] [PATCH] configs/qemu: update xtensa linux to 4.9
Message-ID: <1489517936-4563-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux configs are missing memmap= option that is required for xtfpga
boards configured w/o device tree starting with linux-4.9. Add it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 board/qemu/xtensa-lx60/linux-4.8-nommu.config | 37 --------------------------
 board/qemu/xtensa-lx60/linux-4.8.config       | 36 -------------------------
 board/qemu/xtensa-lx60/linux-4.9-nommu.config | 38 +++++++++++++++++++++++++++
 board/qemu/xtensa-lx60/linux-4.9.config       | 36 +++++++++++++++++++++++++
 configs/qemu_xtensa_lx60_defconfig            |  8 +++---
 configs/qemu_xtensa_lx60_nommu_defconfig      |  8 +++---
 6 files changed, 82 insertions(+), 81 deletions(-)
 delete mode 100644 board/qemu/xtensa-lx60/linux-4.8-nommu.config
 delete mode 100644 board/qemu/xtensa-lx60/linux-4.8.config
 create mode 100644 board/qemu/xtensa-lx60/linux-4.9-nommu.config
 create mode 100644 board/qemu/xtensa-lx60/linux-4.9.config

diff --git a/board/qemu/xtensa-lx60/linux-4.8-nommu.config b/board/qemu/xtensa-lx60/linux-4.8-nommu.config
deleted file mode 100644
index 29f6fa4..0000000
--- a/board/qemu/xtensa-lx60/linux-4.8-nommu.config
+++ /dev/null
@@ -1,37 +0,0 @@
-CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_XTENSA_VARIANT_CUSTOM=y
-CONFIG_XTENSA_VARIANT_CUSTOM_NAME="dc233c"
-# CONFIG_XTENSA_VARIANT_MMU is not set
-CONFIG_XTENSA_UNALIGNED_USER=y
-CONFIG_PREEMPT=y
-# CONFIG_PCI is not set
-CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon=uart8250,mmio32,0xfd050020,115200n8 console=ttyS0,115200n8"
-CONFIG_DEFAULT_MEM_START=0x00000000
-CONFIG_BINFMT_FLAT=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_IPV6 is not set
-CONFIG_NETFILTER=y
-CONFIG_DNS_RESOLVER=y
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_NETDEVICES=y
-CONFIG_MARVELL_PHY=y
-# CONFIG_WLAN is not set
-CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_TMPFS=y
-CONFIG_FANOTIFY=y
-CONFIG_PRINTK_TIME=y
-# CONFIG_S32C1I_SELFTEST is not set
diff --git a/board/qemu/xtensa-lx60/linux-4.8.config b/board/qemu/xtensa-lx60/linux-4.8.config
deleted file mode 100644
index 2d8e58d..0000000
--- a/board/qemu/xtensa-lx60/linux-4.8.config
+++ /dev/null
@@ -1,36 +0,0 @@
-# CONFIG_SWAP is not set
-# CONFIG_CROSS_MEMORY_ATTACH is not set
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_XTENSA_VARIANT_DC233C=y
-CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX=y
-CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,38400"
-# CONFIG_COMPACTION is not set
-# CONFIG_BOUNCE is not set
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_NETDEVICES=y
-# CONFIG_WLAN is not set
-CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_LD_NO_RELAX=y
-# CONFIG_S32C1I_SELFTEST is not set
diff --git a/board/qemu/xtensa-lx60/linux-4.9-nommu.config b/board/qemu/xtensa-lx60/linux-4.9-nommu.config
new file mode 100644
index 0000000..10f7ee1
--- /dev/null
+++ b/board/qemu/xtensa-lx60/linux-4.9-nommu.config
@@ -0,0 +1,38 @@
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_XTENSA_VARIANT_CUSTOM=y
+CONFIG_XTENSA_VARIANT_CUSTOM_NAME="dc233c"
+# CONFIG_XTENSA_VARIANT_MMU is not set
+CONFIG_XTENSA_UNALIGNED_USER=y
+CONFIG_PREEMPT=y
+CONFIG_KERNEL_LOAD_ADDRESS=0x00003000
+# CONFIG_PCI is not set
+CONFIG_XTENSA_PLATFORM_XTFPGA=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlycon=uart8250,mmio32,0xfd050020,115200n8 console=ttyS0,115200n8 memmap=0x04000000 at 0"
+CONFIG_DEFAULT_MEM_START=0x00000000
+CONFIG_BINFMT_FLAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_NETFILTER=y
+CONFIG_DNS_RESOLVER=y
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_NETDEVICES=y
+CONFIG_MARVELL_PHY=y
+# CONFIG_WLAN is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
+CONFIG_FANOTIFY=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_S32C1I_SELFTEST is not set
diff --git a/board/qemu/xtensa-lx60/linux-4.9.config b/board/qemu/xtensa-lx60/linux-4.9.config
new file mode 100644
index 0000000..625b860
--- /dev/null
+++ b/board/qemu/xtensa-lx60/linux-4.9.config
@@ -0,0 +1,36 @@
+# CONFIG_SWAP is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_XTENSA_VARIANT_DC233C=y
+CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX=y
+CONFIG_XTENSA_PLATFORM_XTFPGA=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="console=ttyS0,38400 memmap=0x04000000 at 0"
+# CONFIG_COMPACTION is not set
+# CONFIG_BOUNCE is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+# CONFIG_WLAN is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_LD_NO_RELAX=y
+# CONFIG_S32C1I_SELFTEST is not set
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 54d844d..db06e90 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,15 +16,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.9.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 256cbee..55714a1 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -20,15 +20,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.8-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.9-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
-- 
2.1.4
