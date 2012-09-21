From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 11:54:31 -0300
Subject: [Buildroot] [PATCH 11/11] qemu/mips64-malta: update to use kernel
	3.5.4
In-Reply-To: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1348239271-17456-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to use the latest kernel 3.5.4.
And also update to the latest .config knobs, otherwise we were just
building a mips(32) target which failed miserably.
This config is still flaky, you get a login prompt but usually fail to
login, passing along an init=/bin/sh helps some but crashes are quite
usual.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-3.3.config => linux-3.5.config}         |    0
 configs/qemu_mips64_malta_defconfig                |    7 +++----
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename board/qemu/mips64-malta/{linux-3.3.config => linux-3.5.config} (100%)

diff --git a/board/qemu/mips64-malta/linux-3.3.config b/board/qemu/mips64-malta/linux-3.5.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.3.config
rename to board/qemu/mips64-malta/linux-3.5.config
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 5653c88..c7e977a 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -1,6 +1,5 @@
 # Architecture
-BR2_mips=y
-BR2_mips_64=y
+BR2_mips64=y
 BR2_MIPS_NABI64=y
 
 # Toolchain
@@ -14,9 +13,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
-- 
1.7.8.6
