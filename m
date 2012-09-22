From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:48:22 +0200
Subject: [Buildroot] [git commit] qemu/mips64-malta: update to use kernel
	3.5.4
Message-ID: <20120922194945.5D537996DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d358e457237edbcdbef77fe29c40ef8f03fa769f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to use the latest kernel 3.5.4.
And also update to the latest .config knobs, otherwise we were just
building a mips(32) target which failed miserably.
This config is still flaky, you get a login prompt but usually fail to
login, passing along an init=/bin/sh helps some but crashes are quite
usual.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.3.config => linux-3.5.config}         |    0
 configs/qemu_mips64_malta_defconfig                |    7 +++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/board/qemu/mips64-malta/linux-3.3.config b/board/qemu/mips64-malta/linux-3.5.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.3.config
rename to board/qemu/mips64-malta/linux-3.5.config
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 5653c88..c7e977a 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -1,6 +1,5 @@
 # Architecture
-BR2_mips=y
-BR2_mips_64=y
+BR2_mips64=y
 BR2_MIPS_NABI64=y
 
 # Toolchain
@@ -14,9 +13,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
