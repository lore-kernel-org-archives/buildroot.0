From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 10 Feb 2007 11:36:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20070210193626.4321D4865E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-10 11:36:25 -0800 (Sat, 10 Feb 2007)
New Revision: 17850

Log:
- add first hunk to fix PR30620


Added:
   trunk/buildroot/toolchain/gcc/4.2/402-libbackend_dep_gcov-iov.h.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.2/402-libbackend_dep_gcov-iov.h.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/402-libbackend_dep_gcov-iov.h.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.2/402-libbackend_dep_gcov-iov.h.patch	2007-02-10 19:36:25 UTC (rev 17850)
@@ -0,0 +1,13 @@
+Index: gcc-4.2/gcc/Makefile.in
+===================================================================
+--- gcc-4.2/gcc/Makefile.in	(revision 121758)
++++ gcc-4.2/gcc/Makefile.in	(working copy)
+@@ -2658,7 +2658,7 @@ mips-tdump.o : mips-tdump.c $(CONFIG_H) 
+ # FIXME: writing proper dependencies for this is a *LOT* of work.
+ libbackend.o : $(OBJS-common:.o=.c) $(out_file) \
+   insn-config.h insn-flags.h insn-codes.h insn-constants.h \
+-  insn-attr.h  $(DATESTAMP) $(BASEVER) $(DEVPHASE)
++  insn-attr.h  $(DATESTAMP) $(BASEVER) $(DEVPHASE) gcov-iov.h
+ 	$(CC) $(ALL_CFLAGS) $(ALL_CPPFLAGS) \
+ 	  -DTARGET_NAME=\"$(target_noncanonical)\" \
+ 	  -DLOCALEDIR=\"$(localedir)\" \
