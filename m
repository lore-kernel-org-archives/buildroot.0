From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:00:17 +0200
Subject: [Buildroot] [git commit] ncftp: remove the menu ... endmenu
Message-ID: <20160704210057.EE0CE7FDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1ef77048d201b9e81051ca08955704823be7858
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also makes the prompts of the various sub-options more in line with what
we do in the rest of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncftp/Config.in | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 57586e7..135ab53 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -10,28 +10,24 @@ config BR2_PACKAGE_NCFTP
 
 if BR2_PACKAGE_NCFTP
 
-menu "ncFTP tools selection"
-
 config BR2_PACKAGE_NCFTP_GET
-	bool "NcFTPGet - command-line utility program"
+	bool "ncftpget"
 	default y
 
 config BR2_PACKAGE_NCFTP_PUT
-	bool "NcFTPPut - command-line utility program"
+	bool "ncftpput"
 	default y
 
 config BR2_PACKAGE_NCFTP_LS
-	bool "NcFTPLs - command-line utility program"
+	bool "ncftpls"
 	default y
 
 config BR2_PACKAGE_NCFTP_BATCH
-	bool "NcFTPBatch & NcFTPSpooler - background FTP program for individual users"
+	bool "ncftpbatch/ncftpspooler"
 	default y
 
 config BR2_PACKAGE_NCFTP_BOOKMARKS
-	bool "NcFTPBookmarks - ncurses based Bookmark Editor"
+	bool "ncftpbookmarks"
 	select BR2_PACKAGE_NCURSES
 
-endmenu
-
 endif
