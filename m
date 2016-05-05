From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:18:53 +0200
Subject: [Buildroot] [git commit] configs/freescale_mpc8315erdb: lock down
	binutils version
Message-ID: <20160505201945.6951B81794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a54e4a3b34d00285595e82a58593169c817c1c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The used U-Boot version (2014.04) isn't too happy with newer (>= 2.25)
binutils versions, so keep it locked down until the config is updated
for a newer version.
U-Boot 2016.03 in fact does work for mpc8315erdb - however it doesn't
yet support SPL which is necessary for NAND boot and would be a massive
defconfig revamp switching to NOR.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
