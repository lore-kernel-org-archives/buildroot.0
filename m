From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Mar 2009 14:09:20 +0000 (UTC)
Subject: [Buildroot] svn commit: [25586] trunk/buildroot/package/pciutils
Message-ID: <20090309140920.DE0C1764AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-09 14:09:20 +0000 (Mon, 09 Mar 2009)
New Revision: 25586

Log:
pciutils: fix HOST detection

Modified:
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2009-03-09 13:01:08 UTC (rev 25585)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2009-03-09 14:09:20 UTC (rev 25586)
@@ -44,6 +44,7 @@
 	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) \
 		SHAREDIR="/usr/share/misc" \
 		ZLIB=$(PCIUTILS_HAVE_ZLIB) \
+		HOST=$(KERNEL_ARCH)-linux \
 		PREFIX=/usr
 	touch $@
 
