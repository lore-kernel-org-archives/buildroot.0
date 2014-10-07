From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Oct 2014 09:29:52 -0300
Subject: [Buildroot] [PATCH 17/19] qemu/ppc-mpc8544ds: update to the latest
	versions
In-Reply-To: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412684994-28760-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/{powerpc-mpc8544ds => ppc-mpc8544ds}/readme.txt | 2 +-
 configs/qemu_ppc_mpc8544ds_defconfig                       | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename board/qemu/{powerpc-mpc8544ds => ppc-mpc8544ds}/readme.txt (89%)

diff --git a/board/qemu/powerpc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
similarity index 89%
rename from board/qemu/powerpc-mpc8544ds/readme.txt
rename to board/qemu/ppc-mpc8544ds/readme.txt
index 27b3bee..7ba4832 100644
--- a/board/qemu/powerpc-mpc8544ds/readme.txt
+++ b/board/qemu/ppc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.0.2
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 6d7f24d..371fa92 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,15 +6,15 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.13 headers to avoid breaking with newer kernels
+# Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
-- 
2.0.4
