From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 22:25:56 +0100
Subject: [Buildroot] [git commit] bfin-bf512: update to latest kernel
Message-ID: <20180122213642.6962083E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b232adfb0e0eaa4ebff03d1e3e25fd10f49aed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/gdb/bfin-bf512/{linux-4.6.config => linux.config} | 0
 configs/gdb_bfin_bf512_defconfig                        | 9 ++++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/gdb/bfin-bf512/linux-4.6.config b/board/gdb/bfin-bf512/linux.config
similarity index 100%
rename from board/gdb/bfin-bf512/linux-4.6.config
rename to board/gdb/bfin-bf512/linux.config
diff --git a/configs/gdb_bfin_bf512_defconfig b/configs/gdb_bfin_bf512_defconfig
index 37ee728..6740647 100644
--- a/configs/gdb_bfin_bf512_defconfig
+++ b/configs/gdb_bfin_bf512_defconfig
@@ -8,15 +8,15 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/gdb/post-build.sh"
 
-# Linux headers same as kernel, a 4.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.14"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/gdb/bfin-bf512/linux-4.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/gdb/bfin-bf512/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
@@ -31,4 +31,3 @@ BR2_PACKAGE_HOST_GDB=y
 # BR2_PACKAGE_HOST_GDB_TUI is not set
 # BR2_PACKAGE_HOST_GDB_PYTHON is not set
 BR2_PACKAGE_HOST_GDB_SIM=y
-
