From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 01:17:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gperf
Message-ID: <20080710081745.1AACB3C7AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 01:17:44 -0700 (Thu, 10 Jul 2008)
New Revision: 22739

Log:
gperf: don't install to staging dir

It doesn't make much sense to install the cross-gperf to staging dir.

Modified:
   trunk/buildroot/package/gperf/gperf.mk


Changeset:
Modified: trunk/buildroot/package/gperf/gperf.mk
===================================================================
--- trunk/buildroot/package/gperf/gperf.mk	2008-07-10 08:17:39 UTC (rev 22738)
+++ trunk/buildroot/package/gperf/gperf.mk	2008-07-10 08:17:44 UTC (rev 22739)
@@ -7,7 +7,7 @@
 GPERF_SOURCE = gperf-$(GPERF_VERSION).tar.gz
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_AUTORECONF = NO
-GPERF_INSTALL_STAGING = YES
+GPERF_INSTALL_STAGING = NO
 GPERF_INSTALL_TARGET = YES
 GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
