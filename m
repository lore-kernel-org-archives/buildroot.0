From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 09:04:07 +0200
Subject: [Buildroot] [git commit] configs/qemu_xtensa_lx60_*: kernel build
 needs mkimage
Message-ID: <20190501071329.3A4C881585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cf13b9b0644295dc8a0aa33838b304eb6ebc444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following ffbe46a5295 ("linux: simplify LINUX_BUILD_CMDS"), the Linux
kernel build for these xtensa qemu builds an image format that needs
mkimage.

Reported-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
