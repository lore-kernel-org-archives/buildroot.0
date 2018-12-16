From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:24:09 +0100
Subject: [Buildroot] [git commit] package/wpa_supplicant: bump version to 2.7
Message-ID: <20181216112350.0D5B08D5B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03d4010eeeeff2838451877e1ca31aa31813b6d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed upstream patches included in the new version.
Added upstream patch to fix build error.

Updated license hash after commit
http://w1.fi/cgit/hostap/commit/README?id=c2c6c01bb8b6fafc2074b46a53c4eab2c145ac6f
updated the copyright year.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pa_supplicant-2.7-fix-undefined-remove-ie.patch | 43 ++++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.hash         | 12 +-----
 package/wpa_supplicant/wpa_supplicant.mk           | 11 +-----
 3 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/package/wpa_supplicant/0001-wpa_supplicant-2.7-fix-undefined-remove-ie.patch b/package/wpa_supplicant/0001-wpa_supplicant-2.7-fix-undefined-remove-ie.patch
new file mode 100644
index 0000000000..eb00d9c150
--- /dev/null
+++ b/package/wpa_supplicant/0001-wpa_supplicant-2.7-fix-undefined-remove-ie.patch
@@ -0,0 +1,43 @@
+From f2973fa39d6109f0f34969e91551a98dc340d537 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Mon, 3 Dec 2018 12:00:26 +0200
+Subject: FT: Fix CONFIG_IEEE80211X=y build without CONFIG_FILS=y
+
+remove_ie() was defined within an ifdef CONFIG_FILS block while it is
+now needed even without CONFIG_FILS=y. Remove the CONFIG_FILS condition
+there.
+
+Fixes 8c41734e5de1 ("FT: Fix Reassociation Request IEs during FT protocol")
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Downloaded from upstream commit
+http://w1.fi/cgit/hostap/commit/?id=f2973fa39d6109f0f34969e91551a98dc340d537
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ wpa_supplicant/sme.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/wpa_supplicant/sme.c b/wpa_supplicant/sme.c
+index 39c8069..f77f751 100644
+--- a/wpa_supplicant/sme.c
++++ b/wpa_supplicant/sme.c
+@@ -1386,7 +1386,6 @@ void sme_event_auth(struct wpa_supplicant *wpa_s, union wpa_event_data *data)
+ }
+ 
+ 
+-#ifdef CONFIG_FILS
+ #ifdef CONFIG_IEEE80211R
+ static void remove_ie(u8 *buf, size_t *len, u8 eid)
+ {
+@@ -1401,7 +1400,6 @@ static void remove_ie(u8 *buf, size_t *len, u8 eid)
+ 	}
+ }
+ #endif /* CONFIG_IEEE80211R */
+-#endif /* CONFIG_FILS */
+ 
+ 
+ void sme_associate(struct wpa_supplicant *wpa_s, enum wpas_mode mode,
+-- 
+cgit v0.12
+
diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index dbc4438215..5b5d5fcab2 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -1,11 +1,3 @@
 # Locally calculated
-sha256  b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450  wpa_supplicant-2.6.tar.gz
-sha256  529113cc81256c6178f3c1cf25dd8d3f33e6d770e4a180bd31c6ab7e4917f40b  rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch
-sha256  d86d47ab74170f3648b45b91bce780949ca92b09ab43df065178850ec0c335d7  rebased-v2.6-0002-Prevent-reinstallation-of-an-already-in-use-group-ke.patch
-sha256  d4535e36739a0cc7f3585e6bcba3c0bb8fc67cb3e729844e448c5dc751f47e81  rebased-v2.6-0003-Extend-protection-of-GTK-IGTK-reinstallation-of-WNM-.patch
-sha256  793a54748161b5af430dd9de4a1988d19cb8e85ab29bc2340f886b0297cee20b  rebased-v2.6-0004-Prevent-installation-of-an-all-zero-TK.patch
-sha256  596d4d3b63ea859ed7ea9791b3a21cb11b6173b04c0a14a2afa47edf1666afa6  rebased-v2.6-0006-TDLS-Reject-TPK-TK-reconfiguration.patch
-sha256  c5a17af84aec2d88c56ce0da2d6945be398fe7cab5c0c340deb30973900c2736  rebased-v2.6-0007-WNM-Ignore-WNM-Sleep-Mode-Response-without-pending-r.patch
-sha256  c8840d857b9432f3b488113c85c1ff5d4a4b8d81078b7033388dae1e990843b1  rebased-v2.6-0008-FT-Do-not-allow-multiple-Reassociation-Response-fram.patch
-sha256  960c3cf2a514479b0b4cf09665186a1a9f5d28e8b05dec23db75c6cc13eb1f7c  rebased-v2.6-0001-WPA-Ignore-unauthenticated-encrypted-EAPOL-Key-data.patch
-sha256  3f6ca36d86668d6607389e01cf4766f38aa3b8ab2c144ad132541087b41c061d  README
+sha256  76ea6b06b7a2ea8e6d9eb1a9166166f1656e6d48c7508914f592100c95c73074  wpa_supplicant-2.7.tar.gz
+sha256  76eeecd8fc291a71f29189ea20e6a34387b8048a959cbc6a65c41b98194643a2  README
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 2b451996ed..f56637f42e 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,17 +4,8 @@
 #
 ################################################################################
 
-WPA_SUPPLICANT_VERSION = 2.6
+WPA_SUPPLICANT_VERSION = 2.7
 WPA_SUPPLICANT_SITE = http://w1.fi/releases
-WPA_SUPPLICANT_PATCH = \
-	http://w1.fi/security/2017-1/rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch \
-	http://w1.fi/security/2017-1/rebased-v2.6-0002-Prevent-reinstallation-of-an-already-in-use-group-ke.patch \
-	http://w1.fi/security/2017-1/rebased-v2.6-0003-Extend-protection-of-GTK-IGTK-reinstallation-of-WNM-.patch \
-	http://w1.fi/security/2017-1/rebased-v2.6-0004-Prevent-installation-of-an-all-zero-TK.patch \
-	http://w1.fi/security/2017-1/rebased-v2.6-0006-TDLS-Reject-TPK-TK-reconfiguration.patch \
-	http://w1.fi/security/2017-1/rebased-v2.6-0007-WNM-Ignore-WNM-Sleep-Mode-Response-without-pending-r.patch \
-	http://w1.fi/security/2017-1/rebased-v2.6-0008-FT-Do-not-allow-multiple-Reassociation-Response-fram.patch \
-	http://w1.fi/security/2018-1/rebased-v2.6-0001-WPA-Ignore-unauthenticated-encrypted-EAPOL-Key-data.patch
 WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
