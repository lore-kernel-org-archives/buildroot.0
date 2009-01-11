From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:10:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090111201057.88BDD76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:10:57 +0000 (Sun, 11 Jan 2009)
New Revision: 24754

Log:
Make sure alsa-lib build with correct python version

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-11 20:08:47 UTC (rev 24753)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-11 20:10:57 UTC (rev 24754)
@@ -17,6 +17,10 @@
 ALSA_LIB_ABI:=
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+ALSA_LIB_CONFIGURE_OPTS += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
+endif
+
 ifeq ($(BR2_SOFT_FLOAT),y)
 	SOFT_FLOAT=--with-softfloat
 endif
@@ -45,6 +49,7 @@
 		--enable-shared \
 		--enable-static \
 		--disable-docs \
+		$(ALSA_LIB_CONFIGURE_OPTS) \
 		$(SOFT_FLOAT) \
 		$(DISABLE_NLS) \
 	)
