From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Dec 2012 23:23:15 -0300
Subject: [Buildroot] [PATCH 04/13] qemu/ppc-virtex-ml507: update to use
	kernel 3.7.1
In-Reply-To: <1356834204-21952-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356834204-21952-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356834204-21952-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/powerpc-virtex-ml507/readme.txt |    2 +-
 configs/qemu_ppc_virtex_ml507_defconfig    |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/powerpc-virtex-ml507/readme.txt
index 0500a95..a225985 100644
--- a/board/qemu/powerpc-virtex-ml507/readme.txt
+++ b/board/qemu/powerpc-virtex-ml507/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 6b4ea74..59812c9 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.6 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_6=y
+# Lock to 3.7 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_7=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,7 +15,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
1.7.8.6
