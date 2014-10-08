From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Oct 2014 20:06:25 +0200
Subject: [Buildroot] [git commit] configs/qemu: enable tmpfs for custom
	configs
Message-ID: <20141008180708.79FF3B19B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7466f74b3cbe4d4cb4af3d9f7d96dc8f2342b516
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable TMPFS support for our custom qemu kernel configs, it's generally
used and can lead to failures/confusion.
Moreover enable ACL & XATTR TMPFS support for SystemD.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/arm-versatile/linux-3.17.config  |    2 ++
 board/qemu/mips-malta/linux-3.17.config     |    1 +
 board/qemu/mips64-malta/linux-3.17.config   |    1 +
 board/qemu/mips64el-malta/linux-3.17.config |    1 +
 board/qemu/mipsel-malta/linux-3.17.config   |    1 +
 board/qemu/ppc-g3beige/linux-3.17.config    |    1 +
 board/qemu/sh4-r2d/linux-3.17.config        |    1 +
 board/qemu/x86/linux-3.17.config            |    2 ++
 board/qemu/x86_64/linux-3.17.config         |    2 ++
 board/qemu/xtensa-lx60/linux-3.17.config    |    6 ++++--
 10 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-3.17.config b/board/qemu/arm-versatile/linux-3.17.config
index e425d45..dd5db53 100644
--- a/board/qemu/arm-versatile/linux-3.17.config
+++ b/board/qemu/arm-versatile/linux-3.17.config
@@ -61,6 +61,8 @@ CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=m
 CONFIG_EXT4_FS=y
 CONFIG_VFAT_FS=m
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_JFFS2_FS=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=y
diff --git a/board/qemu/mips-malta/linux-3.17.config b/board/qemu/mips-malta/linux-3.17.config
index 2b65c93..4716bb6 100644
--- a/board/qemu/mips-malta/linux-3.17.config
+++ b/board/qemu/mips-malta/linux-3.17.config
@@ -55,5 +55,6 @@ CONFIG_EXT4_FS=y
 CONFIG_QUOTA=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
diff --git a/board/qemu/mips64-malta/linux-3.17.config b/board/qemu/mips64-malta/linux-3.17.config
index c112793..f850f09 100644
--- a/board/qemu/mips64-malta/linux-3.17.config
+++ b/board/qemu/mips64-malta/linux-3.17.config
@@ -55,5 +55,6 @@ CONFIG_FB_CIRRUS=y
 CONFIG_EXT4_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
diff --git a/board/qemu/mips64el-malta/linux-3.17.config b/board/qemu/mips64el-malta/linux-3.17.config
index e980476..6fe3594 100644
--- a/board/qemu/mips64el-malta/linux-3.17.config
+++ b/board/qemu/mips64el-malta/linux-3.17.config
@@ -56,5 +56,6 @@ CONFIG_FB_CIRRUS=y
 CONFIG_EXT4_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
diff --git a/board/qemu/mipsel-malta/linux-3.17.config b/board/qemu/mipsel-malta/linux-3.17.config
index b0372ae..4ce1d91 100644
--- a/board/qemu/mipsel-malta/linux-3.17.config
+++ b/board/qemu/mipsel-malta/linux-3.17.config
@@ -56,5 +56,6 @@ CONFIG_EXT4_FS=y
 CONFIG_QUOTA=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
diff --git a/board/qemu/ppc-g3beige/linux-3.17.config b/board/qemu/ppc-g3beige/linux-3.17.config
index cf84c75..26be1c5 100644
--- a/board/qemu/ppc-g3beige/linux-3.17.config
+++ b/board/qemu/ppc-g3beige/linux-3.17.config
@@ -40,6 +40,7 @@ CONFIG_SSB_DRIVER_PCICORE=y
 CONFIG_EXT4_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_SQUASHFS=y
 CONFIG_LIBCRC32C=y
 CONFIG_BOOTX_TEXT=y
diff --git a/board/qemu/sh4-r2d/linux-3.17.config b/board/qemu/sh4-r2d/linux-3.17.config
index ce16cb8..5a98a69 100644
--- a/board/qemu/sh4-r2d/linux-3.17.config
+++ b/board/qemu/sh4-r2d/linux-3.17.config
@@ -63,6 +63,7 @@ CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_MINIX_FS=y
 CONFIG_NLS_CODEPAGE_932=y
 CONFIG_DEBUG_FS=y
diff --git a/board/qemu/x86/linux-3.17.config b/board/qemu/x86/linux-3.17.config
index 920a0a6..602a9bb 100644
--- a/board/qemu/x86/linux-3.17.config
+++ b/board/qemu/x86/linux-3.17.config
@@ -50,6 +50,8 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
diff --git a/board/qemu/x86_64/linux-3.17.config b/board/qemu/x86_64/linux-3.17.config
index 920a0a6..602a9bb 100644
--- a/board/qemu/x86_64/linux-3.17.config
+++ b/board/qemu/x86_64/linux-3.17.config
@@ -50,6 +50,8 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
diff --git a/board/qemu/xtensa-lx60/linux-3.17.config b/board/qemu/xtensa-lx60/linux-3.17.config
index e231368..51701b2 100644
--- a/board/qemu/xtensa-lx60/linux-3.17.config
+++ b/board/qemu/xtensa-lx60/linux-3.17.config
@@ -1,4 +1,5 @@
 # CONFIG_SWAP is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_XTENSA_VARIANT_DC232B=y
 # CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX is not set
@@ -7,7 +8,6 @@ CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="console=ttyS0,38400"
 # CONFIG_COMPACTION is not set
 # CONFIG_BOUNCE is not set
-# CONFIG_CROSS_MEMORY_ATTACH is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -30,5 +30,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_S32C1I_SELFTEST is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_LD_NO_RELAX=y
+# CONFIG_S32C1I_SELFTEST is not set
