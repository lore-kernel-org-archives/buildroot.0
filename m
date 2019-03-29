From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:03:23 +0100
Subject: [Buildroot] [git commit] configs/qemu_riscv*_virt: use mainline
 kernel
Message-ID: <20190329155946.654698833B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dec97ac894388c80d6b77b911d98401e5d1bfe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the RISC-V QEMU virt machine defconfigs to use the
mainline 4.20.17 kernel instead of the version from the
riscv-linux repository.

This change has been tested with QEMU 3.1.0.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_riscv32_virt_defconfig | 5 ++---
 configs/qemu_riscv64_virt_defconfig | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 5d3e06bf3c..84f7b6ab9c 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -15,9 +15,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20.17"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/riscv32-virt/linux.config.fragment"
 BR2_LINUX_KERNEL_IMAGE=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 05d2764003..12afac44fb 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -15,9 +15,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20.17"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_IMAGE=y
 
