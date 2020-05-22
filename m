From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 22 May 2020 23:51:42 +0200
Subject: [Buildroot] [PATCHv2 2/2] configs/qemu_arm_vexpress_tz_defconfig:
 build start-qemu.sh
In-Reply-To: <20200522215142.2907439-1-romain.naour@gmail.com>
References: <20200522215142.2907439-1-romain.naour@gmail.com>
Message-ID: <20200522215142.2907439-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When tags was added by commit 011206b2bffd509b29365bc1eaa761414ee13726
to detect the qemu command line, the qemu_arm_vexpress_tz_defconfig
was ignored due to a build issue.

This build issue has been fixed by previous patches, so we can
enable the runtime testing by adding the tag in the readme.txt
and the post-image script in the defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/arm-vexpress-tz/readme.txt  | 2 +-
 configs/qemu_arm_vexpress_tz_defconfig | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index b235ba5cd7..abce750291 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -18,7 +18,7 @@ secure and non-secure worlds.
 	-serial stdio \
 	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
 	-semihosting-config enable,target=native \
-	-bios bl1.bin
+	-bios bl1.bin # qemu_arm_vexpress_tz_defconfig
 
 The boot stage traces (if any) followed by the login prompt will appear
 in the terminal that started QEMU.
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index b4a6e72635..a829e1376b 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -47,6 +47,10 @@ BR2_PACKAGE_HOST_PYTHON3=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PACKAGE_PYTHON3=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # U-boot for booting the dear Linux kernel
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.25.4
