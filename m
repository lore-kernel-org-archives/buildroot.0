From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 13 Dec 2007 03:34:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20071213113428.E15411200F1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-13 03:34:27 -0800 (Thu, 13 Dec 2007)
New Revision: 20644

Log:
susv3 legacy fix for haserl

Added:
   trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch


Changeset:
Added: trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch	2007-12-13 11:34:27 UTC (rev 20644)
@@ -0,0 +1,12 @@
+diff -urN haserl-0.9.21-0rig/src/haserl.c haserl-0.9.21/src/haserl.c
+--- haserl-0.9.21-0rig/src/haserl.c	2007-12-13 22:58:00.000000000 +0100
++++ haserl-0.9.21/src/haserl.c	2007-12-13 23:00:10.000000000 +0100
+@@ -210,7 +210,7 @@
+     }
+   memcpy ((char *) (entry + strlen (prefix)), str, strlen (str));
+ 
+-  keylen = (size_t) (index (entry, '=') - entry);
++  keylen = (size_t) (strchr (entry, '=') - entry);
+ 
+   if (keylen <= 0)
+     {
