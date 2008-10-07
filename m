From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Tue,  7 Oct 2008 10:08:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081007170827.CCA4AF801A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-07 10:08:27 -0700 (Tue, 07 Oct 2008)
New Revision: 23620

Log:
Makefile.autotools.in: honor CONFIG_SHELL and TAR.
  Don't use recursively expanded definition
  (Use ':=' instead of '=')

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-10-07 17:08:25 UTC (rev 23619)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-10-07 17:08:27 UTC (rev 23620)
@@ -125,7 +125,7 @@
 #	ACLOCAL="$(ACLOCAL)"
 
 # Automatically detect tar --strip-path/components option
-TAR_STRIP_COMPONENTS = $(shell tar --help | grep strip-path > /dev/null ; if test $$? = 0 ; then echo '--strip-path' ; else echo '--strip-components' ; fi)
+TAR_STRIP_COMPONENTS := $(shell $(CONFIG_SHELL) -c '$(TAR) --help | grep strip-path > /dev/null ; if test $$? = 0 ; then echo '--strip-path' ; else echo '--strip-components' ; fi')
 
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
