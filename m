From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:23:52 +0200
Subject: [Buildroot] [git commit] qemu/mips-malta: update defconfig to Linux
	3.15.x
Message-ID: <20140726072423.D84D69D301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd28aa36d45d8af85dc0a1329350f72805350149
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to 3.15.x, disable ext3, use ext4 as default.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{linux-3.13.config => linux-3.15.config}       |    3 +--
 board/qemu/mips-malta/readme.txt                   |    2 +-
 configs/qemu_mips_malta_defconfig                  |   10 +++++-----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/board/qemu/mips-malta/linux-3.13.config b/board/qemu/mips-malta/linux-3.15.config
similarity index 97%
rename from board/qemu/mips-malta/linux-3.13.config
rename to board/qemu/mips-malta/linux-3.15.config
index df0fd1c..2b65c93 100644
--- a/board/qemu/mips-malta/linux-3.13.config
+++ b/board/qemu/mips-malta/linux-3.15.config
@@ -51,8 +51,7 @@ CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
 CONFIG_QUOTA=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index 719a624..da20770 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.0.0
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 3c1532c..be647eb 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.13 headers to avoid breaking with newer kernels
+# Lock to 3.15 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.15.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.15.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
