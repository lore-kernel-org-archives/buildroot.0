From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 12:34:41 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20090116123441.402C0774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 12:34:40 +0000 (Fri, 16 Jan 2009)
New Revision: 24874

Log:
package/dm: fix DOWNLOAD fallout

Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2009-01-16 12:30:07 UTC (rev 24873)
+++ trunk/buildroot/package/dm/dm.mk	2009-01-16 12:34:40 UTC (rev 24874)
@@ -28,7 +28,6 @@
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
-DM_SITE_OLD:=ftp://sources.redhat.com/pub/dm/old
 DM_CAT:=$(ZCAT)
 DM_DIR:=$(BUILD_DIR)/device-mapper.$(DM_VERSION)
 DM_STAGING_BINARY:=$(STAGING_DIR)/usr/sbin/dmsetup
@@ -38,8 +37,7 @@
 DM_TARGET_HEADER:=$(TARGET_DIR)/usr/include/libdevmapper.h
 
 $(DL_DIR)/$(DM_SOURCE):
-	$(call DOWNLOAD,$(DM_SITE),$(DM_SOURCE) || \)
-		$(call DOWNLOAD,$(DM_SITE_OLD),$(DM_SOURCE))
+	$(call DOWNLOAD,$(DM_SITE),$(DM_SOURCE))
 
 dm-source: $(DL_DIR)/$(DM_SOURCE)
 
