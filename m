From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 30 Nov 2017 06:59:56 +0100
Subject: [Buildroot] [PATCH next 2/3] qemu-or1k: update to 4.14.x
Message-ID: <20171130055956.GA25276@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Or1k support improved, f.e. musl can be tested inside qemu.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/or1k/{linux-4.11.config => linux.config} | 0
 configs/qemu_or1k_defconfig                         | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/qemu/or1k/{linux-4.11.config => linux.config} (100%)

diff --git a/board/qemu/or1k/linux-4.11.config b/board/qemu/or1k/linux.config
similarity index 100%
rename from board/qemu/or1k/linux-4.11.config
rename to board/qemu/or1k/linux.config
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 0eb1916a41..c667142185 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -5,12 +5,12 @@ BR2_or1k=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4,11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4,14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
-- 
2.11.0
