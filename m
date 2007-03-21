From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 21 Mar 2007 03:55:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20070321105502.C336448088@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-21 03:55:02 -0700 (Wed, 21 Mar 2007)
New Revision: 18194

Log:
- add CFLAGS_COMBINE check


Modified:
   trunk/buildroot/toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-03-21 10:54:24 UTC (rev 18193)
+++ trunk/buildroot/toolchain/Makefile.in	2007-03-21 10:55:02 UTC (rev 18194)
@@ -16,6 +16,8 @@
 
 # late binding check to see if the target cc supports -fwhole-program
 CFLAGS_WHOLE_PROGRAM = $(call cc-option,-fwhole-program,)
+# gcc-3.4 would need -combine, I only support 4.2, which correctly uses '--'
+CFLAGS_COMBINE = $(call cc-option,--combine,)
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
