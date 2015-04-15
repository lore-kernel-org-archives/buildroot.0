From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 14:05:09 -0300
Subject: [Buildroot] [PATCH 12/15] configs/qemu: update x86_64
In-Reply-To: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429117512-15472-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to kernel 4.0.
Enable evdev for extra X testing.
Drop bloat/redundant options.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86_64/linux-3.19.config | 63 -------------------------------------
 board/qemu/x86_64/linux-4.0.config  | 20 ++++++++++++
 board/qemu/x86_64/readme.txt        |  2 +-
 configs/qemu_x86_64_defconfig       | 10 +++---
 4 files changed, 26 insertions(+), 69 deletions(-)
 delete mode 100644 board/qemu/x86_64/linux-3.19.config
 create mode 100644 board/qemu/x86_64/linux-4.0.config

diff --git a/board/qemu/x86_64/linux-3.19.config b/board/qemu/x86_64/linux-3.19.config
deleted file mode 100644
index 602a9bb..0000000
--- a/board/qemu/x86_64/linux-3.19.config
+++ /dev/null
@@ -1,63 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-# CONFIG_SWAP is not set
-CONFIG_SYSVIPC=y
-# CONFIG_COMPAT_BRK is not set
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
-# CONFIG_X86_EXTENDED_PLATFORM is not set
-# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
-# CONFIG_MTRR_SANITIZER is not set
-# CONFIG_SECCOMP is not set
-# CONFIG_RELOCATABLE is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-# CONFIG_FIRMWARE_IN_KERNEL is not set
-# CONFIG_BLK_DEV is not set
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_ATA_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_NE2K_PCI=y
-CONFIG_8139CP=y
-# CONFIG_WLAN is not set
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO_SERPORT is not set
-# CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_HDA_INTEL=y
-# CONFIG_USB_SUPPORT is not set
-# CONFIG_X86_PLATFORM_DEVICES is not set
-# CONFIG_DMIID is not set
-CONFIG_EXT4_FS=y
-# CONFIG_DNOTIFY is not set
-# CONFIG_INOTIFY_USER is not set
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-# CONFIG_MISC_FILESYSTEMS is not set
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
-# CONFIG_ENABLE_MUST_CHECK is not set
-# CONFIG_UNUSED_SYMBOLS is not set
-# CONFIG_FRAME_POINTER is not set
-# CONFIG_X86_VERBOSE_BOOTUP is not set
-# CONFIG_VIRTUALIZATION is not set
diff --git a/board/qemu/x86_64/linux-4.0.config b/board/qemu/x86_64/linux-4.0.config
new file mode 100644
index 0000000..ce19f81
--- /dev/null
+++ b/board/qemu/x86_64/linux-4.0.config
@@ -0,0 +1,20 @@
+CONFIG_SYSVIPC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 626ec2f..d397a79 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 8cb777a..01ffcc0 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,14 +9,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.0.config"
-- 
2.0.5
