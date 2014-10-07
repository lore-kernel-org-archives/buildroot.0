From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Oct 2014 09:29:51 -0300
Subject: [Buildroot] [PATCH 16/19] qemu/ppc-g3beige: update to the latest
	versions
In-Reply-To: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412684994-28760-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../linux-3.16.config => ppc-g3beige/linux-3.17.config}        |  4 +---
 board/qemu/{powerpc-g3beige => ppc-g3beige}/readme.txt         |  2 +-
 configs/qemu_ppc_g3beige_defconfig                             | 10 +++++-----
 3 files changed, 7 insertions(+), 9 deletions(-)
 rename board/qemu/{powerpc-g3beige/linux-3.16.config => ppc-g3beige/linux-3.17.config} (93%)
 rename board/qemu/{powerpc-g3beige => ppc-g3beige}/readme.txt (93%)

diff --git a/board/qemu/powerpc-g3beige/linux-3.16.config b/board/qemu/ppc-g3beige/linux-3.17.config
similarity index 93%
rename from board/qemu/powerpc-g3beige/linux-3.16.config
rename to board/qemu/ppc-g3beige/linux-3.17.config
index a8dd1f6..cf84c75 100644
--- a/board/qemu/powerpc-g3beige/linux-3.16.config
+++ b/board/qemu/ppc-g3beige/linux-3.17.config
@@ -13,7 +13,6 @@ CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_CONNECTOR=y
-CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_IDE=y
 CONFIG_BLK_DEV_IDECD=y
@@ -38,8 +37,7 @@ CONFIG_SERIAL_PMACZILOG_CONSOLE=y
 CONFIG_SSB=y
 CONFIG_SSB_PCMCIAHOST=y
 CONFIG_SSB_DRIVER_PCICORE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_SQUASHFS=y
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
similarity index 93%
rename from board/qemu/powerpc-g3beige/readme.txt
rename to board/qemu/ppc-g3beige/readme.txt
index e716830..d227650 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.1.0
+Tested with QEMU 2.1.2
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index ad2de80..5aa7157 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,17 +6,17 @@ BR2_powerpc_750=y
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
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.16.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-3.17.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
-- 
2.0.4
