From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 22:06:08 +0200
Subject: [Buildroot] [git commit] configs/pine64: U-Boot needs pylibfdt
Message-ID: <20190421201515.7594581429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cc7ab0eaf579e73f6e482a6cc04044d2c7b7f19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of U-Boot to 2019.01, pylibfdt is needed to be able to
build the U-Boot image, so we need to enable
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339518

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pine64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index 3c65ee03e6..dea9a1f5b4 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -20,6 +20,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
