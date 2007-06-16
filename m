From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 16 Jun 2007 11:27:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltp-testsuite
Message-ID: <20070616182738.E48C5485EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-06-16 11:27:38 -0700 (Sat, 16 Jun 2007)
New Revision: 18836

Log:
If external toolchain support NPTL, then we should build Open POSIX Testsuite if the user selects us.


Modified:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk


Changeset:
Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-06-16 17:56:05 UTC (rev 18835)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-06-16 18:27:38 UTC (rev 18836)
@@ -16,9 +16,12 @@
 #
 LTP_PATCHES:=$(subst package/ltp-testsuite/,,				 \
 	     $(wildcard package/ltp-testsuite/*.patch))
+
 ifneq ($(BR2_PTHREADS_NATIVE),y)
+  ifneq ($(BR2_EXT_PTHREADS_NATIVE),y)
 LTP_PATCHES:=$(filter-out ltp-testsuite-enable-openposix-for-nptl.patch, \
 	     $(LTP_PATCHES))
+  endif
 endif
 
 
