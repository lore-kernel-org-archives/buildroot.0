From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Wed, 12 Mar 2008 12:03:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20080312190322.B761712C7DE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-12 12:03:20 -0700 (Wed, 12 Mar 2008)
New Revision: 21318

Log:
patch to replace legacy bzero with memset in tslib

Added:
   trunk/buildroot/package/tslib/tslib-1.0-remove-bzero.patch


Changeset:
Added: trunk/buildroot/package/tslib/tslib-1.0-remove-bzero.patch
===================================================================
--- trunk/buildroot/package/tslib/tslib-1.0-remove-bzero.patch	                        (rev 0)
+++ trunk/buildroot/package/tslib/tslib-1.0-remove-bzero.patch	2008-03-12 19:03:20 UTC (rev 21318)
@@ -0,0 +1,11 @@
+--- a/src/ts_parse_vars.c	2006-08-24 17:02:55.000000000 -0400
++++ b/src/ts_parse_vars.c	2008-03-12 13:57:01.000000000 -0400
+@@ -33,7 +33,7 @@ int tslib_parse_vars(struct tslib_module
+ 		return 0;
+ 
+ 	//s = alloca(strlen(str));
+-	bzero(s_holder,1024);
++	memset(s_holder, 0, 1024);
+ 	strncpy(s_holder,str,strlen(str));
+ 	s = s_holder;
+ 	while ((p = strsep(&s, " \t")) != NULL && ret == 0) {
