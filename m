From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 13:01:28 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090223130128.6034776564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-23 13:01:26 +0000 (Mon, 23 Feb 2009)
New Revision: 25427

Log:
alsa-lib: don't use versioned symbols

As reported by Dirk Vermaak and Daniel Mack. Fixes runtime issues with
alsa-lib, see
http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/014999.html
for details.

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-02-23 11:18:30 UTC (rev 25426)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-02-23 13:01:26 UTC (rev 25427)
@@ -57,6 +57,7 @@
 		--enable-shared \
 		--enable-static \
 		--disable-docs \
+		--without-versioned \
 		$(ALSA_LIB_CONFIGURE_OPTS) \
 		$(SOFT_FLOAT) \
 		$(DISABLE_NLS) \
