From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  9 Jan 2009 13:34:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20090109133455.0311B768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-09 13:34:53 +0000 (Fri, 09 Jan 2009)
New Revision: 24731

Log:
grep: bump version, use GNU_MIRROR

Modified:
   trunk/buildroot/package/grep/grep.mk


Changeset:
Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2009-01-09 06:31:01 UTC (rev 24730)
+++ trunk/buildroot/package/grep/grep.mk	2009-01-09 13:34:53 UTC (rev 24731)
@@ -3,9 +3,9 @@
 # grep
 #
 #############################################################
-GNUGREP_VERSION:=2.5.1
-GNUGREP_SOURCE:=grep_$(GNUGREP_VERSION).ds1.orig.tar.gz
-GNUGREP_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grep/
+GNUGREP_VERSION:=2.5.3
+GNUGREP_SOURCE:=grep-$(GNUGREP_VERSION).tar.gz
+GNUGREP_SITE:=$(BR2_GNU_MIRROR)/grep
 GNUGREP_DIR:=$(BUILD_DIR)/grep-$(GNUGREP_VERSION)
 GNUGREP_CAT:=$(ZCAT)
 GNUGREP_BINARY:=src/grep
@@ -19,9 +19,6 @@
 $(GNUGREP_DIR)/.unpacked: $(DL_DIR)/$(GNUGREP_SOURCE)
 	rm -rf $(GNUGREP_DIR).xxx
 	$(GNUGREP_CAT) $(DL_DIR)/$(GNUGREP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	mv $(GNUGREP_DIR) $(GNUGREP_DIR).xxx
-	$(GNUGREP_CAT) $(GNUGREP_DIR).xxx/grep_$(GNUGREP_VERSION).tar.gz | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	rm -rf $(GNUGREP_DIR).xxx
 	$(CONFIG_UPDATE) $(GNUGREP_DIR)
 	touch $@
 
