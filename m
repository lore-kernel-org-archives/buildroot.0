From: Thierry Bultel <tbultel@free.fr>
Date: Fri, 12 Dec 2014 23:39:56 +0100
Subject: [Buildroot] [PATCH] rsyslog: install systemd services links
Message-ID: <1418423996-12665-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/rsyslog/rsyslog.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 6b72bb5..688a335 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -43,6 +43,14 @@ define RSYSLOG_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S01rsyslog
 endef
 
+define RSYSLOG_INSTALL_INIT_SYSTEMD
+	ln -sf /lib/systemd/system/rsyslog.service \
+		$(TARGET_DIR)/etc/systemd/system/syslog.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../syslog.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslog.service
+endef
+
 define RSYSLOG_INSTALL_CONF
 	$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
 		$(TARGET_DIR)/etc/rsyslog.conf
-- 
1.9.1
