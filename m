From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 21 Apr 2015 13:50:36 -0400
Subject: [Buildroot] [PATCH 3/5] rsyslog: fix systemd service installation
In-Reply-To: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
References: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1429638638-28695-4-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/rsyslog/rsyslog.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 99e6eba..0b7df4b 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -65,11 +65,12 @@ define RSYSLOG_INSTALL_INIT_SYSV
 endef
 
 define RSYSLOG_INSTALL_INIT_SYSTEMD
-	ln -sf /lib/systemd/system/rsyslog.service \
+	mkdir -p $(TARGET_DIR)/etc/systemd/system
+	ln -fs ../../../usr/lib/systemd/system/rsyslog.service \
 		$(TARGET_DIR)/etc/systemd/system/syslog.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../syslog.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslog.service
+	ln -fs ../../../../usr/lib/systemd/system/rsyslog.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rsyslog.service
 endef
 
 define RSYSLOG_INSTALL_CONF
-- 
2.1.4
