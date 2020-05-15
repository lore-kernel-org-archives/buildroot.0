From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 May 2020 22:59:21 +0200
Subject: [Buildroot] [git commit] configs/roc_pc_rk3399: fix U-Boot
 dependencies
Message-ID: <20200515204314.4BDB8918D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f51cbc33d93e27b4281cfb7742b6e9fa9bfd38d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In fact, roc_pc_rk3399 does not need pylibfdt or pyelftools, but only
a host Python interpreter, to run
./arch/arm/mach-rockchip/make_fit_atf.py.

Since upstream U-Boot commit f05d5743567984b4fff6a862fc0f42760ff135da,
this script no longer needs pyelftools. However, since upstream commit
6d06ea34239ab5099783ce588ad4aead96e1fccb (merged in U-Boot 2020.01),
it requires Python 3.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: update with the new NEEDS_PYTHON semantics]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/roc_pc_rk3399_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 114b0e8c95..dfbc5e4f47 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -22,8 +22,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
