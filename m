From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Oct 2011 16:42:12 -0300
Subject: [Buildroot] [PATCH 4/6] qemu_x86: update to kernel 3.1 and add
	readme
In-Reply-To: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1319485334-15790-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../x86/{linux-3.0.config => linux-3.1.config}     |    0
 board/qemu/x86/readme.txt                          |    5 +++++
 configs/qemu_x86_defconfig                         |    5 +++--
 3 files changed, 8 insertions(+), 2 deletions(-)
 rename board/qemu/x86/{linux-3.0.config => linux-3.1.config} (100%)
 create mode 100644 board/qemu/x86/readme.txt

diff --git a/board/qemu/x86/linux-3.0.config b/board/qemu/x86/linux-3.1.config
similarity index 100%
rename from board/qemu/x86/linux-3.0.config
rename to board/qemu/x86/linux-3.1.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
new file mode 100644
index 0000000..c06d24f
--- /dev/null
+++ b/board/qemu/x86/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
+
+The login prompt will appear in the graphical window.
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index d60b38d..8efe9ae 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -4,6 +4,7 @@ BR2_x86_pentiumpro=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
@@ -12,6 +13,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.0.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.0.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.1.config"
-- 
1.7.3.4
