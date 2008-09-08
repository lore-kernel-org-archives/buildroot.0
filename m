From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon,  8 Sep 2008 00:26:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20080908072613.10FA93C681@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-08 00:26:12 -0700 (Mon, 08 Sep 2008)
New Revision: 23359

Log:
Keep /usr/bin/python2.4 and make /usr/bin/python a link to it



Modified:
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-09-07 23:22:08 UTC (rev 23358)
+++ trunk/buildroot/package/python/python.mk	2008-09-08 07:26:12 UTC (rev 23359)
@@ -132,7 +132,8 @@
 		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen && \
-	rm $(TARGET_DIR)/usr/bin/python?.? && \
+	rm $(TARGET_DIR)/usr/bin/python && \
+	ln -s python$(PYTHON_VERSION_SHORT) $(TARGET_DIR)/usr/bin/python && \
 	rm $(TARGET_DIR)/usr/bin/idle && \
 	rm $(TARGET_DIR)/usr/bin/pydoc && \
 	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
