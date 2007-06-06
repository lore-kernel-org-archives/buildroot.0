From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Jun 2007 13:25:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20070606202517.1C2924857E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-06 13:25:16 -0700 (Wed, 06 Jun 2007)
New Revision: 18763

Log:
- fix typo


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-06-06 19:59:01 UTC (rev 18762)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-06-06 20:25:16 UTC (rev 18763)
@@ -123,7 +123,7 @@
 	);
 	touch $@
 
-$(GMP_HOST_DIR)/lib/libgmp$(HOST_LIBEXT)/lib/libgmp$(HOST_SHREXT): $(GMP_DIR2)/.configured
+$(GMP_HOST_DIR)/lib/libgmp$(HOST_LIBEXT) $(GMP_HOST_DIR)/lib/libgmp$(HOST_SHREXT) $(GMP_HOST_DIR)/lib/libgmp$(HOST_SHREXT).(GMP_LIBVERSION): $(GMP_DIR2)/.configured
 	$(MAKE) -C $(GMP_DIR2) install
 
 host-libgmp: $(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY)

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-06-06 19:59:01 UTC (rev 18762)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-06-06 20:25:16 UTC (rev 18763)
@@ -140,7 +140,7 @@
 	);
 	touch $@
 
-$(MPFR_HOST_DIR)/lib/libmpfr$(HOST_LIBEXT) $(MPFR_HOST_DIR)/lib/libmpfr$(HOST_SHREXT): $(MPFR_DIR2)/.configured
+$(MPFR_HOST_DIR)/lib/libmpfr$(HOST_LIBEXT) $(MPFR_HOST_DIR)/lib/libmpfr$(HOST_SHREXT) $(MPFR_HOST_DIR)/lib/libmpfr$(HOST_SHREXT).$(MPFR_LIBVERSION): $(MPFR_DIR2)/.configured
 	$(MAKE) -C $(MPFR_DIR2) install
 
 host-libmpfr: $(MPFR_HOST_DIR)/lib/$(MPFR_HOST_BINARY)
