From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Oct 2011 00:04:33 -0300
Subject: [Buildroot] [PATCH 7/7] ncftp: bump to version 3.2.5
In-Reply-To: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318734273-24454-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
