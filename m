From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 11:54:24 -0300
Subject: [Buildroot] [PATCH 04/11] qemu/x86_64: update to use kernel 3.5.4
In-Reply-To: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1348239271-17456-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../x86_64/{linux-3.4.config => linux-3.5.config}  |    0
 configs/qemu_x86_64_defconfig                      |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/qemu/x86_64/{linux-3.4.config => linux-3.5.config} (100%)

diff --git a/board/qemu/x86_64/linux-3.4.config b/board/qemu/x86_64/linux-3.5.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.4.config
rename to board/qemu/x86_64/linux-3.5.config
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 91f5fc9..b7dac33 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.4 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_4=y
+# Lock to 3.5 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.5.config"
-- 
1.7.8.6
