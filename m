From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Dec 2012 12:32:28 +0100
Subject: [Buildroot] [git commit] qemu/ppc-g3beige: update to use kernel
	3.7.1
Message-ID: <20121230113339.526229A555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f8ba2c918fb1cfe4a645e61e7d28c4c890cf31c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.6.config => linux-3.7.config}         |    0
 board/qemu/powerpc-g3beige/readme.txt              |    2 +-
 configs/qemu_ppc_g3beige_defconfig                 |    8 ++++----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/powerpc-g3beige/linux-3.6.config b/board/qemu/powerpc-g3beige/linux-3.7.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.6.config
rename to board/qemu/powerpc-g3beige/linux-3.7.config
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 01f0baf..05aa380 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 420710b..5aef9bf 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,15 +6,15 @@ BR2_powerpc_750=y
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
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.7.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
