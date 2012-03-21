From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 23:05:59 +0100
Subject: [Buildroot] [git commit] qemu/x86: update to use kernel 3.3
Message-ID: <20120321223126.0A3EA96928@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1775ca03a09c96613c7740c9954d33c420231031
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch documentation to use qemu-system-i386

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x86/{linux-3.2.config => linux-3.3.config}     |    0
 board/qemu/x86/readme.txt                          |    2 +-
 configs/qemu_x86_defconfig                         |    4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)

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
