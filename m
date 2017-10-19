From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Oct 2017 16:58:32 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] wpa_supplicant: add
	upstream security fixes
Message-ID: <20171019145209.4BEBF803D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65f93a4f3f96bc28887c913fe801e51725a9e267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-13078, CVE-2017-13079, CVE-2017-13080, CVE-2017-13081,
CVE-2017-13087, CVE-2017-13088:

http://lists.infradead.org/pipermail/hostap/2017-October/037989.html

[Peter: also add patch 0001 as suggested by J??rg Krause]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 57c0a485cc0a5681e772ddaf1c886e810d3d7ae4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.hash | 7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk   | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index 22b2e8d..65a6ae2 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -1,2 +1,9 @@
 # Locally calculated
 sha256  b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450  wpa_supplicant-2.6.tar.gz
+sha256  529113cc81256c6178f3c1cf25dd8d3f33e6d770e4a180bd31c6ab7e4917f40b  rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch
+sha256  d86d47ab74170f3648b45b91bce780949ca92b09ab43df065178850ec0c335d7  rebased-v2.6-0002-Prevent-reinstallation-of-an-already-in-use-group-ke.patch
+sha256  d4535e36739a0cc7f3585e6bcba3c0bb8fc67cb3e729844e448c5dc751f47e81  rebased-v2.6-0003-Extend-protection-of-GTK-IGTK-reinstallation-of-WNM-.patch
+sha256  793a54748161b5af430dd9de4a1988d19cb8e85ab29bc2340f886b0297cee20b  rebased-v2.6-0004-Prevent-installation-of-an-all-zero-TK.patch
+sha256  596d4d3b63ea859ed7ea9791b3a21cb11b6173b04c0a14a2afa47edf1666afa6  rebased-v2.6-0006-TDLS-Reject-TPK-TK-reconfiguration.patch
+sha256  c5a17af84aec2d88c56ce0da2d6945be398fe7cab5c0c340deb30973900c2736  rebased-v2.6-0007-WNM-Ignore-WNM-Sleep-Mode-Response-without-pending-r.patch
+sha256  c8840d857b9432f3b488113c85c1ff5d4a4b8d81078b7033388dae1e990843b1  rebased-v2.6-0008-FT-Do-not-allow-multiple-Reassociation-Response-fram.patch
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9c8414b..9eb1a32 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,6 +6,14 @@
 
 WPA_SUPPLICANT_VERSION = 2.6
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
+WPA_SUPPLICANT_PATCH = \
+	http://w1.fi/security/2017-1/rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch \
+	http://w1.fi/security/2017-1/rebased-v2.6-0002-Prevent-reinstallation-of-an-already-in-use-group-ke.patch \
+	http://w1.fi/security/2017-1/rebased-v2.6-0003-Extend-protection-of-GTK-IGTK-reinstallation-of-WNM-.patch \
+	http://w1.fi/security/2017-1/rebased-v2.6-0004-Prevent-installation-of-an-all-zero-TK.patch \
+	http://w1.fi/security/2017-1/rebased-v2.6-0006-TDLS-Reject-TPK-TK-reconfiguration.patch \
+	http://w1.fi/security/2017-1/rebased-v2.6-0007-WNM-Ignore-WNM-Sleep-Mode-Response-without-pending-r.patch \
+	http://w1.fi/security/2017-1/rebased-v2.6-0008-FT-Do-not-allow-multiple-Reassociation-Response-fram.patch
 WPA_SUPPLICANT_LICENSE = BSD-3c
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
