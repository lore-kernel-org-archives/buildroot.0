From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 16:23:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20070923232354.4B73F30046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 16:23:52 -0700 (Sun, 23 Sep 2007)
New Revision: 19982

Log:
Bump SAMBA version to 3.0.26a, 3.0.25b has moved

Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2007-09-23 22:08:51 UTC (rev 19981)
+++ trunk/buildroot/package/samba/samba.mk	2007-09-23 23:23:52 UTC (rev 19982)
@@ -3,7 +3,7 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.0.25b
+SAMBA_VERSION:=3.0.26a
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=ftp://us4.samba.org/pub/samba/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
@@ -14,8 +14,6 @@
 $(DL_DIR)/$(SAMBA_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SAMBA_SITE)/$(SAMBA_SOURCE)
 
-samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
-
 $(SAMBA_DIR)/.unpacked: $(DL_DIR)/$(SAMBA_SOURCE)
 	$(SAMBA_CAT) $(DL_DIR)/$(SAMBA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh `dirname $(SAMBA_DIR)` package/samba/ samba\*.patch
@@ -107,6 +105,10 @@
 
 samba: uclibc $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
 
+samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
+
+samba-unpacked: $(SAMBA_DIR)/.unpacked
+
 samba-clean:
 	rm -f $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
 	for file in $(SAMBA_TARGETS_y); do \
