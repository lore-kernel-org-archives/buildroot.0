From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 27 Sep 2007 14:58:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070927215846.06225A45EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-27 14:58:46 -0700 (Thu, 27 Sep 2007)
New Revision: 20075

Log:
- add a query for suggestions on how to deal with MALLOC_GLIBC_COMPAT


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-27 21:51:21 UTC (rev 20074)
+++ trunk/buildroot/package/Makefile.in	2007-09-27 21:58:46 UTC (rev 20075)
@@ -205,6 +205,8 @@
 BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=no
 endif
 
+# XXX: FIXME: We would need to grab MALLOC_GLIBC_COMPAT from the uClibc.config
+# Including it doesn't seem wise, grepping is ugly.. Suggestions?
 # Does malloc return live pointer for malloc(0) ?
 ifeq ($(MALLOC_GLIBC_COMPAT),y)
 BR2_AC_CV_FUNC_MALLOC_0_NONNULL=ac_cv_func_malloc_0_nonnull=yes \
