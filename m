From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 14:59:29 +0200
Subject: [Buildroot] [git commit] configs/qemu_mips64r6el_malta_defconfig:
	new configuration
Message-ID: <20160701130003.D29B3817A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1452c5d4f32d6ddf58bb8aea5cf23d4d77b5462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/mips64r6el-malta/linux-4.6.config | 34 ++++++++++++++++++++++++++++
 board/qemu/mips64r6el-malta/readme.txt       |  7 ++++++
 configs/qemu_mips64r6el_malta_defconfig      | 30 ++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/board/qemu/mips64r6el-malta/linux-4.6.config b/board/qemu/mips64r6el-malta/linux-4.6.config
new file mode 100644
index 0000000..0ebfdbd
--- /dev/null
+++ b/board/qemu/mips64r6el-malta/linux-4.6.config
@@ -0,0 +1,34 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS64_R6=y
+CONFIG_64BIT=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_MIPS32_COMPAT=y
+CONFIG_MIPS32_O32=y
+CONFIG_MIPS32_N32=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
new file mode 100644
index 0000000..3459a87
--- /dev/null
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+ qemu-system-mips64el -M malta -cpu MIPS64R6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.6.0
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
new file mode 100644
index 0000000..c7803a5
--- /dev/null
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -0,0 +1,30 @@
+# Architecture
+BR2_mips64el=y
+BR2_mips_64r6=y
+BR2_MIPS_NABI64=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.6.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Compiler
+# linux >= 4.4 uses -mcompact-branches which is only available since gcc-6
+BR2_GCC_VERSION_6_X=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
