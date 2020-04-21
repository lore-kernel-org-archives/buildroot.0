From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:07:13 +0200
Subject: [Buildroot] [git commit] configs/nanopi_r1_defconfig: remove
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG
Message-ID: <20200421195434.2CC7D8FB42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86dc63fed927d7825071754e8408a10d7a96b1ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig use a custom defconfig file located
in board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig.

BR2_TARGET_UBOOT_BOARD_DEFCONFIG is used to provide the name
of a in-tree defconfig. Since a custom defconfig is used,
this option is lost while loading the defconfig with:
make nanopi_r1_defconfig

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nanopi_r1_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/nanopi_r1_defconfig b/configs/nanopi_r1_defconfig
index 112e84f786..4c45110bd2 100644
--- a/configs/nanopi_r1_defconfig
+++ b/configs/nanopi_r1_defconfig
@@ -15,7 +15,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_r1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/friendlyarm/nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
