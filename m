From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Dec 2006 09:40:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
Message-ID: <20061220174053.189C9485A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-20 09:40:52 -0800 (Wed, 20 Dec 2006)
New Revision: 17020

Log:
- Add args patch.


Added:
   trunk/buildroot/package/kexec/kexec-tools-my_shutdown-args.patch


Changeset:
Added: trunk/buildroot/package/kexec/kexec-tools-my_shutdown-args.patch
===================================================================
--- trunk/buildroot/package/kexec/kexec-tools-my_shutdown-args.patch	2006-12-20 17:08:38 UTC (rev 17019)
+++ trunk/buildroot/package/kexec/kexec-tools-my_shutdown-args.patch	2006-12-20 17:40:52 UTC (rev 17020)
@@ -0,0 +1,12 @@
+diff -rup kexec-tools-1.101.orig/kexec/kexec.c kexec-tools-1.101/kexec/kexec.c
+--- kexec-tools-1.101.orig/kexec/kexec.c	2006-12-20 18:40:26.000000000 +0100
++++ kexec-tools-1.101/kexec/kexec.c	2006-12-20 18:41:02.000000000 +0100
+@@ -629,7 +629,7 @@ int k_unload (unsigned long kexec_flags)
+  */
+ static int my_shutdown(void)
+ {
+-	char *args[8];
++	char *args[2];
+ 
+ 	args[0] = "reboot";
+ 	args[1] = NULL;
