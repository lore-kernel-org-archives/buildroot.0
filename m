From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 May 2012 22:08:35 -0300
Subject: [Buildroot] [PATCH 4/8] qemu/mips-malta: update to use kernel 3.3.4
In-Reply-To: <1336093719-20972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336093719-20972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336093719-20972-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_mips_malta_defconfig |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 2dc3f70..16ffe8f 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,10 +6,13 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Lock to 3.3 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_3=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
1.7.3.4
