From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Mar 2007 00:26:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070309082610.8790548589@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-09 00:26:10 -0800 (Fri, 09 Mar 2007)
New Revision: 18045

Log:
- Default to gzip -d -c since zcat may only support compress'ed files
  according to SuS. Thanks to Heikki Lindholm for pointing this out.


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-03-09 08:25:24 UTC (rev 18044)
+++ trunk/buildroot/Config.in	2007-03-09 08:26:10 UTC (rev 18045)
@@ -212,13 +212,13 @@
 
 config BR2_ZCAT
 	string "zcat command"
-	default "zcat"
+	default "gzip -d -c"
 	help
 	  Command to be used to extract a gzip'ed file to stdout.
 	  zcat is identical to gunzip -c except that the former may
 	  not be available on your system.
-	  Default is "zcat"
-	  Other possible values include "gunzip -c" or "gzip -d -c".
+	  Default is "gzip -d -c"
+	  Other possible values include "gunzip -c" or "zcat".
 
 config BR2_BZCAT
 	string "bzcat command"
