From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 11:40:24 +0200
Subject: [Buildroot] [PATCH] configs/{at91sam9*,
 atmel*}: drop OpenSSH as it duplicates Dropbear
Message-ID: <20181026094024.31108-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "development" defconfigs for Atmel platforms enable both OpenSSH
and Dropbear, which doesn't make a lot of sense, as only one SSH
server can start on port 22.

This commit therefore drops BR2_PACKAGE_OPENSSH=y from those
defconfigs, keeping Dropbear as an SSH server/client.

However, since BR2_PACKAGE_OPENSSH=y was enabling OpenSSL, we keep
BR2_PACKAGE_OPENSSL=y enable to preserve SSL support in other packages
(for example "wget").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 configs/at91sam9x5ek_dev_defconfig               | 2 +-
 configs/at91sam9x5ek_mmc_dev_defconfig           | 2 +-
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d3_xplained_dev_defconfig     | 2 +-
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d4_xplained_dev_defconfig     | 2 +-
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index dee365a56c..2971befa19 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -67,7 +67,7 @@ BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_LRZSZ=y
 BR2_PACKAGE_MII_DIAG=y
-BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
 BR2_PACKAGE_WGET=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index a8fdad72b7..112146320e 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -70,7 +70,7 @@ BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_LRZSZ=y
 BR2_PACKAGE_MII_DIAG=y
-BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
 BR2_PACKAGE_WGET=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index f3cb11ce70..b32bcd6a28 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -59,7 +59,7 @@ BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_LRZSZ=y
 BR2_PACKAGE_MII_DIAG=y
-BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
 BR2_PACKAGE_WGET=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 78d082f9cb..0a7685b0b1 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -73,7 +73,7 @@ BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_LRZSZ=y
 BR2_PACKAGE_MII_DIAG=y
-BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
 BR2_PACKAGE_WGET=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 91ded5bfeb..40f781531d 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -69,7 +69,7 @@ BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_LRZSZ=y
 BR2_PACKAGE_MII_DIAG=y
-BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
 BR2_PACKAGE_WGET=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index 20dc8929ab..c16cb67fd0 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -72,7 +72,7 @@ BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_LRZSZ=y
 BR2_PACKAGE_MII_DIAG=y
-BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
 BR2_PACKAGE_WGET=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 69a71eb51e..c2e1418431 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -70,7 +70,7 @@ BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_LRZSZ=y
 BR2_PACKAGE_MII_DIAG=y
-BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
 BR2_PACKAGE_WGET=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index 60692d98cb..9f7318d420 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -73,7 +73,7 @@ BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_LRZSZ=y
 BR2_PACKAGE_MII_DIAG=y
-BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
 BR2_PACKAGE_WGET=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
-- 
2.14.4
