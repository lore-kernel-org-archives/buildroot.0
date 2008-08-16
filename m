From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 16 Aug 2008 04:59:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080816115956.EB7E8F8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-16 04:59:56 -0700 (Sat, 16 Aug 2008)
New Revision: 23089

Log:
Makefile.autotools.in: add missing continuation for PKG_CONF_OPT

The silent support added in r23041 was missing a shell continuation character
breaking PKG_CONF_OPT support - Fixed.

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-08-16 11:48:02 UTC (rev 23088)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-08-16 11:59:56 UTC (rev 23089)
@@ -213,7 +213,7 @@
 		--prefix=/usr \
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
-		$(if $(findstring s,$(MAKEFLAGS)),--quiet,)
+		$(if $(findstring s,$(MAKEFLAGS)),--quiet,) \
 		$($(PKG)_CONF_OPT)
 	$(Q)touch $@
 
