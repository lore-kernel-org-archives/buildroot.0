From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 May 2012 22:49:03 +0200
Subject: [Buildroot] [git commit] qemu/ppc-mpc8544ds: add new sample config
Message-ID: <20120507205030.A74ED96C5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5324b41283e1a1c1bff98b013cf463c64151aec9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new powerpc-mpc8544ds sample qemu config.
Useful for SPE ABI testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/powerpc-mpc8544ds/readme.txt |    6 ++++++
 configs/qemu_ppc_mpc8544ds_defconfig    |   21 +++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/board/qemu/powerpc-mpc8544ds/readme.txt b/board/qemu/powerpc-mpc8544ds/readme.txt
new file mode 100644
index 0000000..6ecdc4b
--- /dev/null
+++ b/board/qemu/powerpc-mpc8544ds/readme.txt
@@ -0,0 +1,6 @@
+Run the emulation with:
+
+ qemu-system-ppc -M mpc8544ds -kernel output/images/vmlinux -serial stdio
+
+The login prompt will appear in the terminal that started Qemu.
+
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
new file mode 100644
index 0000000..996d6b2
--- /dev/null
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -0,0 +1,21 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_8548=y
+
+# filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Lock to 3.3 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_3=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.4"
+BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
