From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 14:46:33 +0100
Subject: [Buildroot] [git commit] configs/qemu_riscv64_virt_defconfig: bump
 Linux version
Message-ID: <20190122134726.872248E2C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba9b3399c162a4803b019bb9352ece7034da51f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since riscv64 works with linux default defconfig, this patch drop custom config.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Tested-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/riscv64-virt/linux.config | 23 -----------------------
 configs/qemu_riscv64_virt_defconfig  |  9 ++++-----
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/board/qemu/riscv64-virt/linux.config b/board/qemu/riscv64-virt/linux.config
deleted file mode 100644
index d09e8b3bb1..0000000000
--- a/board/qemu/riscv64-virt/linux.config
+++ /dev/null
@@ -1,23 +0,0 @@
-CONFIG_ARCH_RV64I=y
-CONFIG_SMP=y
-CONFIG_NR_CPUS=8
-CONFIG_PCI=y
-CONFIG_SYSVIPC=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_WIRELESS is not set
-CONFIG_VIRTIO_BLK=y
-CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-# CONFIG_ETHERNET is not set
-# CONFIG_WLAN is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_VIRT_DRIVERS=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index e15f804341..705ec1293a 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -10,16 +10,15 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.20 series
+BR2_KERNEL_HEADERS_4_20=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fe92d7905c6ea0ebeabeb725b8040754ede7c220"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 
 # Bootloader
 BR2_TARGET_RISCV_PK=y
