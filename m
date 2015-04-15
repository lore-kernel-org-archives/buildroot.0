From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 14:05:05 -0300
Subject: [Buildroot] [PATCH 08/15] configs/qemu: update sh4 r2d
In-Reply-To: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429117512-15472-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to kernel 4.0.
Simplify kernel config to reduce bloat.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/sh4-r2d/linux-3.19.config | 71 ------------------------------------
 board/qemu/sh4-r2d/linux-4.0.config  | 38 +++++++++++++++++++
 board/qemu/sh4-r2d/readme.txt        |  2 +-
 configs/qemu_sh4_r2d_defconfig       | 10 ++---
 4 files changed, 44 insertions(+), 77 deletions(-)
 delete mode 100644 board/qemu/sh4-r2d/linux-3.19.config
 create mode 100644 board/qemu/sh4-r2d/linux-4.0.config

diff --git a/board/qemu/sh4-r2d/linux-3.19.config b/board/qemu/sh4-r2d/linux-3.19.config
deleted file mode 100644
index 5a98a69..0000000
--- a/board/qemu/sh4-r2d/linux-3.19.config
+++ /dev/null
@@ -1,71 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SLAB=y
-CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
-CONFIG_MODULES=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_CPU_SUBTYPE_SH7751R=y
-CONFIG_MEMORY_START=0x0c000000
-CONFIG_FLATMEM_MANUAL=y
-CONFIG_SH_RTS7751R2D=y
-CONFIG_RTS7751R2D_PLUS=y
-CONFIG_HEARTBEAT=y
-CONFIG_PCI=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-# CONFIG_INET_LRO is not set
-# CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_FW_LOADER=m
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_PATA_PLATFORM=y
-CONFIG_NETDEVICES=y
-CONFIG_8139CP=y
-# CONFIG_WLAN is not set
-# CONFIG_INPUT_MOUSEDEV is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_SH_SCI_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_SPI=y
-CONFIG_SPI_SH_SCI=y
-CONFIG_MFD_SM501=y
-CONFIG_FB=y
-CONFIG_FB_SH_MOBILE_LCDC=m
-CONFIG_FB_SH_MOBILE_HDMI=m
-CONFIG_FB_SM501=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-CONFIG_SOUND=y
-CONFIG_SND_YMFPCI=m
-CONFIG_SOUND_PRIME=m
-CONFIG_USB=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_R9701=y
-CONFIG_EXT4_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_MINIX_FS=y
-CONFIG_NLS_CODEPAGE_932=y
-CONFIG_DEBUG_FS=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-CONFIG_CRC_T10DIF=y
diff --git a/board/qemu/sh4-r2d/linux-4.0.config b/board/qemu/sh4-r2d/linux-4.0.config
new file mode 100644
index 0000000..a3d6544
--- /dev/null
+++ b/board/qemu/sh4-r2d/linux-4.0.config
@@ -0,0 +1,38 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_CPU_SUBTYPE_SH7751R=y
+CONFIG_MEMORY_START=0x0c000000
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_SH_RTS7751R2D=y
+CONFIG_RTS7751R2D_PLUS=y
+CONFIG_HEARTBEAT=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_PATA_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_8139CP=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_SH_SCI_CONSOLE=y
+CONFIG_SPI=y
+CONFIG_SPI_SH_SCI=y
+CONFIG_MFD_SM501=y
+CONFIG_FB=y
+CONFIG_FB_SH_MOBILE_LCDC=y
+CONFIG_FB_SH_MOBILE_HDMI=y
+CONFIG_FB_SM501=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+CONFIG_SOUND=y
+CONFIG_SND_YMFPCI=y
+CONFIG_SOUND_PRIME=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_R9701=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index c256f0b..b7476b9 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 88bf914..928a82d 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -14,15 +14,15 @@ BR2_TARGET_ROOTFS_EXT2=y
 # doesn't use floating point operations.
 BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.0.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
2.0.5
