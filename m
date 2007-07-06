From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Fri,  6 Jul 2007 04:41:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: coreutils file
Message-ID: <20070706114130.4023EA608B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-06 04:41:27 -0700 (Fri, 06 Jul 2007)
New Revision: 19010

Log:
Bump versions.


Modified:
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/coreutils/coreutils.mk
===================================================================
--- trunk/buildroot/package/coreutils/coreutils.mk	2007-07-06 04:58:01 UTC (rev 19009)
+++ trunk/buildroot/package/coreutils/coreutils.mk	2007-07-06 11:41:27 UTC (rev 19010)
@@ -3,7 +3,7 @@
 # coreutils
 #
 #############################################################
-COREUTILS_VER:=5.96
+COREUTILS_VER:=6.9
 COREUTILS_SOURCE:=coreutils-$(COREUTILS_VER).tar.bz2
 #COREUTILS_SITE:=ftp://alpha.gnu.org/gnu/coreutils/
 COREUTILS_SITE:=http://ftp.gnu.org/pub/gnu/coreutils
@@ -102,13 +102,6 @@
 		--disable-rpath \
 		--disable-dependency-tracking \
 	);
-	#Fix up the max number of open files per process, which apparently 
-	# is not set when cross compiling
-	$(SED) 's,.*UTILS_OPEN_MAX.*,#define UTILS_OPEN_MAX 1019,g' \
-		$(COREUTILS_DIR)/config.h
-	# This is undefined when crosscompiling...
-	$(SED) 's,.*HAVE_PROC_UPTIME.*,#define HAVE_PROC_UPTIME 1,g' \
-		$(COREUTILS_DIR)/config.h
 	touch $@
 
 $(COREUTILS_DIR)/$(COREUTILS_BINARY): $(COREUTILS_DIR)/.configured

Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-07-06 04:58:01 UTC (rev 19009)
+++ trunk/buildroot/package/file/file.mk	2007-07-06 11:41:27 UTC (rev 19010)
@@ -94,6 +94,7 @@
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	mv $(TARGET_DIR)/lib/libmagic.a $(STAGING_DIR)/lib
 	rm -f $(TARGET_DIR)/lib/libmagic.la
+	mkdir -p $(STAGING_DIR)/include
 	mv $(TARGET_DIR)/usr/include/magic.h $(STAGING_DIR)/include
 
 file: zlib uclibc $(TARGET_DIR)/$(FILE_TARGET_BINARY)
