From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 19:03:04 +0200
Subject: [Buildroot] [git commit] qemu-mips64el: update kernel to latest
Message-ID: <20140922170314.B62E29D74E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65e92df4def6e3c51e62f825232406dbba83615f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Linux Kernel to 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{linux-3.15.config => linux-3.16.config}       |    0
 board/qemu/mips64el-malta/readme.txt               |    2 +-
 configs/qemu_mips64el_malta_defconfig              |   10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/qemu/mips64el-malta/linux-3.15.config b/board/qemu/mips64el-malta/linux-3.16.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-3.15.config
rename to board/qemu/mips64el-malta/linux-3.16.config
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index 3c75bed..83faad8 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.0.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 6b7a885..6bf2fa4 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,17 +9,17 @@ BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.15 headers to avoid breaking with newer kernels
+# Lock to 3.16 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.15.6"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.15.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.16.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
