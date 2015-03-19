From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:36 -0400
Subject: [Buildroot] [PATCH 04/15] openntpd: move systemd service files to
	/usr/lib
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426787807-29510-5-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/openntpd/openntpd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 60f025c..dcd7c7f 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -11,9 +11,9 @@ OPENNTPD_LICENSE_FILES = COPYING
 
 define OPENNTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/openntpd/ntpd.service \
-		$(TARGET_DIR)/etc/systemd/system/ntpd.service
+		$(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../ntpd.service \
+	ln -fs /usr/lib/systemd/system/ntpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
 endef
 
-- 
2.1.0
