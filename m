From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 13:30:21 -0300
Subject: [Buildroot] [PATCH 8/9] qemu/mips-malta: add new sample config
In-Reply-To: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325781022-19371-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new qemu_mips_malta sample configuration for big endian MIPS
testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/mips-malta/linux-3.2.config |   76 ++++++++++++++++++++++++++++++++
 board/qemu/mips-malta/readme.txt       |    7 +++
 configs/qemu_mips_malta_defconfig      |   19 ++++++++
 3 files changed, 102 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/mips-malta/linux-3.2.config
 create mode 100644 board/qemu/mips-malta/readme.txt
 create mode 100644 configs/qemu_mips_malta_defconfig

diff --git a/board/qemu/mips-malta/linux-3.2.config b/board/qemu/mips-malta/linux-3.2.config
new file mode 100644
index 0000000..7549ccc
--- /dev/null
+++ b/board/qemu/mips-malta/linux-3.2.config
@@ -0,0 +1,76 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS32_R2=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_HZ_100=y
+CONFIG_EXPERIMENTAL=y
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=15
+CONFIG_SYSFS_DEPRECATED_V2=y
+CONFIG_RELAY=y
+CONFIG_NAMESPACES=y
+CONFIG_UTS_NS=y
+CONFIG_IPC_NS=y
+CONFIG_PID_NS=y
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_EMBEDDED=y
+# CONFIG_SYSCTL_SYSCALL is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_MODULE_SRCVERSION_ALL=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PCI=y
+CONFIG_PM=y
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
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+# CONFIG_MISC_DEVICES is not set
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_NET_PCI=y
+CONFIG_PCNET32=y
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO_I8042 is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_MFD_SUPPORT is not set
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+# CONFIG_VGA_CONSOLE is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_QUOTA=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_ROOT_NFS=y
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
new file mode 100644
index 0000000..0e21a3c
--- /dev/null
+++ b/board/qemu/mips-malta/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+ qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append "root=/dev/hda"
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer. No keyboard support has been
+enabled.
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
new file mode 100644
index 0000000..d6ab841
--- /dev/null
+++ b/configs/qemu_mips_malta_defconfig
@@ -0,0 +1,19 @@
+# Architecture
+BR2_mips=y
+BR2_mips_32r2=y
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.2.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
1.7.3.4
