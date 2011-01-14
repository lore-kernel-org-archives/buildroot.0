From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jan 2011 11:20:38 +0100
Subject: [Buildroot] [git commit master 1/1] fs/tar: enable by default
Message-ID: <20110114102128.E30558B4D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f12b1771a10a95a2e6b13d65536c6c3c591fb5e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This way we'll get something in images/ by default, and hopefully people
will be less likely to try to use target/ directly.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_arm_versatile_defconfig |    1 +
 configs/qemu_mipsel_malta_defconfig  |    1 +
 configs/qemu_ppc_g3beige_defconfig   |    1 +
 configs/qemu_sh4_r2d_defconfig       |    1 +
 configs/qemu_x86_defconfig           |    1 +
 fs/tar/Config.in                     |    1 +
 6 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index f5e2464..4d8233d 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -4,6 +4,7 @@ BR2_arm926t=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 612698d..ea3ba88 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -4,6 +4,7 @@ BR2_mips_32r2=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index c625743..db7ef74 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -4,6 +4,7 @@ BR2_powerpc_440fp=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index ba46ea0..f40633c 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -4,6 +4,7 @@ BR2_sh4=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
 
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 171da63..2e7d813 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -4,6 +4,7 @@ BR2_x86_pentiumpro=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index 5aaf9bd..60b8bf4 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_TAR
 	bool "tar the root filesystem"
+	default y
 	help
 	  Build a tar archive of the root filesystem
 
-- 
1.7.2.2
