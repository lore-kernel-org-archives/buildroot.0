From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 22:48:23 +0100
Subject: [Buildroot] [git commit] qemu/arm-vexpress: update to use kernel
	3.6.6
Message-ID: <20121115230534.B5CEE9A031@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fc80273b7c9b5289e0a8ef48f5d4c7851112862
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/arm-vexpress/readme.txt  |    2 +-
 configs/qemu_arm_vexpress_defconfig |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index aeea842..41a5f67 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.1.1
+Tested with QEMU 1.2.0
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 8ac7a07..424a7c5 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -11,12 +11,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.5 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_5=y
+# Lock to 3.6 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.6"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
