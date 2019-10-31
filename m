From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 14:11:21 -0600
Subject: [Buildroot] [PATCH 1/1] package/network-manager: enable
 NetworkManager-wait-online.service
Message-ID: <20191031201121.41606-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 6412d3a241..6f82cd4ea4 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -90,6 +90,8 @@ endef
 define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/network-online.target.wants
+
 	ln -sf /usr/lib/systemd/system/NetworkManager.service \
 		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
 
@@ -98,6 +100,9 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
 
 	ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service \
 		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
+
+	ln -sf /usr/lib/systemd/system/NetworkManager-wait-online.service \
+		$(TARGET_DIR)/etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service
 endef
 
 $(eval $(autotools-package))
-- 
2.20.1
