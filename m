From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 21 Apr 2015 13:50:38 -0400
Subject: [Buildroot] [PATCH 5/5] connman: enable systemd service by default
In-Reply-To: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
References: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1429638638-28695-6-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/connman/connman.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4b55392..016eff7 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -31,6 +31,11 @@ define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
 
+define CONNMAN_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/connman.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
+endef
 
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
 CONNMAN_CONF_OPTS += --enable-client
-- 
2.1.4
