From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon,  1 Sep 2008 17:54:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20080902005450.098BF3C685@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-01 17:54:49 -0700 (Mon, 01 Sep 2008)
New Revision: 23300

Log:
Update to Python 2.4.5 (latest patch rev of 2.4)
Remove the test suite before building, else it will fail to compile depending on what modules have been configured.


Modified:
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-09-01 21:16:35 UTC (rev 23299)
+++ trunk/buildroot/package/python/python.mk	2008-09-02 00:54:49 UTC (rev 23300)
@@ -3,7 +3,7 @@
 # python
 #
 #############################################################
-PYTHON_VERSION=2.4.2
+PYTHON_VERSION=2.4.5
 PYTHON_VERSION_SHORT=2.4
 PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
@@ -124,6 +124,7 @@
 ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
 	export PYTHON_DISABLE_SSL=1
 endif
+	rm -rf $(PYTHON_DIR)/Lib/test
 	LD_LIBRARY_PATH=$(STAGING_DIR)/lib
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) install \
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
