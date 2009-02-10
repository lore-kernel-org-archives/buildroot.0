From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 15:19:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20090210151932.41B1576275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-10 15:19:31 +0000 (Tue, 10 Feb 2009)
New Revision: 25292

Log:
gmp/mpfr: fix up dependencies to stop continous rebuild with --disable-shared

Don't list the shared objects as targets for the host compilation now that
we compile with --disable-shared.

Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2009-02-10 15:19:24 UTC (rev 25291)
+++ trunk/buildroot/package/gmp/gmp.mk	2009-02-10 15:19:31 UTC (rev 25292)
@@ -89,7 +89,7 @@
 	)
 	touch $@
 
-$(GMP_HOST_DIR)/lib/libgmp$(HOST_LIBEXT) $(GMP_HOST_DIR)/lib/libgmp$(HOST_SHREXT) $(GMP_HOST_DIR)/lib/libgmp$(HOST_SHREXT).(GMP_LIBVERSION): $(GMP_DIR2)/.configured
+$(GMP_HOST_DIR)/lib/libgmp$(HOST_LIBEXT): $(GMP_DIR2)/.configured
 	$(MAKE) -C $(GMP_DIR2) install
 
 host-libgmp: $(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY)

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2009-02-10 15:19:24 UTC (rev 25291)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2009-02-10 15:19:31 UTC (rev 25292)
@@ -103,7 +103,7 @@
 	)
 	touch $@
 
-$(MPFR_HOST_DIR)/lib/libmpfr$(HOST_LIBEXT) $(MPFR_HOST_DIR)/lib/libmpfr$(HOST_SHREXT) $(MPFR_HOST_DIR)/lib/libmpfr$(HOST_SHREXT).$(MPFR_LIBVERSION): $(MPFR_DIR2)/.configured
+$(MPFR_HOST_DIR)/lib/libmpfr$(HOST_LIBEXT): $(MPFR_DIR2)/.configured
 	$(MAKE) -C $(MPFR_DIR2) install
 
 host-libmpfr: $(MPFR_HOST_DIR)/lib/$(MPFR_HOST_BINARY)
