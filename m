From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 14:31:32 +0200
Subject: [Buildroot] [git commit] qemu_x86_defconfig: use 3.0.4 linux kernel
Message-ID: <20110929190332.2E7B38DBD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25fd4e724eea1417ddaf06654d9d2558824959f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x86/{linux-2.6.36.config => linux-3.0.config}  |    9 +--------
 configs/qemu_x86_defconfig                         |    4 ++--
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/board/qemu/x86/linux-2.6.36.config b/board/qemu/x86/linux-3.0.config
similarity index 88%
rename from board/qemu/x86/linux-2.6.36.config
rename to board/qemu/x86/linux-3.0.config
index a578041..20ef541 100644
--- a/board/qemu/x86/linux-2.6.36.config
+++ b/board/qemu/x86/linux-3.0.config
@@ -1,16 +1,12 @@
 CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 # CONFIG_SWAP is not set
-CONFIG_RCU_FANOUT=32
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
 # CONFIG_X86_EXTENDED_PLATFORM is not set
 # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
-# CONFIG_NO_BOOTMEM is not set
-# CONFIG_X86_RESERVE_LOW_64K is not set
 # CONFIG_MTRR_SANITIZER is not set
 # CONFIG_SECCOMP is not set
 # CONFIG_RELOCATABLE is not set
@@ -29,7 +25,6 @@ CONFIG_IP_PNP=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_BLK_DEV is not set
-# CONFIG_MISC_DEVICES is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_ATA_PIIX=y
@@ -44,10 +39,10 @@ CONFIG_8139CP=y
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO_SERPORT is not set
+# CONFIG_LEGACY_PTYS is not set
 # CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_LEGACY_PTYS is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 # CONFIG_MFD_SUPPORT is not set
@@ -63,9 +58,7 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_FRAME_WARN=1024
 # CONFIG_UNUSED_SYMBOLS is not set
 # CONFIG_FRAME_POINTER is not set
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 # CONFIG_X86_VERBOSE_BOOTUP is not set
 # CONFIG_VIRTUALIZATION is not set
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 04314c2..d60b38d 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -12,6 +12,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.0.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-2.6.36.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.0.config"
