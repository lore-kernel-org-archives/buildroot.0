From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu,  1 Jan 2009 14:05:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20090101140555.2087376C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-01 14:05:54 +0000 (Thu, 01 Jan 2009)
New Revision: 24634

Log:
* By default pciutils build of libpci.a uses the host ar/ranlib, force the use of the target tools


Modified:
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2009-01-01 14:00:35 UTC (rev 24633)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2009-01-01 14:05:54 UTC (rev 24634)
@@ -40,7 +40,7 @@
 	touch $@
 
 $(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
-	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" -C $(PCIUTILS_DIR) \
+	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) \
 		SHAREDIR="/usr/share/misc" \
 		ZLIB=$(PCIUTILS_HAVE_ZLIB) \
 		PREFIX=/usr
