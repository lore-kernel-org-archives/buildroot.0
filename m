From: antab at uclibc.org <antab@uclibc.org>
Date: Sun,  1 Jun 2008 14:35:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database
Message-ID: <20080601213515.08B083C859@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-06-01 14:35:14 -0700 (Sun, 01 Jun 2008)
New Revision: 22171

Log:
Fix my own broken mistakes


Modified:
   trunk/buildroot/package/database/Config.in


Changeset:
Modified: trunk/buildroot/package/database/Config.in
===================================================================
--- trunk/buildroot/package/database/Config.in	2008-06-01 21:17:28 UTC (rev 22170)
+++ trunk/buildroot/package/database/Config.in	2008-06-01 21:35:14 UTC (rev 22171)
@@ -1,5 +1,7 @@
 menuconfig BR2_DATABASE_SUPPORT
 	bool "Database"
-	default n
+	default y
 
+if BR2_DATABASE_SUPPORT
 source "package/database/mysql_client/Config.in"
+endif
