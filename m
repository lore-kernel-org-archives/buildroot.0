From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 10 Jul 2019 18:21:13 +0200
Subject: [Buildroot] [PATCH] configs/atmel_sama5d27_som1: add rng-tools
 package
In-Reply-To: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
References: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1562775673-22148-2-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

More entropy is required at boot time for the ssh
daemon to start.

So, enable rngd which feeds the entropy to the kernel
entropy tool.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index ed25f04..f1abf83 100644
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
-- 
2.7.4
