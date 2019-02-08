From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Feb 2019 13:31:10 +0100
Subject: [Buildroot] [git commit] configs/rock64: needs U-Boot pylibfdt
Message-ID: <20190208122958.5D9C688632@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34ce67f4175c9b5628519e4da26a747d537ce043
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build currently fails with:

*** dtoc needs the Python libfdt library. Either
*** install it on your system, or try:
***
*** sudo apt-get install swig libpython-dev
***
*** to have U-Boot build its own version.

Adding BR2_TARGET_UBOOT_NEEDS_PYLIBFDT should fix this build issue,
which was reported at:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/158295223

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/rock64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
index 29b8e9d3c5..50ffc0474f 100644
--- a/configs/rock64_defconfig
+++ b/configs/rock64_defconfig
@@ -26,6 +26,7 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ayufan-rock64/linux-u-boot.
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2017.09-rockchip-ayufan-1035-gd646df03ac"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock64-rk3328"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
