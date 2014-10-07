From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Oct 2014 09:29:53 -0300
Subject: [Buildroot] [PATCH 18/19] qemu/ppc-virtex-ml507: update to the
	latest versions
In-Reply-To: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412684994-28760-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{powerpc-virtex-ml507 => ppc-virtex-ml507}/readme.txt   |  5 ++---
 configs/qemu_ppc_virtex_ml507_defconfig                     | 13 +++++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)
 rename board/qemu/{powerpc-virtex-ml507 => ppc-virtex-ml507}/readme.txt (58%)

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
-- 
2.0.4
