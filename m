From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 16:53:31 +0200
Subject: [Buildroot] [git commit] qemu/aarch64-virt: update to the latest
	versions
Message-ID: <20141007150307.8C6C0B0C2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0833126567ed6e128862b650299533783ce9eb7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.16.config => linux-3.17.config}       |    3 +--
 board/qemu/aarch64-virt/readme.txt                 |    2 +-
 configs/qemu_aarch64_virt_defconfig                |   10 +++++-----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux-3.16.config b/board/qemu/aarch64-virt/linux-3.17.config
similarity index 96%
rename from board/qemu/aarch64-virt/linux-3.16.config
rename to board/qemu/aarch64-virt/linux-3.17.config
index 594f424..93cb42f 100644
--- a/board/qemu/aarch64-virt/linux-3.16.config
+++ b/board/qemu/aarch64-virt/linux-3.17.config
@@ -22,7 +22,7 @@ CONFIG_NET_KEY=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_BRIDGE=y
+CONFIG_BRIDGE=m
 CONFIG_NET_SCHED=y
 CONFIG_VSOCKETS=y
 CONFIG_DEVTMPFS=y
@@ -30,7 +30,6 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_MULTI_LUN=y
 CONFIG_SCSI_CONSTANTS=y
 CONFIG_SCSI_LOGGING=y
 CONFIG_SCSI_SCAN_ASYNC=y
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index f011de1..5d5c581 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.0
+Tested with QEMU 2.1.2
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 6849587..88e5709 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -8,16 +8,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.16 headers to avoid breaking with newer kernels
+# Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.16.3"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
+BR2_DEFAULT_KERNEL_VERSION="3.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.16.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.17.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
