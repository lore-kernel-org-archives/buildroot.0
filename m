From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 16 Jan 2013 10:24:08 +0100
Subject: [Buildroot] [PATCH] vsftpd: install sample config file to /etc
Message-ID: <1358328248-15016-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vsftpd comes with a sample config file that can serve as a starting
point for customization and enables a basic functionality. Since
this config refers to a directory "/usr/share/empty" this is also
created.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/vsftpd/vsftpd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index ca711bb..f694b87 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -37,6 +37,10 @@ define VSFTPD_INSTALL_TARGET_CMDS
 	test -f $(TARGET_DIR)/etc/init.d/S70vsftpd || \
 		$(INSTALL) -D -m 755 package/vsftpd/vsftpd-init \
 			$(TARGET_DIR)/etc/init.d/S70vsftpd
+	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
+		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
+			$(TARGET_DIR)/etc/vsftpd.conf
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/empty
 endef
 
 define VSFTPD_UNINSTALL_TARGET_CMDS
-- 
1.7.0.4
