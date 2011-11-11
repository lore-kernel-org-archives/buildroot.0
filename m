From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Nov 2011 16:55:12 -0300
Subject: [Buildroot] [PATCH 2/2] qemu_x86_64: add new sample
In-Reply-To: <1321041312-3297-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321041312-3297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321041312-3297-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86_64/linux-3.1.config |   67 ++++++++++++++++++++++++++++++++++++
 board/qemu/x86_64/readme.txt       |    5 +++
 configs/qemu_x86_64_defconfig      |   17 +++++++++
 3 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/x86_64/linux-3.1.config
 create mode 100644 board/qemu/x86_64/readme.txt
 create mode 100644 configs/qemu_x86_64_defconfig

diff --git a/board/qemu/x86_64/linux-3.1.config b/board/qemu/x86_64/linux-3.1.config
new file mode 100644
index 0000000..5bf6944
--- /dev/null
+++ b/board/qemu/x86_64/linux-3.1.config
@@ -0,0 +1,67 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_X86_EXTENDED_PLATFORM is not set
+# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
+# CONFIG_MTRR_SANITIZER is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_RELOCATABLE is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+# CONFIG_BLK_DEV is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_NET_PCI=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO_SERPORT is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_MFD_SUPPORT is not set
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_X86_PLATFORM_DEVICES is not set
+# CONFIG_DMIID is not set
+CONFIG_EXT2_FS=y
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_FRAME_POINTER is not set
+# CONFIG_X86_VERBOSE_BOOTUP is not set
+# CONFIG_VIRTUALIZATION is not set
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
new file mode 100644
index 0000000..c06d24f
--- /dev/null
+++ b/board/qemu/x86_64/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
+
+The login prompt will appear in the graphical window.
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
new file mode 100644
index 0000000..e6a59ac
--- /dev/null
+++ b/configs/qemu_x86_64_defconfig
@@ -0,0 +1,17 @@
+# Architecture
+BR2_x86_64=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.1.config"
-- 
1.7.3.4
