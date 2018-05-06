From: Florian La Roche <florian.laroche@googlemail.com>
Date: Sun,  6 May 2018 18:30:59 +0200
Subject: [Buildroot] [PATCH 1/1] qemu_arm_vexpress: use latest Linux kernel
Message-ID: <20180506163059.5801-1-Florian.LaRoche@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


There should be no reason to keep the qemu_arm_vexpress target
on an older kernel release, so change this to build with the latest
Linux kernel release for buildroot.


Signed-off-by: Florian La Roche <Florian.LaRoche@googlemail.com>
---
 configs/qemu_arm_vexpress_defconfig | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index faba6a6c25..b51eaa08ae 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,9 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_LATEST_VERSION=y
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
-- 
2.11.0
