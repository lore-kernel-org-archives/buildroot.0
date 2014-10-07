From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 17:01:34 +0200
Subject: [Buildroot] [git commit] qemu/ppc-virtex-ml507: update to the
	latest versions
Message-ID: <20141007150308.297DCB0C2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8956b2b53cad04ddcb56f3d3e2dcf8f6051c77a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../readme.txt                                     |    5 ++---
 configs/qemu_ppc_virtex_ml507_defconfig            |   13 +++++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
similarity index 58%
rename from board/qemu/powerpc-virtex-ml507/readme.txt
rename to board/qemu/ppc-virtex-ml507/readme.txt
index 0547987..edf72bd 100644
--- a/board/qemu/powerpc-virtex-ml507/readme.txt
+++ b/board/qemu/ppc-virtex-ml507/readme.txt
@@ -1,8 +1,7 @@
 Run the emulation with:
 
- cp output/images/virtex440-ml507.dtb ppc.dtb
- qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0"
+ qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb virtex440-ml507.dtb
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.1.2
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index cd2f647..fb464c1 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,10 +6,10 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.13 headers to avoid breaking with newer kernels
+# Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -17,8 +17,13 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.1.2"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M virtex-ml507 -kernel output/images/vmlinux -m 256 -append 'console=ttyS0' -display none -nographic -dtb output/images/virtex440-ml507.dtb"
