From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 21 Apr 2015 13:50:37 -0400
Subject: [Buildroot] [PATCH 4/5] ofono: enable systemd service by default
In-Reply-To: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
References: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1429638638-28695-5-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/ofono/ofono.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 98e2fbc..f1a63e2 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -26,6 +26,12 @@ define OFONO_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/ofono/S46ofono $(TARGET_DIR)/etc/init.d/S46ofono
 endef
 
+define OFONO_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/systemd/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/ofono.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+endef
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 OFONO_CONF_OPTS += --enable-udev
 OFONO_DEPENDENCIES += udev
-- 
2.1.4
