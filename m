From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Oct 2011 23:30:42 +0200
Subject: [Buildroot] [git commit] ncftp: bump to version 3.2.5
Message-ID: <20111018052253.9E1378D1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea729ab3e5936011e91d3ba636bf6e0a0bf51528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncftp/Config.in |    4 ----
 package/ncftp/ncftp.mk  |   24 ++++++++++++------------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index a29934a..7b6ae64 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NCFTP
 	bool "ncftp"
-	depends on BR2_LARGEFILE
 	help
 	  NcFTP Client (also known as just NcFTP) is a set of FREE application
 	  programs implementing the File Transfer Protocol (FTP).
@@ -31,6 +30,3 @@ config BR2_PACKAGE_NCFTP_BOOKMARKS
 	select BR2_PACKAGE_NCURSES
 
 endmenu
-
-comment "ncftp requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 7fdee9a..3000e7a 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -3,33 +3,33 @@
 # ncftp client
 #
 #############################################################
-NCFTP_VERSION:=3.2.4
-NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
-NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
 
-NCFTP_TARGET_BINS:=ncftp
+NCFTP_VERSION = 3.2.5
+NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.bz2
+NCFTP_SITE = ftp://ftp.ncftp.com/ncftp
+NCFTP_TARGET_BINS = ncftp
 
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
-NCFTP_TARGET_BINS+=ncftpget
+	NCFTP_TARGET_BINS += ncftpget
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_PUT),y)
-NCFTP_TARGET_BINS+=ncftpput
+	NCFTP_TARGET_BINS += ncftpput
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_LS),y)
-NCFTP_TARGET_BINS+=ncftpls
+	NCFTP_TARGET_BINS += ncftpls
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_BATCH),y)
-NCFTP_TARGET_BINS+=ncftpbatch
-NCFTP_INSTALL_NCFTP_BATCH = \
-	ln -s /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
+	NCFTP_TARGET_BINS += ncftpbatch
+	NCFTP_INSTALL_NCFTP_BATCH = \
+		ln -s /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_BOOKMARKS),y)
-NCFTP_TARGET_BINS+=ncftpbookmarks
-NCFTP_DEPENDENCIES:=ncurses
+	NCFTP_TARGET_BINS += ncftpbookmarks
+	NCFTP_DEPENDENCIES += ncurses
 endif
 
 define NCFTP_INSTALL_TARGET_CMDS
