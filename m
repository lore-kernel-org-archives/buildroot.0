From: Martin Bark <martin@barkynet.com>
Date: Sat, 11 Jun 2016 17:13:09 +0100
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: add support for simple
	background scan
Message-ID: <1465661589-10963-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CONFIG_BGSCAN_SIMPLE is missing from the defconfig included with
wpa_supplicant.  Many programs that depend on wpa_supplicant assume
bgscan is enabled, for example connman will try to set bgscan by default.
It is safe to always enable CONFIG_BGSCAN_SIMPLE since it is only used if
wpa_supplicant is configured to do so.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index ba1180d..21bbd3e 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -20,7 +20,8 @@ WPA_SUPPLICANT_INSTALL_STAGING = YES
 
 WPA_SUPPLICANT_CONFIG_EDITS =
 
-WPA_SUPPLICANT_CONFIG_SET =
+# Add support for simple background scan
+WPA_SUPPLICANT_CONFIG_SET = CONFIG_BGSCAN_SIMPLE
 
 WPA_SUPPLICANT_CONFIG_ENABLE = \
 	CONFIG_IEEE80211AC	\
-- 
2.7.4
