From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 12:33:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
Message-ID: <20070813193337.A341FA65D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 12:33:36 -0700 (Mon, 13 Aug 2007)
New Revision: 19489

Log:
Remove ntp patch which fails to apply, add TODO for later fixing

Added:
   trunk/buildroot/package/ntp/TODO

Removed:
   trunk/buildroot/package/ntp/ntp-cross-compile.patch


Changeset:
Added: trunk/buildroot/package/ntp/TODO
===================================================================
--- trunk/buildroot/package/ntp/TODO	                        (rev 0)
+++ trunk/buildroot/package/ntp/TODO	2007-08-13 19:33:36 UTC (rev 19489)
@@ -0,0 +1,33 @@
+The obsolete patch tries to clear "BUILT_SOURCE"
+
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+***************
+*** 157,163 ****
+  bin_PROGRAMS = ntpdc
+  EXTRA_PROGRAMS = ntpdc-layout
+  EXTRA_DATA = check-layout
+- BUILT_SOURCES = maybe-layout
+  INCLUDES = -I$(top_srcdir)/include
+  # LDADD might need RESLIB and ADJLIB
+  ntpdc_LDADD = version.o ../libntp/libntp.a @READLINE_LIBS@
+--- 157,163 ----
+  bin_PROGRAMS = ntpdc
+  EXTRA_PROGRAMS = ntpdc-layout
+  EXTRA_DATA = check-layout
++ BUILT_SOURCES = 
+  INCLUDES = -I$(top_srcdir)/include
+  # LDADD might need RESLIB and ADJLIB
+  ntpdc_LDADD = version.o ../libntp/libntp.a @READLINE_LIBS@
+------------------------------------------------------------
+The current tarball contains a lot more:
+
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+AUTOMAKE_OPTIONS = ../util/ansi2knr
+EXTRA_DATA = check-layout
+BUILT_SOURCES = @MAKE_CHECK_LAYOUT@ ntpdc-opts.c ntpdc-opts.h ntpdc.1 \
+	ntpdc-opts.texi ntpdc-opts.menu
+AM_CPPFLAGS = -I$(top_srcdir)/include $(LIBOPTS_CFLAGS)
+# LDADD might need RESLIB and ADJLIB
+------------------------------------------------------------
+
+Do we need to remove "@MAKE_CHECK_LAYOUT@" in a new patch?

Deleted: trunk/buildroot/package/ntp/ntp-cross-compile.patch
===================================================================
--- trunk/buildroot/package/ntp/ntp-cross-compile.patch	2007-08-13 14:10:24 UTC (rev 19488)
+++ trunk/buildroot/package/ntp/ntp-cross-compile.patch	2007-08-13 19:33:36 UTC (rev 19489)
@@ -1,11 +0,0 @@
---- ntp/ntpdc/Makefile.in
-+++ ntp/ntpdc/Makefile.in
-@@ -157,7 +157,7 @@
- bin_PROGRAMS = ntpdc
- EXTRA_PROGRAMS = ntpdc-layout
- EXTRA_DATA = check-layout
--BUILT_SOURCES = maybe-layout
-+BUILT_SOURCES = 
- INCLUDES = -I$(top_srcdir)/include
- # LDADD might need RESLIB and ADJLIB
- ntpdc_LDADD = version.o ../libntp/libntp.a @READLINE_LIBS@
