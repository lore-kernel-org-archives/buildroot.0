From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 13:14:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070821201424.A0BC1A5D3C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 13:14:23 -0700 (Tue, 21 Aug 2007)
New Revision: 19631

Log:
- make sure that sstrip is available early enough


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.mk


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-21 19:45:17 UTC (rev 19630)
+++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-21 20:14:23 UTC (rev 19631)
@@ -5,7 +5,11 @@
 #
 ######################################################################
 
-dependencies: host-sed host-lzma
+ifeq ($(BR2_STRIP_sstrip),y)
+# XXX: this is a little bit ugly, yep.
+MAYBE_SSTRIP_HOST:=sstrip_host
+endif
+dependencies: host-sed host-lzma $(MAYBE_SSTRIP_HOST)
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		HOST_SED_DIR="$(HOST_SED_DIR)" \
 		$(TOPDIR)/toolchain/dependencies/dependencies.sh
