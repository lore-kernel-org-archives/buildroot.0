From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080804190845.A80033C910@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:45 -0700 (Mon, 04 Aug 2008)
New Revision: 23041

Log:
Makefile.autotools.in: quiet configure on silent (-s) builds

Use --quiet configure argument when make is invoked with the -s (silent)
option.

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-08-04 19:08:41 UTC (rev 23040)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-08-04 19:08:45 UTC (rev 23041)
@@ -215,6 +215,7 @@
 		--prefix=/usr \
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
+		$(if $(findstring s,$(MAKEFLAGS)),--quiet,)
 		$($(PKG)_CONF_OPT)
 	$(Q)touch $@
 
