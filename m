From: correa at uclibc.org <correa@uclibc.org>
Date: Thu, 30 Oct 2008 19:17:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081031021730.62E773C671@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-30 19:17:30 -0700 (Thu, 30 Oct 2008)
New Revision: 23872

Log:
fix wrong variable name for SQL. Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-10-31 02:04:28 UTC (rev 23871)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-10-31 02:17:30 UTC (rev 23872)
@@ -307,7 +307,7 @@
 		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
 		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \
 	fi
-ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
+ifneq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
 	# Remove Sql libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSql*
 endif
