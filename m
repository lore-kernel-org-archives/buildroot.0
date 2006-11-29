From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 02:23:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20061129102354.1770D4855F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 02:23:54 -0800 (Wed, 29 Nov 2006)
New Revision: 16713

Log:
- bump version. Fetch from old/ dir if the version is out-of-date.
Thanks to Pavel Roskin


Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2006-11-29 08:42:37 UTC (rev 16712)
+++ trunk/buildroot/package/dm/dm.mk	2006-11-29 10:23:54 UTC (rev 16713)
@@ -24,10 +24,11 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=12
+DM_PATCH=13
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
+DM_SITE_OLD:=ftp://sources.redhat.com/pub/dm/old
 DM_CAT:=$(ZCAT)
 DM_DIR:=$(BUILD_DIR)/device-mapper.$(DM_VERSION)
 DM_STAGING_BINARY:=$(STAGING_DIR)/sbin/dmsetup
@@ -36,7 +37,8 @@
 DM_TARGET_LIBRARY:=$(TARGET_DIR)/usr/lib/libdevmapper.so
 
 $(DL_DIR)/$(DM_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(DM_SITE)/$(DM_SOURCE)
+	$(WGET) -P $(DL_DIR) $(DM_SITE)/$(DM_SOURCE) || \
+		$(WGET) -P $(DL_DIR) $(DM_SITE_OLD)/$(DM_SOURCE)
 
 $(DM_DIR)/.unpacked: $(DL_DIR)/$(DM_SOURCE)
 	$(DM_CAT) $(DL_DIR)/$(DM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
