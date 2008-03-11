From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 08:58:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20080311155806.1627A120137@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 08:58:05 -0700 (Tue, 11 Mar 2008)
New Revision: 21294

Log:
fixed path to mpfr patch 

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2008-03-11 15:49:09 UTC (rev 21293)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2008-03-11 15:58:05 UTC (rev 21294)
@@ -32,7 +32,7 @@
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
 	$(CONFIG_UPDATE) $(MPFR_DIR)
 ifneq ($(MPFR_PATCH),)
-	( cd $(MPFR_DIR); patch -p1 -N -Z < $(MPFR_PATCH_SOURCE); )
+	( cd $(MPFR_DIR); patch -p1 -N -Z < ../../$(MPFR_PATCH_SOURCE); )
 endif
 	touch $@
 
