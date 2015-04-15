From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 14:04:58 -0300
Subject: [Buildroot] [PATCH 01/15] configs/qemu: update aarch64 virt
Message-ID: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to kernel 4.0.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../qemu/aarch64-virt/{linux-3.19.config => linux-4.0.config}  |  0
 board/qemu/aarch64-virt/readme.txt                             |  2 +-
 configs/qemu_aarch64_virt_defconfig                            | 10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename board/qemu/aarch64-virt/{linux-3.19.config => linux-4.0.config} (100%)

diff --git a/board/qemu/aarch64-virt/linux-3.19.config b/board/qemu/aarch64-virt/linux-4.0.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-3.19.config
rename to board/qemu/aarch64-virt/linux-4.0.config
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index c174725..097760c 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index c99edfa..81b183e 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -8,16 +8,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.0.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
-- 
2.0.5
