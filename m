From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 16:16:33 +0100
Subject: [Buildroot] [git commit branch/next]
 configs/qemu_aarch64_virt_defconfig: bump kernel to 4.15.2
Message-ID: <20180210151654.B63FA88663@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe563efcb1877d11753bf3acc19694bfdd0f63ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-virt/{linux-4.13.config => linux-4.15.config} | 2 --
 board/qemu/aarch64-virt/readme.txt                               | 2 +-
 configs/qemu_aarch64_virt_defconfig                              | 8 ++++----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux-4.13.config b/board/qemu/aarch64-virt/linux-4.15.config
similarity index 97%
rename from board/qemu/aarch64-virt/linux-4.13.config
rename to board/qemu/aarch64-virt/linux-4.15.config
index 93cb42f2ea..c9f2708ad5 100644
--- a/board/qemu/aarch64-virt/linux-4.13.config
+++ b/board/qemu/aarch64-virt/linux-4.15.config
@@ -1,6 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_TASKSTATS=y
@@ -10,7 +9,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
 CONFIG_ARCH_VEXPRESS=y
-CONFIG_SMP=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_BINFMT_MISC=y
 CONFIG_COMPAT=y
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index 9e09d953f9..ce0b621366 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.11.0
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index c94c4ac773..3bafd90e5a 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.15.config"
