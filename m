From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:26:40 +0200
Subject: [Buildroot] [PATCHv2 06/12] configs/nanopi_r1_defconfig: remove
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421172646.3340666-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig use a custom defconfig file located
in board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig.

BR2_TARGET_UBOOT_BOARD_DEFCONFIG is used to provide the name
of a in-tree defconfig. Since a custom defconfig is used,
this option is lost while loading the defconfig with:
make nanopi_r1_defconfig

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.3
