From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Fri, 25 Jan 2008 02:20:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080125102011.4F9FF12C5ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2008-01-25 02:20:11 -0800 (Fri, 25 Jan 2008)
New Revision: 20900

Log:
Fix by Fredy Yanardi


Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-01-25 10:02:32 UTC (rev 20899)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-01-25 10:20:11 UTC (rev 20900)
@@ -31,6 +31,9 @@
 QTOPIA4_SOURCE:=qtopia-core-commercial-src-$(QTOPIA4_VERSION).tar.gz
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qtopia-core-commercial-src-$(QTOPIA4_VERSION)
 QTOPIA4_HOST_DIR:=$(TOOL_BUILD_DIR)/qtopia-core-commercial-src-$(QTOPIA4_VERSION)
+QTOPIA4_NO_SQL_OCI:=-no-sql-oci
+QTOPIA4_NO_SQL_TDS:=-no-sql-tds
+QTOPIA4_NO_SQL_DB2:=-no-sql-db2
 
 else
 
@@ -81,7 +84,7 @@
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 #BUG: Qtopia refuse to recognize -qt-mouse-tslib
-#QTOPIA4_TSLIB=-qt-mouse-tslib
+QTOPIA4_TSLIB=-qt-mouse-tslib
 QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
 QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
@@ -200,15 +203,15 @@
 		$(QTOPIA4_GIF_LIB) \
 		$(QTOPIA4_JPEG) \
 		$(QTOPIA4_ZLIB) \
-		-no-sql-db2 \
 		-no-sql-ibase \
 		-no-sql-mysql \
-		-no-sql-oci \
 		-no-sql-odbc \
 		-no-sql-psql \
 		-no-sql-sqlite \
 		-no-sql-sqlite2 \
-		-no-sql-tds \
+		$(QTOPIA4_NO_SQL_DB2) \
+		$(QTOPIA4_NO_SQL_OCI) \
+		$(QTOPIA4_NO_SQL_TDS) \
 		-prefix $(QTOPIA4_TARGET_DIR) \
 		-docdir $(QTOPIA4_TARGET_DIR)/doc \
 		-headerdir $(QTOPIA4_TARGET_DIR)/include \
