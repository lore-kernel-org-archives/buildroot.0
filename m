From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:39:10 +0200
Subject: [Buildroot] [git commit] qemu/arm-vexpress: update to use kernel
	3.4.7
Message-ID: <20120731214056.9DD09909D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71bcaa69d09d8cad9274a8b7ec6c7055f6102a55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/arm-vexpress/readme.txt  |    2 ++
 configs/qemu_arm_vexpress_defconfig |    6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 0d3631c..aeea842 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -4,3 +4,5 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
+
+Tested with QEMU 1.1.1
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 9596fe5..03ea6e0 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -11,12 +11,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_3=y
+# Lock to 3.4 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
