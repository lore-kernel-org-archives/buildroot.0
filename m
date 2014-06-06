From: Sven Neumann <neumann@teufel.de>
Date: Fri,  6 Jun 2014 10:16:23 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: fix
	BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG option
Message-ID: <1402042583-13595-1-git-send-email-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 920f96a..c704809 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -117,9 +117,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
-define WPA_SUPPLICANT_DEBUG_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_DEBUG_SYSLOG.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_SYSLOG
 endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
-- 
1.9.1
