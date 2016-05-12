From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 12 May 2016 15:17:20 +0800
Subject: [Buildroot] package/audit: Remove redundant mkdir
In-Reply-To: <1463037440-8933-1-git-send-email-nroach44@gmail.com>
References: <1463037440-8933-1-git-send-email-nroach44@gmail.com>
Message-ID: <1463037440-8933-2-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

install -D creates the folder, so we don't need the mkdir command

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/audit/audit.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 329f8c5..1fbc623 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -46,7 +46,6 @@ define AUDIT_INSTALL_INIT_SYSTEMD
 	ln -fs ../../../../usr/lib/systemd/system/auditd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/auditd.service
 
-	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
 	$(INSTALL) -D -m 644 package/audit/audit_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
 endef
-- 
2.8.1
