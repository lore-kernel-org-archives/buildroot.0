From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Tue,  6 Feb 2007 18:51:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20070207025145.E36D0485FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-02-06 18:51:45 -0800 (Tue, 06 Feb 2007)
New Revision: 17804

Log:
Fix building of strace for MIPS.


Added:
   trunk/buildroot/package/strace/strace-mips-sprintsigmask-fix.patch


Changeset:
Added: trunk/buildroot/package/strace/strace-mips-sprintsigmask-fix.patch
===================================================================
--- trunk/buildroot/package/strace/strace-mips-sprintsigmask-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/strace/strace-mips-sprintsigmask-fix.patch	2007-02-07 02:51:45 UTC (rev 17804)
@@ -0,0 +1,12 @@
+diff -ur strace-4.5.15/signal.c strace-4.5.15-patched/signal.c
+--- strace-4.5.15/signal.c	2007-01-11 16:08:38.000000000 -0600
++++ strace-4.5.15-patched/signal.c	2007-02-06 20:49:34.714320249 -0600
+@@ -1440,7 +1440,7 @@
+ 	  	tcp->u_rval = tcp->u_error = 0;
+ 		if(tcp->u_arg[0] == 0)
+ 		  	return 0;
+-		tcp->auxstr = sprintsigmask("mask now ", tcp->u_arg[1]);
++		tcp->auxstr = sprintsigmask("mask now ", tcp->u_arg[1], 0);
+ 		return RVAL_NONE | RVAL_STR;
+ 	}
+ 	return 0;
