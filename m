From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 23 Sep 2007 13:46:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070923204647.755F030046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-23 13:46:44 -0700 (Sun, 23 Sep 2007)
New Revision: 19979

Log:
- add the $(BASE_TARGETS) per default


Modified:
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch
   trunk/buildroot/package/config/util.c


Changeset:
Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-09-23 20:28:53 UTC (rev 19978)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-09-23 20:46:44 UTC (rev 19979)
@@ -1369,7 +1369,7 @@
 +				    e = p->expr;
 +				    if (e && e->left.sym->name) {
 +				        if (!done) {
-+					    fprintf(out, "%s:", br2_symbol_printer(sym->name));
++					    fprintf(out, "%s: $(BASE_TARGETS)", br2_symbol_printer(sym->name));
 +					    done = 1;
 +					}
 +//printf("SELECTS %s\n",e->left.sym->name);

Modified: trunk/buildroot/package/config/util.c
===================================================================
--- trunk/buildroot/package/config/util.c	2007-09-23 20:28:53 UTC (rev 19978)
+++ trunk/buildroot/package/config/util.c	2007-09-23 20:46:44 UTC (rev 19979)
@@ -84,7 +84,7 @@
 				    e = p->expr;
 				    if (e && e->left.sym->name) {
 				        if (!done) {
-					    fprintf(out, "%s:", br2_symbol_printer(sym->name));
+					    fprintf(out, "%s: $(BASE_TARGETS)", br2_symbol_printer(sym->name));
 					    done = 1;
 					}
 //printf("SELECTS %s\n",e->left.sym->name);
