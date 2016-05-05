From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 May 2016 12:30:28 -0300
Subject: [Buildroot] [PATCH 1/3] configs/freescale_mpc8315erdb: lock down
	binutils version
Message-ID: <1462462230-30078-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The used U-Boot version (2014.04) isn't too happy with newer (>= 2.25)
binutils versions, so keep it locked down until the config is updated
for a newer version.
U-Boot 2016.03 in fact does work for mpc8315erdb - however it doesn't
yet support SPL which is necessary for NAND boot and would be a massive
defconfig revamp switching to NOR.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/freescale_mpc8315erdb_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 457736e..b931471 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -28,6 +28,8 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Bootloader
+# Lock down binutils to <2.25 to avoid U-Boot build failure
+BR2_BINUTILS_VERSION_2_24_X=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-- 
2.7.3
