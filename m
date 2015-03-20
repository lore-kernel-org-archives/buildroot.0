From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:43:11 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: install systemd service
	files
Message-ID: <20150320194323.A3DED8181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c74c8431341006d063f40b7436cc529d4378ae2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unlike other systemd services, these are not enabled by default, as the
most likely configuration is that they will be managed by something like
NetworkManager.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

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
