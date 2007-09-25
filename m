From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 25 Sep 2007 07:13:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070925141322.8180130055@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-25 07:13:21 -0700 (Tue, 25 Sep 2007)
New Revision: 20020

Log:
Remove -lgcc, did no good anyway

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-soft-fp.patch


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-soft-fp.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-soft-fp.patch	2007-09-25 13:37:20 UTC (rev 20019)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-soft-fp.patch	2007-09-25 14:13:21 UTC (rev 20020)
@@ -9145,14 +9145,5 @@
 +
 +  return r;
 +}
-diff -urN uClibc-0.9.29-0rig/Rules.mak uClibc-0.9.29/Rules.mak
---- uClibc-0.9.29-0rig/Rules.mak	2007-04-17 15:34:11.000000000 +0200
-+++ uClibc-0.9.29/Rules.mak	2007-09-25 07:26:39.000000000 +0200
-@@ -385,6 +385,7 @@
- # No longer needed with current toolchains, but leave it here for now.
- # If anyone is actually still using gcc 2.95 (say), they can uncomment it.
- #    LDADD_LIBFLOAT=-lfloat
-+CPU_LDFLAGS-y+=-lgcc 
- endif
- endif
+
  
