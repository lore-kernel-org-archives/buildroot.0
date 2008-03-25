From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 25 Mar 2008 01:49:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20080325084939.859043C3C5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-25 01:49:38 -0700 (Tue, 25 Mar 2008)
New Revision: 21490

Log:
php: hide extensions menu if not enabled


Modified:
   trunk/buildroot/package/php/Config.in


Changeset:
Modified: trunk/buildroot/package/php/Config.in
===================================================================
--- trunk/buildroot/package/php/Config.in	2008-03-25 07:49:43 UTC (rev 21489)
+++ trunk/buildroot/package/php/Config.in	2008-03-25 08:49:38 UTC (rev 21490)
@@ -31,4 +31,6 @@
         help
           fast cgi interface for php
 
+if BR2_PACKAGE_PHP
 source "package/php/Config.ext"
+endif
