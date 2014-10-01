From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 1 Oct 2014 21:40:32 +0200
Subject: [Buildroot] [PATCH 1/2] qemu-x86: update kernel
Message-ID: <20141001194032.GA8443@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Linux kernel to 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/x86/{linux-3.15.config => linux-3.16.config} |    0
 board/qemu/x86/readme.txt                               |    2 +-
 configs/qemu_x86_defconfig                              |   10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename board/qemu/x86/{linux-3.15.config => linux-3.16.config} (100%)

diff --git a/board/qemu/x86/linux-3.15.config b/board/qemu/x86/linux-3.16.config
similarity index 100%
rename from board/qemu/x86/linux-3.15.config
rename to board/qemu/x86/linux-3.16.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 9ee2e37..92ce47c 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.0.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 591dc2b..998e226 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.15 headers to avoid breaking with newer kernels
+# Lock to 3.16 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.15.7"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.15.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.16.config"
-- 
1.7.10.4
