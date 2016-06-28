From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 28 Jun 2016 10:45:27 +0300
Subject: [Buildroot] [PATCH] wandboard: Use HTTP for accessing Linux kernel
	and U-Boot git repos
Message-ID: <1467099927-32036-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quite often these days Git ports are blocked by firewalls
[this is especially true in corporate environment] so switching
to common HTTP(s) is a safe and pretty convenient move.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Stephan Hoffmann <sho@relinux.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 configs/wandboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index cf71eb2..d616d0e 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_USE_DEFCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="33711bdd4a4dce942fb5ae85a68899a8357bdd94"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.img"
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
 BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/wandboard-org/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/wandboard-org/linux"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e2213f9a98dd7413ee5a9ca40cf60e8cb8292f4a"
 BR2_LINUX_KERNEL_DEFCONFIG="wandboard"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.5.5
