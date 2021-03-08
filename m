From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 08 Mar 2021 07:44:52 -0000
Subject: [Buildroot] [git commit] package/wpa_supplicant: need EAP when
 HOTSPOT is enabled.
Message-ID: <20210308072134.A6E998893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7636bdaf1fcc1793abad34b74be67f8b50f7ec3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make WPA_SUPPLICANT_HOTSPOT depend on WPA_SUPPLICANT_EAP, Otherwise,
compilation fails with errors like:

interworking.c:1439:15: error: ???struct wpa_ssid??? has no member named ???eap???

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 3c986ff4ba..27ad22430a 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -94,6 +94,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
 
 config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
 	bool "Enable HS20"
+	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
 	  Enable Hotspot 2.0 and IEEE 802.11u interworking
 	  functionality.
