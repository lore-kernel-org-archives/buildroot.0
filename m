From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Sep 2007 10:08:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20070920170847.B294C3004A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-20 10:08:46 -0700 (Thu, 20 Sep 2007)
New Revision: 19917

Log:
Use correct patch name

Modified:
   trunk/buildroot/package/vpnc/vpnc.mk


Changeset:
Modified: trunk/buildroot/package/vpnc/vpnc.mk
===================================================================
--- trunk/buildroot/package/vpnc/vpnc.mk	2007-09-20 16:58:35 UTC (rev 19916)
+++ trunk/buildroot/package/vpnc/vpnc.mk	2007-09-20 17:08:46 UTC (rev 19917)
@@ -19,7 +19,7 @@
 
 $(VPNC_DIR)/.unpacked: $(DL_DIR)/$(VPNC_SOURCE)
 	$(VPNC_CAT) $(DL_DIR)/$(VPNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(VPNC_DIR) package/vpnc \*$(VPNC_VERSION).patch
+	toolchain/patch-kernel.sh $(VPNC_DIR) package/vpnc vpnc-$(VPNC_VERSION)\*.patch
 	touch $@
 
 $(VPNC_BINARY): $(VPNC_DIR)/.unpacked
