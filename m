From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 10:30:58 +0100
Subject: [Buildroot] [git commit] qemu/mipsel-malta: update readme and use
	kernel version 3.2
Message-ID: <20120106093658.6BB0E90018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37f488843cb7d5c2cca3d6455e5a19808e3c70eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update configuration to use kernel version 3.2
Also update the readme to use buildroot basedir as a reference for
kernel and rootfs like the other samples do.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.1.config => linux-3.2.config}         |    0
 board/qemu/mipsel-malta/readme.txt                 |    2 +-
 configs/qemu_mipsel_malta_defconfig                |    4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/mipsel-malta/linux-3.1.config b/board/qemu/mipsel-malta/linux-3.2.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.1.config
rename to board/qemu/mipsel-malta/linux-3.2.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index b494976..94e959d 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mipsel -M malta -kernel vmlinux -serial stdio -hda rootfs.ext2 -append "root=/dev/hda"
+ qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append "root=/dev/hda"
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 3f558fe..a46f886 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,9 +9,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
