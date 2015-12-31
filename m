From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 15:28:15 +0100
Subject: [Buildroot] [git commit] configs: orangepipc defconfig needs dtc
	for u-boot
Message-ID: <20151231142931.385E182793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c12a3ea5e5f56b93c5c08adc986b037af7452b39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As can be seen at
https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/99518455,
the new Orange Pi PC defconfig fails to build due to DTC being missing
when building U-Boot. This commit adds the appropriate option to add
DTC as a dependency to U-Boot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/orangepipc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index f430392..f39ea43 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BOARDNAME="orangepi_pc"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="4832e17787acb29734d895751bc7a594908aecc6"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
