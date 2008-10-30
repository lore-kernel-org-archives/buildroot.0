From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Thu, 30 Oct 2008 10:21:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20081030172118.E5C703C79D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-30 10:21:18 -0700 (Thu, 30 Oct 2008)
New Revision: 23863

Log:
python: add $(STAGING_DIR)/usr/lib to PYTHON_MODULES_LIB so that
 modules build correctly (particularly readline)

Modified:
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-10-30 16:45:55 UTC (rev 23862)
+++ trunk/buildroot/package/python/python.mk	2008-10-30 17:21:18 UTC (rev 23863)
@@ -117,7 +117,7 @@
 endif
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) DESTDIR=$(TARGET_DIR) \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
-		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
+		PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
 
@@ -130,7 +130,7 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) install \
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
-		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
+		PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen && \
 	rm $(TARGET_DIR)/usr/bin/python && \
