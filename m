From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Feb 2012 22:57:17 +0100
Subject: [Buildroot] [git commit] qemu/ppc-g3beige: update readme and use
	kernel 3.2.6
Message-ID: <20120301130635.574D190BF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53d2eaaaca78f6c3c14d765a7735d9c8a1f44691
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.1.config => linux-3.2.config}         |    0
 board/qemu/powerpc-g3beige/readme.txt              |    2 +-
 configs/qemu_ppc_g3beige_defconfig                 |    4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/powerpc-g3beige/linux-3.1.config b/board/qemu/powerpc-g3beige/linux-3.2.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.1.config
rename to board/qemu/powerpc-g3beige/linux-3.2.config
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 1006af9..a481b11 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-ppc -M g3beige -kernel vmlinux -hda rootfs.ext2 -append "console=ttyS0 root=/dev/hdc" -serial stdio
+  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -hda output/images/rootfs.ext2 -append "console=ttyS0 root=/dev/hdc" -serial stdio
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index cf875f0..432a746 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,9 +9,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
