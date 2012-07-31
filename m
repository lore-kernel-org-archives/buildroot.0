From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Jul 2012 18:13:10 -0300
Subject: [Buildroot] [PATCH 06/11] qemu/arm-vexpress: update to use kernel
	3.4.7
In-Reply-To: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1343769195-25220-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
