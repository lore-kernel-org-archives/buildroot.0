From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:43:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20080511064323.652C63C822@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:43:22 -0700 (Sat, 10 May 2008)
New Revision: 21964

Log:
Bump mdadm version

Modified:
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2008-05-11 06:41:33 UTC (rev 21963)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2008-05-11 06:43:22 UTC (rev 21964)
@@ -5,7 +5,7 @@
 #############################################################
 MDADM_VERSION:=2.6.4
 MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
-MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1.diff.gz
+MDADM_PATCH:=mdadm_$(MDADM_VERSION)-2.diff.gz
 MDADM_CAT:=$(ZCAT)
 MDADM_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mdadm
 MDADM_DIR:=$(BUILD_DIR)/mdadm-$(MDADM_VERSION)
@@ -42,10 +42,12 @@
 	rm -Rf $(TARGET_DIR)/usr/share/man
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
+mdadm-source: $(DL_DIR)/$(MDADM_SOURCE) $(MDADM_PATCH_FILE)
+
+mdadm-unpacked: $(MDADM_DIR)/.unpacked
+
 mdadm: uclibc $(TARGET_DIR)/$(MDADM_TARGET_BINARY)
 
-mdadm-source: $(DL_DIR)/$(MDADM_SOURCE) $(MDADM_PATCH_FILE)
-
 mdadm-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(MDADM_DIR) uninstall
 	-$(MAKE) -C $(MDADM_DIR) clean
