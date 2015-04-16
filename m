From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:02:45 +0200
Subject: [Buildroot] [git commit] configs/qemu: update xtensa lx60
Message-ID: <20150416060438.B1D6A818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=591e66c253e8fcc1f33b8fc427f0596b9a33f2c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to kernel 4.0.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{linux-3.19.config => linux-4.0.config}        |    0
 board/qemu/xtensa-lx60/readme.txt                  |    2 +-
 configs/qemu_xtensa_lx60_defconfig                 |   10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/qemu/xtensa-lx60/linux-3.19.config b/board/qemu/xtensa-lx60/linux-4.0.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-3.19.config
rename to board/qemu/xtensa-lx60/linux-4.0.config
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index 0f138bc..2dad34a 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 4eb10fb..b3ac6b3 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -14,17 +14,17 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
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
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.0.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
