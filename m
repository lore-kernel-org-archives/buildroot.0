From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 20 Jan 2007 21:17:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20070121051708.3D5C648583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-20 21:17:06 -0800 (Sat, 20 Jan 2007)
New Revision: 17428

Log:
Patch to remove usage of legacy 'index' function.


Added:
   trunk/buildroot/package/samba/samba-remove-legacy-index.patch


Changeset:
Added: trunk/buildroot/package/samba/samba-remove-legacy-index.patch
===================================================================
--- trunk/buildroot/package/samba/samba-remove-legacy-index.patch	                        (rev 0)
+++ trunk/buildroot/package/samba/samba-remove-legacy-index.patch	2007-01-21 05:17:06 UTC (rev 17428)
@@ -0,0 +1,22 @@
+diff -ur samba-3.0.23d/source/registry/reg_perfcount.c samba-3.0.23d-patched/source/registry/reg_perfcount.c
+--- samba-3.0.23d/source/registry/reg_perfcount.c	2006-07-10 11:27:54.000000000 -0500
++++ samba-3.0.23d-patched/source/registry/reg_perfcount.c	2007-01-20 23:12:23.456180669 -0600
+@@ -614,15 +614,15 @@
+ 	obj = NULL;
+ 	memset(buf, 0, PERFCOUNT_MAX_LEN);
+ 	memcpy(buf, data.dptr, data.dsize);
+-	begin = index(buf, '[');
+-	end = index(buf, ']');
++	begin = strchr(buf, '[');
++	end = strchr(buf, ']');
+ 	if(begin == NULL || end == NULL)
+ 		return False;
+ 	start = begin+1;
+ 
+ 	while(start < end)
+ 	{
+-		stop = index(start, ',');
++		stop = strchr(start, ',');
+ 		if(stop == NULL)
+ 			stop = end;
+ 		*stop = '\0';
