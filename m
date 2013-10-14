From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 21:59:53 +0200
Subject: [Buildroot] [git commit] ncftp: specify ln -sf to remove existing
	destination files
Message-ID: <20131014203036.8C1CE9A384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eed2e02fb99f31196df75ec3dadaf80fa68fffe3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes below build error when executing "make ncftp-dirclean; make".

ln -s /usr/bin/ncftpbatch /opt/test/br-x86/buildroot/output/target/usr/bin/ncftpspooler
ln: failed to create symbolic link '/opt/test/br-x86/buildroot/output/target/usr/bin/ncftpspooler': File exists
make: *** [/opt/test/br-x86/buildroot/output/build/ncftp-3.2.5/.stamp_target_installed] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncftp/ncftp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
