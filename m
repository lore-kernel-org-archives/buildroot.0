From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:15:57 +0200
Subject: [Buildroot] [git commit] qemu/sparc-ss10: update defconfig to Linux
	3.15.x
Message-ID: <20140729181712.242349D297@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=087f6ddc52a13e9b62d1bb0acf4ee3fec55d798d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update defconfig to 3.15, tested with Qemu 2.0.0.
Removed hint about framebuffer, as -display none is used.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/sparc-ss10/readme.txt  |    3 +--
 configs/qemu_sparc_ss10_defconfig |    8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index a126a55..b18bb40 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -3,6 +3,5 @@ Run the emulation with:
   qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user -display none
 
 The login prompt will appear in the terminal that started Qemu.
-The graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 2.0.0
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 3b56d98..afc0789 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,14 +6,14 @@ BR2_sparc_v8=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.15 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
+BR2_DEFAULT_KERNEL_VERSION="3.15.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.6"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
