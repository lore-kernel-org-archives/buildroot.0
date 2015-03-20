From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:00 -0400
Subject: [Buildroot] [PATCH v2 09/25] rsyslog: fix systemd service
	installation
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-10-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/rsyslog/rsyslog.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index c6758eb..e3c9d1a 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -65,11 +65,11 @@ define RSYSLOG_INSTALL_INIT_SYSV
 endef
 
 define RSYSLOG_INSTALL_INIT_SYSTEMD
-	ln -sf /lib/systemd/system/rsyslog.service \
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
2.1.0
