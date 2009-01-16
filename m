From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 12:34:45 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20090116123445.A3465774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 12:34:44 +0000 (Fri, 16 Jan 2009)
New Revision: 24875

Log:
package/mpfr: fix make source-check/external-deps issue

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2009-01-16 12:34:40 UTC (rev 24874)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2009-01-16 12:34:44 UTC (rev 24875)
@@ -22,8 +22,10 @@
 
 $(MPFR_PATCH_SOURCE):
 	$(call DOWNLOAD,$(MPFR_SITE),$(MPFR_PATCH))
+ifeq ($(SPIDER),) # this breaks source-check/external-deps
 	mv $(DL_DIR)/$(MPFR_PATCH) $@
 endif
+endif
 
 $(DL_DIR)/$(MPFR_SOURCE):
 	 $(call DOWNLOAD,$(MPFR_SITE),$(MPFR_SOURCE))
