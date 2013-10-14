From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 14 Oct 2013 21:21:30 +0800
Subject: [Buildroot] [PATCH 1/3] ncftp: specify ln -sf to remove existing
 destination files
Message-ID: <1381756890.15266.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes below build error when executing "make ncftp-dirclean; make".

ln -s /usr/bin/ncftpbatch /opt/test/br-x86/buildroot/output/target/usr/bin/ncftpspooler
ln: failed to create symbolic link '/opt/test/br-x86/buildroot/output/target/usr/bin/ncftpspooler': File exists
make: *** [/opt/test/br-x86/buildroot/output/build/ncftp-3.2.5/.stamp_target_installed] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/ncftp/ncftp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 56d5d47..03874d1 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -26,7 +26,7 @@ endif
 ifeq ($(BR2_PACKAGE_NCFTP_BATCH),y)
 	NCFTP_TARGET_BINS += ncftpbatch
 	NCFTP_INSTALL_NCFTP_BATCH = \
-		ln -s /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
+		ln -sf /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_BOOKMARKS),y)
-- 
1.8.1.2
