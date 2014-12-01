From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:01:19 +0100
Subject: [Buildroot] [git commit] tftpd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221141.063348002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac1c9a2af8bea0a5b5604fdff26a70f363a64fc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also make sure we use a full path for the destination of the
$(INSTALL) command.

[Peter: use install -m as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tftpd/tftpd.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 816a25e..778d45f 100644
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
+	$(INSTALL) -D -m 0755 package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
 endef
 
 $(eval $(autotools-package))
