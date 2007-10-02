From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  2 Oct 2007 04:25:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltrace
Message-ID: <20071002112537.D8286A6046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-02 04:25:37 -0700 (Tue, 02 Oct 2007)
New Revision: 20173

Log:
- remove usage of SUSv3 LEGACY functions


Added:
   trunk/buildroot/package/ltrace/ltrace-0.5-00-susv3-legacy.patch


Changeset:
Added: trunk/buildroot/package/ltrace/ltrace-0.5-00-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/ltrace/ltrace-0.5-00-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/ltrace/ltrace-0.5-00-susv3-legacy.patch	2007-10-02 11:25:37 UTC (rev 20173)
@@ -0,0 +1,11 @@
+--- ltrace-0.5.orig/read_config_file.c	2006-02-20 22:48:07.000000000 +0100
++++ ltrace-0.5/read_config_file.c	2007-10-02 12:18:21.000000000 +0200
+@@ -57,7 +57,7 @@
+ 
+ 	while (tmp->name) {
+ 		if (!strncmp(*str, tmp->name, strlen(tmp->name))
+-		    && index(" ,)#", *(*str + strlen(tmp->name)))) {
++		    && strchr(" ,)#", *(*str + strlen(tmp->name)))) {
+ 			*str += strlen(tmp->name);
+ 			return tmp->pt;
+ 		}
