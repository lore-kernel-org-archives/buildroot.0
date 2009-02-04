From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Feb 2009 23:15:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090204231543.ADEC676273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-04 23:15:42 +0000 (Wed, 04 Feb 2009)
New Revision: 25238

Log:
alsa-lib: fix with with BR2_PACKAGE_ALSA_LIB_PYTHON

Tell it where to find the python headers.

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-02-04 13:42:40 UTC (rev 25237)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-02-04 23:15:42 UTC (rev 25238)
@@ -23,6 +23,7 @@
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONFIGURE_OPTS += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
+ALSA_LIB_CFLAGS+=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_DEPS = libpython
 else
 ALSA_LIB_CONFIGURE_OPTS += --disable-python
