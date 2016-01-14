From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 21:40:26 +0100
Subject: [Buildroot] [git commit] configs/minnowboard_max: bump kernel to
	version 4.4
Message-ID: <20160114204314.4C7958276A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a664fc74ea960aeb5f5afc6400147910e47e7748
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And point the readme to wiki.minnowboard.org instead of the legacy
elinux.org page.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard-max/{linux-3.19.config => linux.config} |  0
 board/minnowboard-max/readme.txt                          |  2 +-
 configs/minnowboard_max_defconfig                         | 10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/minnowboard-max/linux-3.19.config b/board/minnowboard-max/linux.config
similarity index 100%
rename from board/minnowboard-max/linux-3.19.config
rename to board/minnowboard-max/linux.config
diff --git a/board/minnowboard-max/readme.txt b/board/minnowboard-max/readme.txt
index f865b66..5f52369 100644
--- a/board/minnowboard-max/readme.txt
+++ b/board/minnowboard-max/readme.txt
@@ -37,4 +37,4 @@ Prepare the SD card for the Minnow Board MAX
  4. Enjoy
 
 Additional information about this board can be found at
-http://www.minnowboard.org/ or http://elinux.org/Minnowboard:MinnowMax.
+http://www.minnowboard.org/ or http://wiki.minnowboard.org/MinnowBoard_MAX
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index d370f6f..5603aa9 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -6,10 +6,10 @@ BR2_x86_atom=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.4 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.4"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Needed for ethernet
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -18,9 +18,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
