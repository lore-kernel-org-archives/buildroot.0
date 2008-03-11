From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 10:52:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20080311175242.C158D120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 10:52:40 -0700 (Tue, 11 Mar 2008)
New Revision: 21297

Log:
reverted last change

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2008-03-11 16:21:05 UTC (rev 21296)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2008-03-11 17:52:40 UTC (rev 21297)
@@ -32,7 +32,7 @@
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
 	$(CONFIG_UPDATE) $(MPFR_DIR)
 ifneq ($(MPFR_PATCH),)
-	( cd $(MPFR_DIR); patch -p1 -N -Z < ../../$(MPFR_PATCH_SOURCE); )
+	( cd $(MPFR_DIR); patch -p1 -N -Z < $(MPFR_PATCH_SOURCE); )
 endif
 	touch $@
 
