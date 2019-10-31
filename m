From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 13:28:37 -0600
Subject: [Buildroot] [PATCH 1/1] package/connman: enable
 connman-wait-online.service
Message-ID: <20191031192837.22461-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/connman/connman.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 839bc7a0e2..f8466bc1cb 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -36,6 +36,9 @@ define CONNMAN_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/connman.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/network-online.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/connman-wait-online.service \
+		$(TARGET_DIR)/etc/systemd/system/network-online.target.wants/connman-wait-online.service
 endef
 
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
-- 
2.20.1
