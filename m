From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 14:32:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20071030213210.67633A69B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 14:32:09 -0700 (Tue, 30 Oct 2007)
New Revision: 20338

Log:
Update mdadm patch to latest version

Modified:
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2007-10-30 21:26:50 UTC (rev 20337)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2007-10-30 21:32:09 UTC (rev 20338)
@@ -5,7 +5,7 @@
 #############################################################
 MDADM_VERSION:=2.6.2
 MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
-MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1.diff.gz
+MDADM_PATCH:=mdadm_$(MDADM_VERSION)-2.diff.gz
 MDADM_CAT:=$(ZCAT)
 MDADM_SITE:=http://ftp.debian.org/debian/pool/main/m/mdadm
 MDADM_DIR:=$(BUILD_DIR)/mdadm-$(MDADM_VERSION)
@@ -44,7 +44,7 @@
 
 mdadm: uclibc $(TARGET_DIR)/$(MDADM_TARGET_BINARY)
 
-mdadm-source: $(DL_DIR)/$(MDADM_SOURCE)
+mdadm-source: $(DL_DIR)/$(MDADM_SOURCE) $(MDADM_PATCH_FILE)
 
 mdadm-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(MDADM_DIR) uninstall
