From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 19:21:03 +0000 (UTC)
Subject: [Buildroot] svn commit: [25829] trunk/buildroot/package/m4
Message-ID: <20090326192103.53F03772DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-26 19:21:02 +0000 (Thu, 26 Mar 2009)
New Revision: 25829

Log:
m4: provide download target (missing from r25810)

Modified:
   trunk/buildroot/package/m4/m4.mk


Changeset:
Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2009-03-26 18:14:16 UTC (rev 25828)
+++ trunk/buildroot/package/m4/m4.mk	2009-03-26 19:21:02 UTC (rev 25829)
@@ -24,6 +24,9 @@
 # m4 for the host
 M4_HOST_DIR:=$(BUILD_DIR)/m4-$(M4_VERSION)-host
 
+$(DL_DIR)/$(M4_SOURCE):
+	$(call DOWNLOAD,$(M4_SITE),$(M4_SOURCE))
+
 $(STAMP_DIR)/host_m4_unpacked: $(DL_DIR)/$(M4_SOURCE)
 	mkdir -p $(M4_HOST_DIR)
 	$(INFLATE$(suffix $(M4_SOURCE))) $< | \
