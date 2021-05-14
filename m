From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 May 2021 00:03:16 +0200
Subject: [Buildroot] [PATCH 2/2] configs/beaglev: enable host jh71xx-tools
In-Reply-To: <20210514220316.1942381-1-thomas.petazzoni@bootlin.com>
References: <20210514220316.1942381-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210514220316.1942381-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This host utility is useful to recover the bootloader.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beaglev/readme.txt  | 4 +++-
 configs/beaglev_defconfig | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/beaglev/readme.txt b/board/beaglev/readme.txt
index bbdb9b12ef..60678059e1 100644
--- a/board/beaglev/readme.txt
+++ b/board/beaglev/readme.txt
@@ -119,4 +119,6 @@ bootloaders, so if you flash non-working versions, you'll have to go
 through a recovery process. This requires wiring up to a separate
 debug UART, which pins are located near the HDMI connector. See
 https://wiki.seeedstudio.com/BeagleV-Update-bootloader-ddr-init-boot-uboot-Recover-bootloader/
-section "Recover the bootloader" for more details.
+section "Recover the bootloader" for more details. The instructions
+make use of a jh7100-recover tool, which Buildroot has built as part
+of this defconfig: it is available as output/host/bin/jh7100-recover.
diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 8943ce9c34..bbb69ca268 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -35,3 +35,4 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,3f3ac01a29ad1cd5fa519d86f81daead2447f1d4)/uboot-3f3ac01a29ad1cd5fa519d86f81daead2447f1d4.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_JH71XX_TOOLS=y
-- 
2.31.1
