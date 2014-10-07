From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 16:59:46 +0200
Subject: [Buildroot] [git commit] qemu/mipsel-malta: update to the latest
	versions
Message-ID: <20141007150307.D4B44B0C2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06d3f72a95b8908fa465422bdf27d24ba361cee1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.16.config => linux-3.17.config}       |    0
 board/qemu/mipsel-malta/readme.txt                 |    2 +-
 configs/qemu_mipsel_malta_defconfig                |   10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/qemu/mipsel-malta/linux-3.16.config b/board/qemu/mipsel-malta/linux-3.17.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.16.config
rename to board/qemu/mipsel-malta/linux-3.17.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index fe7b6a9..4dbe9b7 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.1.0
+Tested with QEMU 2.1.2
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 1818992..a80d914 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.16 headers to avoid breaking with newer kernels
+# Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.16.3"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
+BR2_DEFAULT_KERNEL_VERSION="3.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.16.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.17.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
