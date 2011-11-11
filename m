From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Nov 2011 18:12:47 -0300
Subject: [Buildroot] [PATCH 2/2] qemu_sparc: add new qemu defconfig
In-Reply-To: <1321045967-6216-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321045967-6216-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321045967-6216-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new qemu sample config for the SPARC architecture.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/sparc-ss10/readme.txt  |    7 +++++++
 configs/qemu_sparc_ss10_defconfig |   14 ++++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/sparc-ss10/readme.txt
 create mode 100644 configs/qemu_sparc_ss10_defconfig

diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
new file mode 100644
index 0000000..5f01efa
--- /dev/null
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio
+
+The login prompt will appear in the terminal that started Qemu.
+The graphical window is the framebuffer.
+
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
new file mode 100644
index 0000000..20cd9fb
--- /dev/null
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_sparc=y
+BR2_sparc_supersparc=y
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
