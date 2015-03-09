From: Mike Williams <mike@mikebwilliams.com>
Date: Mon,  9 Mar 2015 12:03:31 -0400
Subject: [Buildroot] [PATCH v2] wpa_supplicant: install systemd service files
Message-ID: <1425917011-16598-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 682cb4c..242bea5 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -164,4 +164,15 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
 endef
 
+define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
+	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant at .service
+	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-nl80211 at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
+	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
+endef
+
 $(eval $(generic-package))
-- 
2.1.0
