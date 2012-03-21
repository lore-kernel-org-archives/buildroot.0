From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Mar 2012 23:45:13 -0300
Subject: [Buildroot] [PATCH 8/8] qemu/x86: update to use kernel 3.3
In-Reply-To: <1332297913-7699-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332297913-7699-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332297913-7699-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch documentation to use qemu-system-i386

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../x86/{linux-3.2.config => linux-3.3.config}     |    0
 board/qemu/x86/readme.txt                          |    2 +-
 configs/qemu_x86_defconfig                         |    4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename board/qemu/x86/{linux-3.2.config => linux-3.3.config} (100%)

diff --git a/board/qemu/x86/linux-3.2.config b/board/qemu/x86/linux-3.3.config
similarity index 100%
rename from board/qemu/x86/linux-3.2.config
rename to board/qemu/x86/linux-3.3.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index c06d24f..4ba6607 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
 
 The login prompt will appear in the graphical window.
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index d20850a..5d0e23b 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -13,6 +13,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.3.config"
-- 
1.7.3.4
