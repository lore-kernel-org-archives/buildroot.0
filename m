From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Dec 2012 12:32:46 +0100
Subject: [Buildroot] [git commit] qemu/mips-malta: update to use kernel 3.7.1
Message-ID: <20121230113340.A0E2581ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6781b73a29488d9e0302bd96295542a18aac5ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.6.config => linux-3.7.config}         |    0
 board/qemu/mips-malta/readme.txt                   |    2 +-
 configs/qemu_mips_malta_defconfig                  |    8 ++++----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/mips-malta/linux-3.6.config b/board/qemu/mips-malta/linux-3.7.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.6.config
rename to board/qemu/mips-malta/linux-3.7.config
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index 104c427..d3d8446 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 435b02d..33c389a 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.6 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_6=y
+# Lock to 3.7 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_7=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.7.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
