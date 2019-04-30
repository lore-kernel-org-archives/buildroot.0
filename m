From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Apr 2019 22:37:34 +0200
Subject: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_*: kernel build needs
 mkimage
Message-ID: <20190430203734.27376-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following ffbe46a5295 ("linux: simplify LINUX_BUILD_CMDS"), the Linux
kernel build for these xtensa qemu builds an image format that needs
mkimage.

Reported-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 configs/qemu_xtensa_lx60_defconfig       | 3 +++
 configs/qemu_xtensa_lx60_nommu_defconfig | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 6bf48a2ada..4287e6abeb 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -23,3 +23,6 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+
+# Kernel needs mkimage
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 5ff9646270..37b6743588 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -27,3 +27,6 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+
+# Kernel needs mkimage
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.14.1
