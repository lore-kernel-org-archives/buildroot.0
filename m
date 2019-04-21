From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 22:05:42 +0200
Subject: [Buildroot] [git commit] configs/orangepi_prime: U-Boot needs
 pylibfdt
Message-ID: <20190421201515.6EC5281429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=716b1e3a9f2dc245d22464a47c927eb5b233e0c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of U-Boot to 2019.01, pylibfdt is needed to be able to
build the U-Boot image, so we need to enable
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339510

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_prime_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_prime_defconfig b/configs/orangepi_prime_defconfig
index 8117b40477..8703dccad5 100644
--- a/configs/orangepi_prime_defconfig
+++ b/configs/orangepi_prime_defconfig
@@ -20,6 +20,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_prime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
