From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:34:19 +0100
Subject: [Buildroot] [git commit] vsftpd: don't install manpages
Message-ID: <20141201221140.2C06C8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c4f250120290b55e68c38e7b60ac54d1cc6fec5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Installing manpages to the target is quite useless, since we don't
support installing documentation on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vsftpd/vsftpd.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
