From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 22:49:45 +0100
Subject: [Buildroot] [git commit] qemu/mips64-malta: update to use kernel
	3.6.6
Message-ID: <20121115230536.2407F99E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08e182523b1b9a073cda184dd040c1980ac54548
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.5.config => linux-3.6.config}         |    0
 board/qemu/mips64-malta/readme.txt                 |    4 ++++
 configs/qemu_mips64_malta_defconfig                |    7 +++++--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/board/qemu/mips64-malta/linux-3.5.config b/board/qemu/mips64-malta/linux-3.6.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.5.config
rename to board/qemu/mips64-malta/linux-3.6.config
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 5087b01..ad24b6e 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,3 +5,7 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
+
+This configuration is known to be flaky.
+
+Tested with QEMU 1.2.0
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index c7e977a..2c1192a 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -10,12 +10,15 @@ BR2_PREFER_STATIC_LIB=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Lock to 3.6 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_6=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
