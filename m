From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 14 Jan 2007 03:14:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: libevent nfs-utils
	samba usbmount
Message-ID: <20070114111428.5CF8C485D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-14 03:14:27 -0800 (Sun, 14 Jan 2007)
New Revision: 17295

Log:
- add missing foo-source target for "make source" for downloading 
  package sources used by later offline build.


Modified:
   trunk/buildroot/package/libevent/libevent.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/usbmount/usbmount.mk


Changeset:
Modified: trunk/buildroot/package/libevent/libevent.mk
===================================================================
--- trunk/buildroot/package/libevent/libevent.mk	2007-01-14 06:13:27 UTC (rev 17294)
+++ trunk/buildroot/package/libevent/libevent.mk	2007-01-14 11:14:27 UTC (rev 17295)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(LIBEVENT_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBEVENT_SITE)/$(LIBEVENT_SOURCE)
 
+libevent-source: $(DL_DIR)/$(LIBEVENT_SOURCE)
+
 libevent-unpacked: $(LIBEVENT_DIR)/.unpacked
 $(LIBEVENT_DIR)/.unpacked: $(DL_DIR)/$(LIBEVENT_SOURCE)
 	$(LIBEVENT_CAT) $(DL_DIR)/$(LIBEVENT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-01-14 06:13:27 UTC (rev 17294)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-01-14 11:14:27 UTC (rev 17295)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(NFS_UTILS_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(NFS_UTILS_SITE)/$(NFS_UTILS_SOURCE)
 
+nfs-utils-source: $(DL_DIR)/$(NFS_UTILS_SOURCE)
+
 $(NFS_UTILS_DIR)/.unpacked: $(DL_DIR)/$(NFS_UTILS_SOURCE)
 	$(NFS_UTILS_CAT) $(DL_DIR)/$(NFS_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) package/nfs-utils/ nfs-utils*.patch

Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2007-01-14 06:13:27 UTC (rev 17294)
+++ trunk/buildroot/package/samba/samba.mk	2007-01-14 11:14:27 UTC (rev 17295)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(SAMBA_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SAMBA_SITE)/$(SAMBA_SOURCE)
 
+samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
+
 $(SAMBA_DIR)/.unpacked: $(DL_DIR)/$(SAMBA_SOURCE)
 	$(SAMBA_CAT) $(DL_DIR)/$(SAMBA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh `dirname $(SAMBA_DIR)` package/samba/ samba\*.patch

Modified: trunk/buildroot/package/usbmount/usbmount.mk
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.mk	2007-01-14 06:13:27 UTC (rev 17294)
+++ trunk/buildroot/package/usbmount/usbmount.mk	2007-01-14 11:14:27 UTC (rev 17295)
@@ -13,6 +13,8 @@
 $(DL_DIR)/$(USBMOUNT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(USBMOUNT_SITE)/$(USBMOUNT_SOURCE)
 
+usbmount-source: $(DL_DIR)/$(USBMOUNT_SOURCE)
+
 $(USBMOUNT_DIR)/.unpacked: $(DL_DIR)/$(USBMOUNT_SOURCE)
 	$(USBMOUNT_CAT) $(DL_DIR)/$(USBMOUNT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount \*.patch
