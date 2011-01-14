From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jan 2011 10:12:23 +0100
Subject: [Buildroot] [git commit master 1/1] fs/ext2: don't enable by default
Message-ID: <20110114092134.718C78B4CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=319815a5d54567c1aafa17f3c8125ea74f3f3c55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's pretty uncommon to use ext2fs on embedded systems, so don't enable
it by default.

Adjust defconfigs to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/arm_nptl_toolchain_defconfig |    1 -
 configs/arm_toolchain_defconfig      |    1 -
 configs/at91rm9200df_defconfig       |    1 -
 configs/at91sam9260dfc_defconfig     |    1 -
 configs/at91sam9261ek_defconfig      |    1 -
 configs/at91sam9263ek_defconfig      |    1 -
 configs/at91sam9g20dfc_defconfig     |    1 -
 configs/atngw100_defconfig           |    1 -
 configs/atstk100x_defconfig          |    1 -
 configs/integrator926_defconfig      |    1 -
 configs/kb9202_defconfig             |    1 -
 configs/qemu_arm_versatile_defconfig |    3 +++
 configs/qemu_mipsel_malta_defconfig  |    3 +++
 configs/qemu_ppc_g3beige_defconfig   |    3 +++
 configs/qemu_sh4_r2d_defconfig       |    3 +++
 configs/qemu_x86_defconfig           |    3 +++
 fs/ext2/Config.in                    |    1 -
 17 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index 1bb1193..8100073 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -15,4 +15,3 @@ BR2_INSTALL_LIBSTDCPP=y
 # BR2_PACKAGE_BUSYBOX is not set
 
 # No filesystem (toolchain only)
-# BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index e46c5c9..8bc97c9 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -13,4 +13,3 @@ BR2_INSTALL_LIBSTDCPP=y
 # BR2_PACKAGE_BUSYBOX is not set
 
 # No filesystem (toolchain only)
-# BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index b23665f..4229155 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -2,7 +2,6 @@
 BR2_arm=y
 
 # Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
 BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x420
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index d20d89e..13748d3 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -20,5 +20,4 @@ BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260ek"
 
 # Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index c1ab6be..cea28cb 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -21,5 +21,4 @@ BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9261ek"
 
 # Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index acf86ad..1a79482 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -21,5 +21,4 @@ BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9263ek"
 
 # Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_TAR=y
\ No newline at end of file
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 59cc27c..16fd023 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -21,5 +21,4 @@ BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g20ek"
 
 # Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 85aa94e..5373b44 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -2,7 +2,6 @@
 BR2_avr32=y
 
 # Filesystems
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y
 BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 35571a0..1af5001 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -14,7 +14,6 @@ BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="atstk1002"
 
 # Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_TAR=y
 
 
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index b9e790a..e596d33 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -14,5 +14,4 @@ BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="integrator"
 
 # Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index b71ceee..50b278c 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -3,7 +3,6 @@ BR2_arm=y
 BR2_arm920t=y
 
 # Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
 BR2_TARGET_ROOTFS_TAR=y
 
 # Kernel
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 6c349d3..f5e2464 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -2,6 +2,9 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index b021c1f..612698d 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -2,6 +2,9 @@
 BR2_mipsel=y
 BR2_mips_32r2=y
 
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 8b9212d..c625743 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -2,6 +2,9 @@
 BR2_powerpc=y
 BR2_powerpc_440fp=y
 
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 5e1f626..ba46ea0 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -2,6 +2,9 @@
 BR2_sh=y
 BR2_sh4=y
 
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
 BR2_GCC_VERSION_4_5_X=y
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index e670b30..171da63 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -2,6 +2,9 @@
 BR2_i386=y
 BR2_x86_pentiumpro=y
 
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 5c041d9..535fa01 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -1,6 +1,5 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2 root filesystem"
-	default y
 	help
 	  Build an ext2 root filesystem
 
-- 
1.7.2.2
