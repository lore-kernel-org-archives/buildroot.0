From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 05:02:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netsnmp
Message-ID: <20070717120244.A479DA6AA6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 05:02:44 -0700 (Tue, 17 Jul 2007)
New Revision: 19128

Log:
Read patch from correct directory

Modified:
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2007-07-17 12:01:09 UTC (rev 19127)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2007-07-17 12:02:44 UTC (rev 19128)
@@ -20,7 +20,7 @@
 $(NETSNMP_DIR)/.unpacked: $(DL_DIR)/$(NETSNMP_SOURCE) $(DL_DIR)/$(NETSNMP_PATCH1)
 	$(ZCAT) $(DL_DIR)/$(NETSNMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(ZCAT) $(DL_DIR)/$(NETSNMP_PATCH1) | patch -p1 -d $(NETSNMP_DIR)
-	toolchain/patch-kernel.sh $(NETSNMP_DIR) package/netsnmp/ netsnmp\*.patch
+	toolchain/patch-kernel.sh $(NETSNMP_DIR) package/netsnmp/ \*.patch
 	touch $(NETSNMP_DIR)/.unpacked
 
 ifeq ($(BR2_ENDIAN),"BIG")
