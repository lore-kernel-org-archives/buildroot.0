From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:13:36 +0200
Subject: [Buildroot] [git commit] configs/atmel_sama5d27_som1: add rng-tools
 package
Message-ID: <20190714134202.5AE76836DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2ea296355fb62af5540eb4f97a79332227f02f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

More entropy is required at boot time for the ssh
daemon to start.

So, enable rngd which feeds the entropy to the kernel
entropy tool.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index ed25f04ec5..f1abf83689 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -41,6 +41,7 @@ BR2_PACKAGE_WILC1000_FIRMWARE=y
 BR2_PACKAGE_DEVMEM2=y
 BR2_PACKAGE_EVTEST=y
 BR2_PACKAGE_I2C_TOOLS=y
+BR2_PACKAGE_RNG_TOOLS=y
 BR2_PACKAGE_SETSERIAL=y
 BR2_PACKAGE_SPI_TOOLS=y
 BR2_PACKAGE_USBUTILS=y
