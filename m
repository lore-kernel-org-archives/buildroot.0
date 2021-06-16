From: Drew Fustini <drew@beagleboard.org>
Date: Tue, 15 Jun 2021 22:03:43 -0700
Subject: [Buildroot] [PATCH v2 3/4] configs/beaglev: update U-Boot to enable
 OF_SEPARATE
In-Reply-To: <20210616050341.510702-1-drew@beagleboard.org>
References: <20210616050341.510702-1-drew@beagleboard.org>
Message-ID: <20210616050341.510702-4-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update commit ID of U-Boot to latest commit in starfive-tech repo [1]
which enables OF_SEPARATE [2].

[1] https://github.com/starfive-tech/u-boot/tree/Fedora_VIC_7100_2021.04
[2] https://github.com/starfive-tech/u-boot/commit/64ead5b83959da8eb87b6963843addf5942e6ed4

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 configs/beaglev_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 895902a11a7c..fcbea2cdec86 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # HEAD of the starfive-tech:Fedora_VIC_7100_2021.04 branch
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,494e5ef7b8071d0b2fba50616d97771e44cbcb7c)/uboot-494e5ef7b8071d0b2fba50616d97771e44cbcb7c.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,64ead5b83959da8eb87b6963843addf5942e6ed4)/uboot-64ead5b83959da8eb87b6963843addf5942e6ed4.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_JH71XX_TOOLS=y
-- 
2.27.0
