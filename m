From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 18 Mar 2019 21:02:04 +0000
Subject: [Buildroot] [PATCH v2 4/5] configs: qemu_riscv*: Build the kernel
 Image file
In-Reply-To: <20190318210106.6347-1-alistair.francis@wdc.com>
References: <20190318210106.6347-1-alistair.francis@wdc.com>
Message-ID: <20190318210106.6347-4-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 configs/qemu_riscv32_virt_defconfig | 1 +
 configs/qemu_riscv64_virt_defconfig | 1 +
 linux/Config.in                     | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 6f9a61b11c..f7e9a23106 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -20,6 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux.config"
+BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_RISCV_PK=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 596edf2fcd..ae67979d29 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_RISCV_PK=y
diff --git a/linux/Config.in b/linux/Config.in
index 818b94e1c0..dc10238053 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -258,7 +258,7 @@ config BR2_LINUX_KERNEL_SIMPLEIMAGE
 
 config BR2_LINUX_KERNEL_IMAGE
 	bool "Image"
-	depends on BR2_aarch64
+	depends on BR2_aarch64 || BR2_riscv
 
 config BR2_LINUX_KERNEL_LINUX_BIN
 	bool "linux.bin"
-- 
2.21.0
