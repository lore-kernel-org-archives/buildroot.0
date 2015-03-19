From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:41 -0400
Subject: [Buildroot] [PATCH 09/15] rsyslog: move systemd service file to
	/usr/lib
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426787807-29510-10-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/rsyslog/rsyslog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index c6758eb..7bc6a67 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -65,7 +65,7 @@ define RSYSLOG_INSTALL_INIT_SYSV
 endef
 
 define RSYSLOG_INSTALL_INIT_SYSTEMD
-	ln -sf /lib/systemd/system/rsyslog.service \
+	ln -sf /usr/lib/systemd/system/rsyslog.service \
 		$(TARGET_DIR)/etc/systemd/system/syslog.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../syslog.service \
-- 
2.1.0
