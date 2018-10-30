From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Oct 2018 22:38:45 +0100
Subject: [Buildroot] [PATCH v2] configs/{at91,
 atmel}*_dev*: drop Dropbear as it duplicates OpenSSH
Message-ID: <20181030213845.20161-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "development" defconfigs for Atmel platforms enable both OpenSSH
and Dropbear, which doesn't make a lot of sense, as only one SSH
server can start on port 22.

This commit therefore drops BR2_PACKAGE_DROPBEAR=y from those
defconfigs, keeping OpenSSH as an SSH server/client, as was requested
by Atmel/Microchip folks in the review of an earlier version of this
patch [1]. Since those defconfigs are "development" defconfigs, they
are not meant to be minimal, and already provide an arbitrary set of
packages, so using openssh is just as good as using dropbear in this
case.

[1] https://patchwork.ozlabs.org/patch/989516/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
---
Changes since v1:
 - Keep OpenSSH and drop Dropbear, as suggested by Nicolas Ferre from
   Microchip.
---
 configs/at91sam9x5ek_dev_defconfig               | 1 -
 configs/at91sam9x5ek_mmc_dev_defconfig           | 1 -
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 -
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 1 -
 configs/atmel_sama5d3_xplained_dev_defconfig     | 1 -
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 1 -
 configs/atmel_sama5d4_xplained_dev_defconfig     | 1 -
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 1 -
 8 files changed, 8 deletions(-)

diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index dee365a56c..505be8d047 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -59,7 +59,6 @@ BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_BLUEZ_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
-BR2_PACKAGE_DROPBEAR=y
 BR2_PACKAGE_ETHTOOL=y
 BR2_PACKAGE_IPERF=y
 BR2_PACKAGE_IPROUTE2=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index a8fdad72b7..cd65912883 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -62,7 +62,6 @@ BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_BLUEZ_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
-BR2_PACKAGE_DROPBEAR=y
 BR2_PACKAGE_ETHTOOL=y
 BR2_PACKAGE_IPERF=y
 BR2_PACKAGE_IPROUTE2=y
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index f3cb11ce70..9985b64727 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -51,7 +51,6 @@ BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_BLUEZ_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
-BR2_PACKAGE_DROPBEAR=y
 BR2_PACKAGE_ETHTOOL=y
 BR2_PACKAGE_IPERF=y
 BR2_PACKAGE_IPROUTE2=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 78d082f9cb..bc5414c4f4 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -65,7 +65,6 @@ BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_BLUEZ_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
-BR2_PACKAGE_DROPBEAR=y
 BR2_PACKAGE_ETHTOOL=y
 BR2_PACKAGE_IPERF=y
 BR2_PACKAGE_IPROUTE2=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 91ded5bfeb..520cbc833d 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -61,7 +61,6 @@ BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_BLUEZ_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
-BR2_PACKAGE_DROPBEAR=y
 BR2_PACKAGE_ETHTOOL=y
 BR2_PACKAGE_IPERF=y
 BR2_PACKAGE_IPROUTE2=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index 20dc8929ab..a1e34ab810 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -64,7 +64,6 @@ BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_BLUEZ_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
-BR2_PACKAGE_DROPBEAR=y
 BR2_PACKAGE_ETHTOOL=y
 BR2_PACKAGE_IPERF=y
 BR2_PACKAGE_IPROUTE2=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 69a71eb51e..9197564c20 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -62,7 +62,6 @@ BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_BLUEZ_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
-BR2_PACKAGE_DROPBEAR=y
 BR2_PACKAGE_ETHTOOL=y
 BR2_PACKAGE_IPERF=y
 BR2_PACKAGE_IPROUTE2=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index 60692d98cb..f20e114ff1 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -65,7 +65,6 @@ BR2_PACKAGE_DTC_PROGRAMS=y
 BR2_PACKAGE_BLUEZ_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
-BR2_PACKAGE_DROPBEAR=y
 BR2_PACKAGE_ETHTOOL=y
 BR2_PACKAGE_IPERF=y
 BR2_PACKAGE_IPROUTE2=y
-- 
2.14.4
