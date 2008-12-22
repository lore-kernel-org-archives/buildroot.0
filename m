From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Dec 2008 22:10:26 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20081222221026.3CB557688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-22 22:10:25 +0000 (Mon, 22 Dec 2008)
New Revision: 24510

Log:
fontconfig: use {C,LD}FLAGS_FOR_BUILD for host tools

Added:
   trunk/buildroot/package/fontconfig/fontconfig-2.6.0-use_for_build.patch


Changeset:
Added: trunk/buildroot/package/fontconfig/fontconfig-2.6.0-use_for_build.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig-2.6.0-use_for_build.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/fontconfig-2.6.0-use_for_build.patch	2008-12-22 22:10:25 UTC (rev 24510)
@@ -0,0 +1,59 @@
+---
+ fc-arch/Makefile.am      |    2 +-
+ fc-case/Makefile.am      |    2 +-
+ fc-glyphname/Makefile.am |    2 +-
+ fc-lang/Makefile.am      |    2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+Index: fontconfig-2.6.0/fc-arch/Makefile.am
+===================================================================
+--- fontconfig-2.6.0.orig/fc-arch/Makefile.am
++++ fontconfig-2.6.0/fc-arch/Makefile.am
+@@ -24,7 +24,7 @@
+ 
+ CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+Index: fontconfig-2.6.0/fc-case/Makefile.am
+===================================================================
+--- fontconfig-2.6.0.orig/fc-case/Makefile.am
++++ fontconfig-2.6.0/fc-case/Makefile.am
+@@ -24,7 +24,7 @@
+ 
+ CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+Index: fontconfig-2.6.0/fc-glyphname/Makefile.am
+===================================================================
+--- fontconfig-2.6.0.orig/fc-glyphname/Makefile.am
++++ fontconfig-2.6.0/fc-glyphname/Makefile.am
+@@ -24,7 +24,7 @@
+ 
+ CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+Index: fontconfig-2.6.0/fc-lang/Makefile.am
+===================================================================
+--- fontconfig-2.6.0.orig/fc-lang/Makefile.am
++++ fontconfig-2.6.0/fc-lang/Makefile.am
+@@ -24,7 +24,7 @@
+ 
+ CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
