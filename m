From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Sep 2014 09:53:12 +0200
Subject: [Buildroot] [git commit] qemu-ppc: update kernel to latest for
	g3beige emulation
Message-ID: <20140927075529.CAE589D6FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f5bffc426f7418c555291450d482a0ceede0865
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Linux Kernel to 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.13.config => linux-3.16.config}       |    0
 board/qemu/powerpc-g3beige/readme.txt              |    2 +-
 configs/qemu_ppc_g3beige_defconfig                 |   10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/qemu/powerpc-g3beige/linux-3.13.config b/board/qemu/powerpc-g3beige/linux-3.16.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.13.config
rename to board/qemu/powerpc-g3beige/linux-3.16.config
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 2711350..e716830 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 1668e72..ad2de80 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,17 +6,17 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.13 headers to avoid breaking with newer kernels
+# Lock to 3.16 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.16.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
