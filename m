From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 21:52:44 +0200
Subject: [Buildroot] [git commit] configs/qemu_riscv64_virt: update
 defconfigs to Linux 5.4.35
Message-ID: <20200502193833.94DD490DBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7194239f01fabc3c7de7085c9d75cb345c44f39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to riscv32, the qemu_riscv64_virt defconfig doesn't needs
any specific change. It could have been updated to Linux 5.4.35 in
the commit 80a044703a40bd7418a2b906ff08362ef5460b87.

So, update the kernel version to 5.4.35.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/qemu_riscv64_virt_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index a376b7dec2..dbe6107b62 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.35"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_IMAGE=y
 
