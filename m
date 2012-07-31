From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Jul 2012 18:13:11 -0300
Subject: [Buildroot] [PATCH 07/11] qemu/mipsel-malta: update to use kernel
	3.4.7
In-Reply-To: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1343769195-25220-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-3.3.config => linux-3.4.config}         |    0
 board/qemu/mipsel-malta/readme.txt                 |    2 ++
 configs/qemu_mipsel_malta_defconfig                |    8 ++++----
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename board/qemu/mipsel-malta/{linux-3.3.config => linux-3.4.config} (100%)

diff --git a/board/qemu/mipsel-malta/linux-3.3.config b/board/qemu/mipsel-malta/linux-3.4.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.3.config
rename to board/qemu/mipsel-malta/linux-3.4.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index 94e959d..09ad500 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -5,3 +5,5 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
+
+Tested with QEMU 1.1.1
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 4a4879c..055c1b1 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_3=y
+# Lock to 3.4 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.4.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
-- 
1.7.8.6
