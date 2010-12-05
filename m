From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:12 +0100
Subject: [Buildroot] [PATCH 41/55] board: add new Qemu x86 configuration file
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <94a5b8644a6a27084d90b556f755f574cb2e1c40.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/x86/linux-2.6.36.config |   67 ++++++++++++++++++++++++++++++++++++
 configs/qemu_x86_defconfig         |   10 +++++
 2 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/x86/linux-2.6.36.config
 create mode 100644 configs/qemu_x86_defconfig

diff --git a/board/qemu/x86/linux-2.6.36.config b/board/qemu/x86/linux-2.6.36.config
new file mode 100644
index 0000000..6b57aff
--- /dev/null
+++ b/board/qemu/x86/linux-2.6.36.config
@@ -0,0 +1,67 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_X86_EXTENDED_PLATFORM is not set
+# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
+# CONFIG_NO_BOOTMEM is not set
+# CONFIG_X86_RESERVE_LOW_64K is not set
+# CONFIG_MTRR_SANITIZER is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_RELOCATABLE is not set
+# CONFIG_COMPAT_VDSO is not set
+CONFIG_NET=y
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
+# CONFIG_MISC_DEVICES is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_NET_PCI=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139TOO=y
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO_SERPORT is not set
+# CONFIG_DEVKMEM is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_MFD_SUPPORT is not set
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
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_X86_VERBOSE_BOOTUP is not set
+# CONFIG_VIRTUALIZATION is not set
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
new file mode 100644
index 0000000..e670b30
--- /dev/null
+++ b/configs/qemu_x86_defconfig
@@ -0,0 +1,10 @@
+# Architecture
+BR2_i386=y
+BR2_x86_pentiumpro=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-2.6.36.config"
-- 
1.7.0.4
