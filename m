From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:13:53 -0400
Subject: [Buildroot] [PATCH v2 02/25] ntp: move systemd service file to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-3-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/ntp/ntp.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 7d5644a..36dea79 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -71,9 +71,10 @@ define NTP_INSTALL_INIT_SYSV
 endef
 
 define NTP_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/etc/systemd/system/ntpd.service
+	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
+	ln -fs ../../../../usr/lib/systemd/system/ntpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
 endef
 endif
 
-- 
2.1.0
