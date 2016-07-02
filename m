From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:07:03 +0200
Subject: [Buildroot] [git commit] configs/qemu: update aarch64 to linux 4.6.3
Message-ID: <20160702130840.0807F7FCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0240ab741929f9651ae3b1c6c6ceace15f55a7b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The console problem goes away with qemu 2.6.0 so it seems it's now a
requirement, update readme.txt accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/aarch64-virt/{linux-4.5.config => linux-4.6.config} | 0
 board/qemu/aarch64-virt/readme.txt                             | 2 +-
 configs/qemu_aarch64_virt_defconfig                            | 8 ++++----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux-4.5.config b/board/qemu/aarch64-virt/linux-4.6.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.5.config
rename to board/qemu/aarch64-virt/linux-4.6.config
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index cfd5e81..1c4c7f9 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.6.0
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index d540bf5..195d51e 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.6.config"
