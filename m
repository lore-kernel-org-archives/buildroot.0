From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 23 Aug 2007 22:31:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070824053107.11E6FA469B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-23 22:31:07 -0700 (Thu, 23 Aug 2007)
New Revision: 19670

Log:
Add git command

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-08-24 05:28:18 UTC (rev 19669)
+++ trunk/buildroot/Config.in	2007-08-24 05:31:07 UTC (rev 19670)
@@ -591,9 +591,13 @@
 	default "wget --passive-ftp -nd"
 
 config BR2_SVN
-	string "Subversion (svn) checkout command"
+	string "Subversion (svn) command to download source tree"
 	default "svn co"
 
+config BR2_GIT
+	string "Git command to download source tree"
+	default "git clone"
+
 config BR2_ZCAT
 	string "zcat command"
 	default "gzip -d -c"
@@ -731,11 +735,13 @@
 	bool "strip"
 	help
 	  strip   is the normal strip command
+
 config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
 	help
 	  sstrip  is a strip that discards more than the normal strip
+
 config BR2_STRIP_none
 	bool "none"
 	help
