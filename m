From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  2 May 2020 23:28:12 +0200
Subject: [Buildroot] [PATCH 6/6] configs/nanopi_neo4: fix U-Boot dependencies
In-Reply-To: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
References: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200502212812.51219-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In fact, nanopi_neo4 does not need pylibfdt or pyelftools, but only a
host Python interpreter, to run
./arch/arm/mach-rockchip/make_fit_atf.py.

Since upstream U-Boot commit f05d5743567984b4fff6a862fc0f42760ff135da,
this script no longer needs pyelftools. However, since upstream commit
6d06ea34239ab5099783ce588ad4aead96e1fccb (merged in U-Boot 2020.01),
it requires Python 3.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nanopi_neo4_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/nanopi_neo4_defconfig b/configs/nanopi_neo4_defconfig
index 6e507235cf..b79ee1ae79 100644
--- a/configs/nanopi_neo4_defconfig
+++ b/configs/nanopi_neo4_defconfig
@@ -22,8 +22,8 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-neo4-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.26.2
