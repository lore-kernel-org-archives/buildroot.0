From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Sun, 21 Oct 2007 05:02:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lsof
Message-ID: <20071021120218.1C89BA4A39@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-21 05:02:16 -0700 (Sun, 21 Oct 2007)
New Revision: 20310

Log:
make lsof configure with target includes, thanks to marcg

Modified:
   trunk/buildroot/package/lsof/lsof.mk


Changeset:
Modified: trunk/buildroot/package/lsof/lsof.mk
===================================================================
--- trunk/buildroot/package/lsof/lsof.mk	2007-10-20 19:20:22 UTC (rev 20309)
+++ trunk/buildroot/package/lsof/lsof.mk	2007-10-21 12:02:16 UTC (rev 20310)
@@ -10,6 +10,7 @@
 LSOF_DIR:=$(BUILD_DIR)/lsof_$(LSOF_VERSION)
 LSOF_BINARY:=lsof
 LSOF_TARGET_BINARY:=bin/lsof
+LSOF_INCLUDE:=$(STAGING_DIR)/usr/include
 
 BR2_LSOF_CFLAGS:=
 ifeq ($(BR2_LARGEFILE),)
@@ -33,7 +34,7 @@
 	touch $(LSOF_DIR)/.unpacked
 
 $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
-	(cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" ./Configure linux)
+	(cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" LSOF_INCLUDE="$(LSOF_INCLUDE)" ./Configure linux)
 	touch $(LSOF_DIR)/.configured
 
 $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
