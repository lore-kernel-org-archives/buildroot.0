From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Mar 2014 07:27:12 +0100
Subject: [Buildroot] [git commit] board/arm/foundation-v8: update defconfig
	and instructions
Message-ID: <20140321062945.272599C219@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aac1fed7b974694e23dfbb105ab1ea2fd049d09c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates the defconfig of the foundation-v8 platform, which
can be tested under the AArch64 emulator provided by ARM. The main
change is that we switch to the mainline 3.13.6 kernel instead of a
Linaro-specific Git tree.

Another change is to update the download link for the emulator in the
instructions, in order to use the latest version of the emulator,
which was used for testing.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/arm/foundation-v8/readme.txt |    2 +-
 configs/arm_foundationv8_defconfig |   18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index 7f419a0..f6d0698 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -3,7 +3,7 @@ ARM software simulator of the AArch64 architecture.
 
 First, one has to download the AArch64 software simulator from:
 
-  https://silver.arm.com/download/download.tm?pv=1317469
+  https://silver.arm.com/download/download.tm?pv=1509509
 
 Then, use the arm_foundationv8_defconfig configuration to build your
 Buildroot system.
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index c8de16d..2280792 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,15 +1,17 @@
 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(LINUX_DIR)/arch/arm64/configs/defconfig"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="foundation-v8"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_BOOT_WRAPPER_AARCH64=y
-BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="vexpress-foundation-v8"
+BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="foundation-v8"
 BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS="root=/dev/vda consolelog=9 console=ttyAMA0 rw"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.linaro.org/kernel/linaro-aarch64.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7181edd0539e195f78adedbb6c3878f9f1e0c4bb"
-BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
