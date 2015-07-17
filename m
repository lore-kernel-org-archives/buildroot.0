From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 17 Jul 2015 09:59:10 +0200
Subject: [Buildroot] [PATCH 2/2 v2] wpa_supplicant: Have Hotspot 2.0 depend
	on nl80211
In-Reply-To: <1437119950-25976-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <55A8B3A2.4010107@green-communications.fr>
 <1437119950-25976-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <1437119950-25976-2-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hotspot 2.0 uses ANQP whose implementation needs offchannel/
remain-on-channel capabilities from the driver, which only exist in the
nl80211 driver.  Compiling would work, but the feature would not work.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---

v2: added signoff.
 package/wpa_supplicant/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 29dc4b9..22cf7f8 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
 
 config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
 	bool "Enable HS20"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
 	help
 	  Enable Hotspot 2.0 and IEEE 802.11u interworking functionality.
 
-- 
2.1.4
