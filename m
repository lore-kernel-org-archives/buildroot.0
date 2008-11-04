From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Nov 2008 03:31:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netsnmp
Message-ID: <20081104113158.992A43C971@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-04 03:31:58 -0800 (Tue, 04 Nov 2008)
New Revision: 23922

Log:
netsnmp: run CONFIG_UPDATE

Based on e068796d3 in Bernhards tree.

Modified:
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2008-11-04 11:26:52 UTC (rev 23921)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2008-11-04 11:31:58 UTC (rev 23922)
@@ -22,6 +22,7 @@
 $(NETSNMP_DIR)/.unpacked: $(DL_DIR)/$(NETSNMP_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(NETSNMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(NETSNMP_DIR) package/netsnmp/ \*$(NETSNMP_VERSION)\*.patch
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 ifeq ($(BR2_ENDIAN),"BIG")
