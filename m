From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:15 -0400
Subject: [Buildroot] [PATCH v2 24/25] wpa_supplicant: install systemd
	service files
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-25-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unlike other systemd services, these are not enabled by default, as the
most likely configuration is that they will be managed by something like
NetworkManager.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 5a81a91..4b2ec16 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -165,4 +165,15 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
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
