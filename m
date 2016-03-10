From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 21:22:47 +0100
Subject: [Buildroot] [git commit] configs/altera_sockit_defconfig: use http
	access for u-boot/linux git repos
Message-ID: <20160310202908.BFD007F98D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=078708ba8d24c6a3c4053af194337dad84a3b905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/114650744

git:// access to git.rocketboards.org has been failing for a while, and
git:// is sometimes not allowed through corporate firewalls, so change to
git-over-http instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/altera_sockit_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index 6bd3a71..1ababaa 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.rocketboards.org/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.rocketboards.org/linux-socfpga.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-3.13_14.02.02"
 BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_3=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.rocketboards.org/u-boot-socfpga.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.rocketboards.org/u-boot-socfpga.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
 BR2_TARGET_UBOOT_PATCH="board/altera/sockit"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
