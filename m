From: hamish at uclibc.org <hamish@uclibc.org>
Date: Sun, 24 Feb 2008 15:02:57 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/e2fsprogs
Message-ID: <20080224230257.E5F2712C639@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-02-24 15:02:56 -0800 (Sun, 24 Feb 2008)
New Revision: 21107

Log:
Allow selection of e2fsprogs to install in the target

Modified:
   trunk/buildroot/package/e2fsprogs/Config.in
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk


Changeset:
Modified: trunk/buildroot/package/e2fsprogs/Config.in
===================================================================
--- trunk/buildroot/package/e2fsprogs/Config.in	2008-02-24 22:45:04 UTC (rev 21106)
+++ trunk/buildroot/package/e2fsprogs/Config.in	2008-02-24 23:02:56 UTC (rev 21107)
@@ -3,3 +3,81 @@
 	default n
 	help
 	  The EXT2 file system utilities and libraries
+
+config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
+	bool "badblocks"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_BLKID
+	bool "blkid"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_CHATTR
+	bool "chattr"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_DUMPE2FS
+	bool "dumpe2fs"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_E2FSCK
+	bool "e2fsck"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_E2LABEL
+	bool "e2label"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_FILEFRAG
+	bool "filefrag"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_FINDFS
+	bool "findfs"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_E2LABEL
+
+config BR2_PACKAGE_E2FSPROGS_FSCK
+	bool "fsck"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_LOGSAVE
+	bool "logsave"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_LSATTR
+	bool "chattr"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_MKE2FS
+	bool "mke2fs"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
+	bool "mklost+found"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_TUNE2FS
+	bool "tune2fs"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_E2LABEL
+
+config BR2_PACKAGE_E2FSPROGS_UUIDGEN
+	bool "uuidgen"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+

Modified: trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2008-02-24 22:45:04 UTC (rev 21106)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2008-02-24 23:02:56 UTC (rev 21107)
@@ -68,6 +68,20 @@
 	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
 	touch -c $@
 
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_BADBLOCKS)) += ${TARGET_DIR}/sbin/badblocks
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_BLKID)) += ${TARGET_DIR}/sbin/blkid
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_CHATTR)) += ${TARGET_DIR}/bin/chattr
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_DUMPE2FS)) += ${TARGET_DIR}/sbin/dumpe2fs
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_E2LABEL)) += ${TARGET_DIR}/sbin/e2label
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_E2FSCK)) += ${TARGET_DIR}/sbin/e2fsck
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_FILEFRAG)) += ${TARGET_DIR}/sbin/filefrag
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_FSCK)) += ${TARGET_DIR}/sbin/fsck
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_LOGSAVE)) += ${TARGET_DIR}/sbin/logsave
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_LSATTR)) += ${TARGET_DIR}/bin/lsattr
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_MKE2FS)) += ${TARGET_DIR}/sbin/mke2fs
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND)) += ${TARGET_DIR}/sbin/mklost+found
+E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_UUIDGEN)) += ${TARGET_DIR}/bin/uuidgen
+
 $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR) install
@@ -75,12 +89,23 @@
 		${TARGET_DIR}/sbin/fsck.ext[23] \
 		${TARGET_DIR}/sbin/findfs \
 		${TARGET_DIR}/sbin/tune2fs
+ifneq ($(strip $(E2FSPROGS_RM)),)
+	rm -rf $(E2FSPROGS_RM)
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_MKE2FS)),y)
 	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext2
 	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext3
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_E2FSCK)),y)
 	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext2
 	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext3
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_TUNE2FS)),y)
 	ln -sf e2label ${TARGET_DIR}/sbin/tune2fs
+endif
+ifeq ($(strip $(BR2_PACKAGE_E2FSPROGS_FINDFS)),y)
 	ln -sf e2label ${TARGET_DIR}/sbin/findfs
+endif
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/info
 endif
