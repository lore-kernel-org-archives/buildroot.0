From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 23:27:01 +0100
Subject: [Buildroot] [git commit] configs: add Qemu nios2 defconfig
Message-ID: <20170125222829.172AD81DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c8f7011cb2246a5a546ff0bb12f723f2d7a9735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with Qemu the latest master (upcoming 2.9 release)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/nios2-10m50/linux-4.9.fragment | 3 +++
 board/qemu/nios2-10m50/readme.txt         | 9 +++++++++
 configs/qemu_nios2_10m50_defconfig        | 7 +++++++
 3 files changed, 19 insertions(+)

diff --git a/board/qemu/nios2-10m50/linux-4.9.fragment b/board/qemu/nios2-10m50/linux-4.9.fragment
new file mode 100644
index 0000000..76c864f
--- /dev/null
+++ b/board/qemu/nios2-10m50/linux-4.9.fragment
@@ -0,0 +1,3 @@
+# Embed the DTB in the kernel image
+CONFIG_NIOS2_DTB_SOURCE_BOOL=y
+CONFIG_NIOS2_DTB_SOURCE="arch/nios2/boot/dts/10m50_devboard.dts"
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
new file mode 100644
index 0000000..978ba95
--- /dev/null
+++ b/board/qemu/nios2-10m50/readme.txt
@@ -0,0 +1,9 @@
+Run the emulation with:
+
+  qemu-system-nios2 -kernel output/images/vmlinux -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with the upcoming QEMU 2.9.0 [1]
+
+[1] http://git.qemu.org/?p=qemu.git;h=ae5045ae5b2bbd8ce1335d1b05f9ecacca83a6cf
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
new file mode 100644
index 0000000..d6b3e1f
--- /dev/null
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -0,0 +1,7 @@
+BR2_nios2=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.5"
+BR2_LINUX_KERNEL_DEFCONFIG="10m50"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux-4.9.fragment"
+BR2_TARGET_ROOTFS_INITRAMFS=y
