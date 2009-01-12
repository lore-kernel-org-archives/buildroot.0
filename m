From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 12 Jan 2009 07:40:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090112074014.90A93766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-12 07:40:08 +0000 (Mon, 12 Jan 2009)
New Revision: 24780

Log:
Disable use of python in alsa-lib, if not configured

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-12 07:28:50 UTC (rev 24779)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-12 07:40:08 UTC (rev 24780)
@@ -19,6 +19,8 @@
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 ALSA_LIB_CONFIGURE_OPTS += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
+else
+ALSA_LIB_CONFIGURE_OPTS += --disable-python
 endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
