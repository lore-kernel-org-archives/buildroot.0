From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 21:55:46 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: add support for simple
	background scan
Message-ID: <20160628200049.B22BC807F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ae1d47f55e3ff3d1ba6d546838f8ee19705a1ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CONFIG_BGSCAN_SIMPLE is missing from the defconfig included with
wpa_supplicant.  Many programs that depend on wpa_supplicant assume
bgscan is enabled, for example connman will try to set bgscan by default.
It is safe to always enable CONFIG_BGSCAN_SIMPLE since it is only used if
wpa_supplicant is configured to do so.

Signed-off-by: Martin Bark <martin@barkynet.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
