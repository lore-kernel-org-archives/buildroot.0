From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 14:22:50 -0600
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: enable systemd
 services
Message-ID: <20191031202250.72364-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/modem-manager/modem-manager.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index dde841b80a..9673b98716 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -39,4 +39,12 @@ define MODEM_MANAGER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S44modem-manager
 endef
 
+define MODEM_MANAGER_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/ModemManager.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ModemManager.service
+	ln -sf ../../../lib/systemd/system/ModemManager.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.ModemManager1.service
+endef
+
 $(eval $(autotools-package))
-- 
2.20.1
