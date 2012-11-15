From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 22:49:42 +0100
Subject: [Buildroot] [git commit] qemu/mips{el}-malta: update to use kernel
	3.6.6
Message-ID: <20121115230535.BDC3F9A031@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53a4941b2ae41fff0c3c2503756baedf6dd892d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.5.config => linux-3.6.config}         |    0
 board/qemu/mips-malta/readme.txt                   |    2 +-
 .../{linux-3.5.config => linux-3.6.config}         |    0
 board/qemu/mipsel-malta/readme.txt                 |    2 +-
 configs/qemu_mips_malta_defconfig                  |    8 ++++----
 configs/qemu_mipsel_malta_defconfig                |    8 ++++----
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/board/qemu/mips-malta/linux-3.5.config b/board/qemu/mips-malta/linux-3.6.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.5.config
rename to board/qemu/mips-malta/linux-3.6.config
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index 0288df5..104c427 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.1.1
+Tested with QEMU 1.2.0
diff --git a/board/qemu/mipsel-malta/linux-3.5.config b/board/qemu/mipsel-malta/linux-3.6.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.5.config
rename to board/qemu/mipsel-malta/linux-3.6.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index 09ad500..d8a5847 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.1.1
+Tested with QEMU 1.2.0
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 3bb2a72..435b02d 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
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
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 8208379..42992d7 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
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
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
