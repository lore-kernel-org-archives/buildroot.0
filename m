From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 23:54:03 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
Message-ID: <20090114235403.1FAC07697C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 23:54:02 +0000 (Wed, 14 Jan 2009)
New Revision: 24851

Log:
Make acpid patch depend on VERSION

Modified:
   trunk/buildroot/package/acpid/acpid.mk


Changeset:
Modified: trunk/buildroot/package/acpid/acpid.mk
===================================================================
--- trunk/buildroot/package/acpid/acpid.mk	2009-01-14 23:53:20 UTC (rev 24850)
+++ trunk/buildroot/package/acpid/acpid.mk	2009-01-14 23:54:02 UTC (rev 24851)
@@ -13,7 +13,7 @@
 
 $(ACPID_DIR)/.unpacked: $(DL_DIR)/$(ACPID_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(ACPID_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(ACPID_DIR) package/acpid/ acpid\*.patch
+	toolchain/patch-kernel.sh $(ACPID_DIR) package/acpid/ acpid-$(ACPID_VERSION)\*.patch
 	touch $(ACPID_DIR)/.unpacked
 
 $(ACPID_DIR)/acpid: $(ACPID_DIR)/.unpacked
