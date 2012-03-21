From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 23:04:27 +0100
Subject: [Buildroot] [git commit] qemu/sh4-r2d: update to use kernel 3.2.12
Message-ID: <20120321223125.9356196928@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74783996061c54374ae3b947e2ee9703f8f59e5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately kernel 3.3 doesn't seem to work properly at the moment.
So lock down headers to version 3.2.x and kernel to 3.2.12.
Tested on qemu 1.0.1

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_sh4_r2d_defconfig |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 8794b18..e344e71 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,6 +10,9 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Avoid 3.3+ headers
+BR2_KERNEL_HEADERS_3_2=y
+
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
 BR2_GCC_VERSION_4_5_X=y
@@ -18,7 +21,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
