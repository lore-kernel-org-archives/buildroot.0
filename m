From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 16:24:22 +0100
Subject: [Buildroot] [git commit branch/next]
	configs/olimex_imx233_olinuxino: restore Wifi config
Message-ID: <20161111153439.6B0AC819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f4c619c5820ca29c6975312e90efe267a909a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a fragment with configs from retired linux-3.18.config.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/olimex/imx233_olinuxino/linux-wifi.fragment | 18 ++++++++++++++++++
 configs/olimex_imx233_olinuxino_defconfig         |  1 +
 2 files changed, 19 insertions(+)

diff --git a/board/olimex/imx233_olinuxino/linux-wifi.fragment b/board/olimex/imx233_olinuxino/linux-wifi.fragment
new file mode 100644
index 0000000..b70dea2
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/linux-wifi.fragment
@@ -0,0 +1,18 @@
+# Network testing
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
+# MII PHY device drivers
+CONFIG_WLAN=y
+CONFIG_RTL8187=m
+CONFIG_ATH9K_HTC=m
+CONFIG_RT2X00=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+CONFIG_RT2800USB_UNKNOWN=y
+CONFIG_RTL_CARDS=m
+CONFIG_RTL8192CU=m
+CONFIG_ZD1211RW=m
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 70e8b5d..37ec4d7 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/imx233_olinuxino/linux-wifi.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
 BR2_LINUX_KERNEL_UIMAGE=y
