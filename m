From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Aug 2018 20:14:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: add upstream
 security fix
Message-ID: <20180808181447.13485-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-14526:
http://w1.fi/security/2018-1/unauthenticated-eapol-key-decryption.txt

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wpa_supplicant/wpa_supplicant.hash | 2 ++
 package/wpa_supplicant/wpa_supplicant.mk   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index 65a6ae246f..dbc4438215 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -7,3 +7,5 @@ sha256  793a54748161b5af430dd9de4a1988d19cb8e85ab29bc2340f886b0297cee20b  rebase
 sha256  596d4d3b63ea859ed7ea9791b3a21cb11b6173b04c0a14a2afa47edf1666afa6  rebased-v2.6-0006-TDLS-Reject-TPK-TK-reconfiguration.patch
 sha256  c5a17af84aec2d88c56ce0da2d6945be398fe7cab5c0c340deb30973900c2736  rebased-v2.6-0007-WNM-Ignore-WNM-Sleep-Mode-Response-without-pending-r.patch
 sha256  c8840d857b9432f3b488113c85c1ff5d4a4b8d81078b7033388dae1e990843b1  rebased-v2.6-0008-FT-Do-not-allow-multiple-Reassociation-Response-fram.patch
+sha256  960c3cf2a514479b0b4cf09665186a1a9f5d28e8b05dec23db75c6cc13eb1f7c  rebased-v2.6-0001-WPA-Ignore-unauthenticated-encrypted-EAPOL-Key-data.patch
+sha256  3f6ca36d86668d6607389e01cf4766f38aa3b8ab2c144ad132541087b41c061d  README
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 75ecbaa53c..2b451996ed 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -13,7 +13,8 @@ WPA_SUPPLICANT_PATCH = \
 	http://w1.fi/security/2017-1/rebased-v2.6-0004-Prevent-installation-of-an-all-zero-TK.patch \
 	http://w1.fi/security/2017-1/rebased-v2.6-0006-TDLS-Reject-TPK-TK-reconfiguration.patch \
 	http://w1.fi/security/2017-1/rebased-v2.6-0007-WNM-Ignore-WNM-Sleep-Mode-Response-without-pending-r.patch \
-	http://w1.fi/security/2017-1/rebased-v2.6-0008-FT-Do-not-allow-multiple-Reassociation-Response-fram.patch
+	http://w1.fi/security/2017-1/rebased-v2.6-0008-FT-Do-not-allow-multiple-Reassociation-Response-fram.patch \
+	http://w1.fi/security/2018-1/rebased-v2.6-0001-WPA-Ignore-unauthenticated-encrypted-EAPOL-Key-data.patch
 WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
-- 
2.18.0
