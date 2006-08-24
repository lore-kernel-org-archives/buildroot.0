From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 24 Aug 2006 12:45:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb/snapshot
Message-ID: <20060824194547.6D33948A54@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-24 12:45:47 -0700 (Thu, 24 Aug 2006)
New Revision: 15980

Log:
- adjust to current snapshot


Modified:
   trunk/buildroot/toolchain/gdb/snapshot/680-debian_sim-destdir.patch


Changeset:
Modified: trunk/buildroot/toolchain/gdb/snapshot/680-debian_sim-destdir.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/snapshot/680-debian_sim-destdir.patch	2006-08-24 19:35:47 UTC (rev 15979)
+++ trunk/buildroot/toolchain/gdb/snapshot/680-debian_sim-destdir.patch	2006-08-24 19:45:47 UTC (rev 15980)
@@ -9,18 +9,6 @@
  	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
  	"CFLAGS=$(CFLAGS)" \
 +	"DESTDIR=$(DESTDIR)" \
- 	"RANLIB=$(RANLIB)" \
- 	"MAKEINFO=$(MAKEINFO)" \
- 	"INSTALL=$(INSTALL)" \
-diff -ur gdb-6.3.50.20050915/sim/erc32/Makefile.in gdb-6.3.50.20050915-patched/sim/erc32/Makefile.in
---- gdb-6.3.50.20050915/sim/erc32/Makefile.in	2000-03-07 09:32:49.000000000 -0600
-+++ gdb-6.3.50.20050915-patched/sim/erc32/Makefile.in	2005-09-15 23:18:22.000000000 -0500
-@@ -53,7 +53,7 @@
- # Copy the files into directories where they will be run.
- install-sis: installdirs
- 	n=`echo sis | sed '$(program_transform_name)'`; \
--	$(INSTALL_PROGRAM) sis$(EXEEXT) $(bindir)/$$n$(EXEEXT)
-+	$(INSTALL_PROGRAM) sis$(EXEEXT) $(DESTDIR)$(bindir)/$$n$(EXEEXT)
- 
- clean-sis:
- 	rm -f sis end end.h
+ 	"CHILLFLAGS=$(CHILLFLAGS)" \
+ 	"CHILL=$(CHILL_FOR_TARGET)" \
+ 	"CHILL_FOR_TARGET=$(CHILL_FOR_TARGET)" \
