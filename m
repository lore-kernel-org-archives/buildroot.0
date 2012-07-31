From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:40:40 +0200
Subject: [Buildroot] [git commit] qemu/x86: update to use kernel 3.4.7
Message-ID: <20120731214057.05911909D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13eb14808a62077265bfbb16ba82952674b969f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x86/{linux-3.3.config => linux-3.4.config}     |    0
 board/qemu/x86/readme.txt                          |    2 ++
 configs/qemu_x86_defconfig                         |    8 ++++----
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/qemu/x86/linux-3.3.config b/board/qemu/x86/linux-3.4.config
similarity index 100%
rename from board/qemu/x86/linux-3.3.config
rename to board/qemu/x86/linux-3.4.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 4ba6607..f6f5437 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -3,3 +3,5 @@ Run the emulation with:
   qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
 
 The login prompt will appear in the graphical window.
+
+Tested with QEMU 1.1.1
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 118cd7f..1851cec 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_3=y
+# Lock to 3.4 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.4.config"
