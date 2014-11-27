From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:20 +0100
Subject: [Buildroot] [PATCHv2 02/74] vsftpd: don't install manpages
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Installing manpages to the target is quite useless, since we don't
support installing documentation on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vsftpd/vsftpd.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 1c468ed..b94328d 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -49,10 +49,6 @@ endef
 
 define VSFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
-	$(INSTALL) -D -m 644 $(@D)/vsftpd.8 \
-		$(TARGET_DIR)/usr/share/man/man8/vsftpd.8
-	$(INSTALL) -D -m 644 $(@D)/vsftpd.conf.5 \
-		$(TARGET_DIR)/usr/share/man/man5/vsftpd.conf.5
 	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
 		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
 			$(TARGET_DIR)/etc/vsftpd.conf
-- 
2.1.0
