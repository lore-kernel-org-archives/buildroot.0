From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  7 Apr 2008 00:59:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20080407075908.DADCC3C3B9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-07 00:59:08 -0700 (Mon, 07 Apr 2008)
New Revision: 21662

Log:
haserl: bump version


Removed:
   trunk/buildroot/package/haserl/haserl-0.9.22-susv3-legacy.patch

Modified:
   trunk/buildroot/package/haserl/Config.in


Changeset:
Modified: trunk/buildroot/package/haserl/Config.in
===================================================================
--- trunk/buildroot/package/haserl/Config.in	2008-04-07 07:59:03 UTC (rev 21661)
+++ trunk/buildroot/package/haserl/Config.in	2008-04-07 07:59:08 UTC (rev 21662)
@@ -31,4 +31,4 @@
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.22"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.23"	if BR2_PACKAGE_HASERL_VERSION_0_9_X

Deleted: trunk/buildroot/package/haserl/haserl-0.9.22-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.9.22-susv3-legacy.patch	2008-04-07 07:59:03 UTC (rev 21661)
+++ trunk/buildroot/package/haserl/haserl-0.9.22-susv3-legacy.patch	2008-04-07 07:59:08 UTC (rev 21662)
@@ -1,12 +0,0 @@
-diff -urN haserl-0.9.21-0rig/src/haserl.c haserl-0.9.21/src/haserl.c
---- haserl-0.9.21-0rig/src/haserl.c	2007-12-13 22:58:00.000000000 +0100
-+++ haserl-0.9.21/src/haserl.c	2007-12-13 23:00:10.000000000 +0100
-@@ -210,7 +210,7 @@
-     }
-   memcpy ((char *) (entry + strlen (prefix)), str, strlen (str));
- 
--  keylen = (size_t) (index (entry, '=') - entry);
-+  keylen = (size_t) (strchr (entry, '=') - entry);
- 
-   if (keylen <= 0)
-     {
