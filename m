From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:17:28 +0200
Subject: [Buildroot] [git commit] qemu/sh4-r2d: update default configuration
	to Linux 3.15.x
Message-ID: <20140715211737.1504D9D248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12687de8ad45cb9af2fc58de94ea24c97370fee1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Result tested with Qemu 2.0.0 without issues.
Old SCI problems are fixed in Qemu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{linux-3.2.config => linux-3.15.config}        |    0
 board/qemu/sh4-r2d/readme.txt                      |    2 +-
 configs/qemu_sh4_r2d_defconfig                     |   14 +++++++-------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/qemu/sh4-r2d/linux-3.2.config b/board/qemu/sh4-r2d/linux-3.15.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-3.2.config
rename to board/qemu/sh4-r2d/linux-3.15.config
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 73dce14..5d770b4 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.0.0
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index b27d9ec..f777417 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,19 +10,19 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.2 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.2.55"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_2=y
-
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
 BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 
+# Lock to 3.15 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.15.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.55"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.15.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
