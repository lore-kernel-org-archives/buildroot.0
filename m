From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  1 Apr 2009 20:52:48 +0000 (UTC)
Subject: [Buildroot] svn commit: [25925] trunk/buildroot/package/ncftp
Message-ID: <20090401205248.42ED877673@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-01 20:52:47 +0000 (Wed, 01 Apr 2009)
New Revision: 25925

Log:
ncftp: cleanup Config.in

Subentries of a menu automatically gets hidden if the dependencies of the
menu element aren't available, so get rid of the individual depends on
BR2_PACKAGE_NCFTP.

Modified:
   trunk/buildroot/package/ncftp/Config.in


Changeset:
Modified: trunk/buildroot/package/ncftp/Config.in
===================================================================
--- trunk/buildroot/package/ncftp/Config.in	2009-04-01 20:52:41 UTC (rev 25924)
+++ trunk/buildroot/package/ncftp/Config.in	2009-04-01 20:52:47 UTC (rev 25925)
@@ -12,26 +12,21 @@
 config BR2_PACKAGE_NCFTP_GET
 	bool "NcFTPGet - command-line utility program"
 	default y
-	depends on BR2_PACKAGE_NCFTP
 
 config BR2_PACKAGE_NCFTP_PUT
 	bool "NcFTPPut - command-line utility program"
 	default y
-	depends on BR2_PACKAGE_NCFTP
 
 config BR2_PACKAGE_NCFTP_LS
 	bool "NcFTPLs - command-line utility program"
 	default y
-	depends on BR2_PACKAGE_NCFTP
 
 config BR2_PACKAGE_NCFTP_BATCH
 	bool "NcFTPBatch & NcFTPSpooler - background FTP program for individual users"
 	default y
-	depends on BR2_PACKAGE_NCFTP
 
 config BR2_PACKAGE_NCFTP_BOOKMARKS
 	bool "NcFTPBookmarks - ncurses based Bookmark Editor"
-	depends on BR2_PACKAGE_NCFTP
 	select BR2_PACKAGE_NCURSES
 
 endmenu
