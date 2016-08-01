From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  1 Aug 2016 12:39:02 -0300
Subject: [Buildroot] [PATCH] configs: warpboard: Select wireless related
	packages
Message-ID: <1470065942-25454-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Let the wireless packages be selected by default to make the
usage of Wifi a bit simpler.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/warpboard/README | 2 --
 configs/warpboard_defconfig      | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
index d900c6d..55d51f8 100644
--- a/board/freescale/warpboard/README
+++ b/board/freescale/warpboard/README
@@ -66,8 +66,6 @@ $ hciconfig hci0 up
 Using Wifi
 ==========
 
-Enable the wireless_utils and wpa_suplicant packages, and then run:
-
 # modprobe brcmfmac
 # iwconfig wlan0 essid ACCESSPOINTNAME
 # wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 5e6d27e..19425b3 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -25,6 +25,11 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
 
+# wireless packages
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+
 # uboot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp"
-- 
1.9.1
