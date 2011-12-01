From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Dec 2011 08:58:30 -0000
Subject: [Buildroot] [git commit] qemu_sparc: add new qemu defconfig
Message-ID: <20111201085829.C8F668F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ae731063619966f58ed8b58eeeda6cda5b0ed25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new qemu sample config for the SPARC architecture.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/sparc-ss10/readme.txt  |    7 +++++++
 configs/qemu_sparc_ss10_defconfig |   14 ++++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

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
