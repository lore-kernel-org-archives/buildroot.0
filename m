From: andersen at uclibc.org <andersen@uclibc.org>
Date: Fri,  3 Nov 2006 00:21:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sed
Message-ID: <20061103082148.23220485AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-11-03 00:21:47 -0800 (Fri, 03 Nov 2006)
New Revision: 16491

Log:
fix use of BUILD_WITH_LARGEFILE to properly
refer to BR2_LARGEFILE


Modified:
   trunk/buildroot/package/sed/sed.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2006-11-02 22:09:37 UTC (rev 16490)
+++ trunk/buildroot/package/sed/sed.mk	2006-11-03 08:21:47 UTC (rev 16491)
@@ -11,7 +11,7 @@
 SED_DIR2:=$(BUILD_DIR)/sed-$(SED_VER)
 SED_BINARY:=sed/sed
 SED_TARGET_BINARY:=bin/sed
-ifeq ($(strip $(BUILD_WITH_LARGEFILE)),true)
+ifeq ($(strip $(BR2_LARGEFILE)),y)
 SED_CPPFLAGS=-D_FILE_OFFSET_BITS=64
 endif
 #HOST_SED_DIR:=$(STAGING_DIR)
