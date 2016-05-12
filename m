From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 May 2016 13:26:48 +0200
Subject: [Buildroot] [git commit branch/next] package/audit: Remove
	redundant mkdir
Message-ID: <20160512112756.0820F81F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04f166d4b5b227b426272a2aabf1aad2b763df1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

install -D creates the folder, so we don't need the mkdir command

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
