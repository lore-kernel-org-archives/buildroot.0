From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  7 Feb 2009 06:57:29 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090207065730.2747F76275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-07 06:57:29 +0000 (Sat, 07 Feb 2009)
New Revision: 25259

Log:
alsa-lib: make python option depend on python

As discussed on the list.

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/Config.in	2009-02-06 17:38:05 UTC (rev 25258)
+++ trunk/buildroot/package/multimedia/alsa-lib/Config.in	2009-02-07 06:57:29 UTC (rev 25259)
@@ -9,7 +9,7 @@
 config BR2_PACKAGE_ALSA_LIB_PYTHON
 	bool "Python support for alsa-lib"
 	depends on BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON
 	help
 	  Add python support for alsa-lib.
 	  Python will be built and libpython will be installed
