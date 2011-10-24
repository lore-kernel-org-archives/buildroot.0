From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Oct 2011 16:42:10 -0300
Subject: [Buildroot] [PATCH 2/6] qemu_arm_versatile: use kernel 3.1 and add
	readme
In-Reply-To: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1319485334-15790-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-2.6.38.config => linux-3.1.config}      |    0
 board/qemu/arm-versatile/readme.txt                |    6 ++++++
 configs/qemu_arm_versatile_defconfig               |    4 ++--
 3 files changed, 8 insertions(+), 2 deletions(-)
 rename board/qemu/arm-versatile/{linux-2.6.38.config => linux-3.1.config} (100%)
 create mode 100644 board/qemu/arm-versatile/readme.txt

diff --git a/board/qemu/arm-versatile/linux-2.6.38.config b/board/qemu/arm-versatile/linux-3.1.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-2.6.38.config
rename to board/qemu/arm-versatile/linux-3.1.config
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
new file mode 100644
index 0000000..834b0e0
--- /dev/null
+++ b/board/qemu/arm-versatile/readme.txt
@@ -0,0 +1,6 @@
+Run the emulation with:
+
+  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index e4a7024..b629ba9 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.38.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.1.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
