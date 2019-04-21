From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 21:44:18 +0200
Subject: [Buildroot] [git commit] configs/olimex_a64_olinuxino: U-Boot needs
 pylibfdt
Message-ID: <20190421201515.5A3F081429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebf56d25b436fe1c00769b82f7f80516b02f4470
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of U-Boot to 2019.01, pylibfdt is needed to be able to
build the U-Boot image, so we need to enable
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339498

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olimex_a64_olinuxino_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index 6838be7203..c7bd514581 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -20,6 +20,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
