From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 3 Oct 2014 17:42:48 +0200
Subject: [Buildroot] [PATCH] qemu-xtensa: Update to latest stable kernel
Message-ID: <20141003154248.GA2813@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to Linux 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../qemu/xtensa-lx60/{linux-3.15.config => linux-3.16.config}  |    0
 board/qemu/xtensa-lx60/readme.txt                              |    2 +-
 configs/qemu_xtensa_lx60_defconfig                             |    8 ++++----
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename board/qemu/xtensa-lx60/{linux-3.15.config => linux-3.16.config} (100%)

diff --git a/board/qemu/xtensa-lx60/linux-3.15.config b/board/qemu/xtensa-lx60/linux-3.16.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-3.15.config
rename to board/qemu/xtensa-lx60/linux-3.16.config
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index 0bfed90..f2a7406 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.0.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 05598a9..fe69b39 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,15 +16,15 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.15 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.15.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.15.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.16.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
-- 
1.7.10.4
