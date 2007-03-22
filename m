From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 22 Mar 2007 11:14:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070322181424.A630E4855D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-22 11:14:23 -0700 (Thu, 22 Mar 2007)
New Revision: 18205

Log:
- add a question for andersee


Modified:
   trunk/buildroot/target/linux26.mk


Changeset:
Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-03-22 17:21:18 UTC (rev 18204)
+++ trunk/buildroot/target/linux26.mk	2007-03-22 18:14:23 UTC (rev 18205)
@@ -8,6 +8,7 @@
 
 ifeq ($(LINUX_HEADERS_VERSION),)
 # Version of Linux to download and then apply patches to
+# XXX: andersee, i do not understand why we need this (BF)
 DOWNLOAD_LINUX26_VERSION=2.6.19.2
 # Version of Linux after applying any patches
 LINUX26_VERSION=2.6.19.2
@@ -70,7 +71,7 @@
 	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
-	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(BUILD_DIR)/linux-$(LINUX26_VERSION)
+	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
 endif
 	touch $@
 
