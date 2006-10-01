From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  1 Oct 2006 08:07:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20061001150746.5735648596@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-01 08:07:45 -0700 (Sun, 01 Oct 2006)
New Revision: 16281

Log:
- add BR2_ZCAT in preparation of fixing bug #971


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2006-10-01 10:58:54 UTC (rev 16280)
+++ trunk/buildroot/Config.in	2006-10-01 15:07:45 UTC (rev 16281)
@@ -180,6 +180,16 @@
 	string "Subversion (svn) checkout command"
 	default "svn co"
 
+config BR2_ZCAT
+	string "zcat command"
+	default "zcat"
+	help
+	  Command to be used to extract a gzip'ed file to stdout.
+	  zcat is identical to gunzip -c except that the former may
+	  not be available on your system.
+	  Default is "zcat"
+	  Other possible values include "gunzip -c"
+
 config BR2_TAR_OPTIONS
 	string "Tar options"
 	default ""
