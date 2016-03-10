From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 21:22:44 +0100
Subject: [Buildroot] [git commit] configs/altera_socdk_defconfig: use http
	access for u-boot/linux git repos
Message-ID: <20160310202908.A28748188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9415c5663525b54d3a6abb9325974ca2f02f9736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/114650743

git:// access to git.rocketboards.org has been failing for a while, and
git:// is sometimes not allowed through corporate firewalls, so change to
git-over-http instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/altera_socdk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/altera_socdk_defconfig b/configs/altera_socdk_defconfig
index 6b05a27..a7b78ca 100644
--- a/configs/altera_socdk_defconfig
+++ b/configs/altera_socdk_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.rocketboards.org/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.rocketboards.org/linux-socfpga.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-3.13_14.02.02"
 BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
 BR2_LINUX_KERNEL_ZIMAGE=y
@@ -27,7 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_3=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.rocketboards.org/u-boot-socfpga.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.rocketboards.org/u-boot-socfpga.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_socfpga_v2013.01.01_14.02.02"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
