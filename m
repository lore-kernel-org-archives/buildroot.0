From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 30 Jan 2018 18:47:34 -0500
Subject: [Buildroot] [PATCH 1/1] qemu_x86_64: use kernel 4.15
Message-ID: <20180130234734.21476-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 board/qemu/x86_64/{linux-4.11.config => linux-4.15.config} | 6 +++++-
 configs/qemu_x86_64_defconfig                              | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)
 rename board/qemu/x86_64/{linux-4.11.config => linux-4.15.config} (91%)

diff --git a/board/qemu/x86_64/linux-4.11.config b/board/qemu/x86_64/linux-4.15.config
similarity index 91%
rename from board/qemu/x86_64/linux-4.11.config
rename to board/qemu/x86_64/linux-4.15.config
index e3bd1454e6..0e59b87bd6 100644
--- a/board/qemu/x86_64/linux-4.11.config
+++ b/board/qemu/x86_64/linux-4.15.config
@@ -1,4 +1,5 @@
 CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_SMP=y
@@ -8,6 +9,8 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_VIRTIO=y
@@ -23,8 +26,8 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_DRM=y
-CONFIG_DRM_BOCHS=y
 CONFIG_DRM_QXL=y
+CONFIG_DRM_BOCHS=y
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_SOUND=y
 CONFIG_SND=y
@@ -41,5 +44,6 @@ CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_EXT4_FS=y
+CONFIG_AUTOFS4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index aa17ace5b0..92a196790d 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -15,6 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.15.config"
-- 
2.14.3
