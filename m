From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 13 Feb 2007 10:56:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.1.2
Message-ID: <20070213185655.40EDD485E5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-13 10:56:54 -0800 (Tue, 13 Feb 2007)
New Revision: 17876

Log:
- backport fix for PR30620


Added:
   trunk/buildroot/toolchain/gcc/4.1.2/402-libbackend_dep_gcov-iov.h.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.1.2/402-libbackend_dep_gcov-iov.h.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.1.2/402-libbackend_dep_gcov-iov.h.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.1.2/402-libbackend_dep_gcov-iov.h.patch	2007-02-13 18:56:54 UTC (rev 17876)
@@ -0,0 +1,12 @@
+# gcc.gnu.org/PR30620
+--- gcc-4.1.2-20070208.orig/gcc/Makefile.in	2006-11-01 15:40:44.000000000 +0100
++++ gcc-4.1.2-20070208/gcc/Makefile.in	2007-02-13 19:23:31.000000000 +0100
+@@ -2522,7 +2522,7 @@
+ # FIXME: writing proper dependencies for this is a *LOT* of work.
+ libbackend.o : $(OBJS-common:.o=.c) $(out_file) \
+   insn-config.h insn-flags.h insn-codes.h insn-constants.h \
+-  insn-attr.h  $(DATESTAMP) $(BASEVER) $(DEVPHASE)
++  insn-attr.h  $(DATESTAMP) $(BASEVER) $(DEVPHASE) gcov-iov.h
+ 	$(CC) $(ALL_CFLAGS) $(ALL_CPPFLAGS) \
+ 	  -DTARGET_NAME=\"$(target_noncanonical)\" \
+ 	  -DLOCALEDIR=\"$(localedir)\" \
