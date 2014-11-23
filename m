From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:55 +0100
Subject: [Buildroot] [PATCH 23/51] tftpd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-24-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also make sure we use a full path for the destination of the
$(INSTALL) command.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tftpd/tftpd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 816a25e..2f746d0 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -21,7 +21,10 @@ endif
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
 	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
-	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
+endef
+
+define TFTPD_INSTALL_INIT_SYSV
+	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
 endef
 
 $(eval $(autotools-package))
-- 
2.1.0
