From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 19:37:31 +0000 (UTC)
Subject: [Buildroot] svn commit: [25831]
	trunk/buildroot/package/mtd/mtd-utils.git
Message-ID: <20090326193731.BE19E772DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-26 19:37:31 +0000 (Thu, 26 Mar 2009)
New Revision: 25831

Log:
mtd-utils.git: revert r24869 (convert to DOWNLOAD helper) to fix download

Reported by Thomas Petazzoni.

The git download doesn't work nicely with DOWNLOAD, so revert to the
direct WGET handling.

Modified:
   trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk	2009-03-26 19:37:26 UTC (rev 25830)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk	2009-03-26 19:37:31 UTC (rev 25831)
@@ -21,7 +21,7 @@
 SUMTOOL := $(MTD_HOST_DIR)/sumtool
 
 $(DL_DIR)/$(MTD_SOURCE):
-	$(call DOWNLOAD,"$(MTD_URL)")
+	$(WGET) -O $(DL_DIR)/$(MTD_SOURCE) "$(MTD_URL)"
 
 $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
