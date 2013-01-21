From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 21 Jan 2013 19:21:29 +0100
Subject: [Buildroot] [PATCH] vsftpd: add empty directory /usr/share/empty
Message-ID: <1358792489-13488-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vsftpd needs an empty directory where it can chroot.
If /usr/share/empty isn't present it refuses to work in the default
configuration.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/vsftpd/vsftpd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index c4dd72c..7c55899 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -40,6 +40,7 @@ define VSFTPD_INSTALL_TARGET_CMDS
 	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
 		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
 			$(TARGET_DIR)/etc/vsftpd.conf
+	install -d -m 700 $(TARGET_DIR)/usr/share/empty
 endef
 
 define VSFTPD_UNINSTALL_TARGET_CMDS
-- 
1.7.0.4
