From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 1 Oct 2014 21:41:09 +0200
Subject: [Buildroot] [PATCH 2/2] qemu-x86_64: update kernel
Message-ID: <20141001194108.GA13829@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to Linux Kernel 3.16.3.
Enable Ext4 by default.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/x86_64/{linux-3.13.config => linux-3.16.config} |    2 +-
 board/qemu/x86_64/readme.txt                               |    2 +-
 configs/qemu_x86_64_defconfig                              |   10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename board/qemu/x86_64/{linux-3.13.config => linux-3.16.config} (99%)

diff --git a/board/qemu/x86_64/linux-3.13.config b/board/qemu/x86_64/linux-3.16.config
similarity index 99%
rename from board/qemu/x86_64/linux-3.13.config
rename to board/qemu/x86_64/linux-3.16.config
index d738e4d..920a0a6 100644
--- a/board/qemu/x86_64/linux-3.13.config
+++ b/board/qemu/x86_64/linux-3.16.config
@@ -47,7 +47,7 @@ CONFIG_SND_HDA_INTEL=y
 # CONFIG_USB_SUPPORT is not set
 # CONFIG_X86_PLATFORM_DEVICES is not set
 # CONFIG_DMIID is not set
-CONFIG_EXT2_FS=y
+CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
 # CONFIG_MISC_FILESYSTEMS is not set
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index f350d36..4fbbc0d 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 827d362..b01666c 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,14 +9,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.13 headers to avoid breaking with newer kernels
+# Lock to 3.16 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.16.config"
-- 
1.7.10.4
