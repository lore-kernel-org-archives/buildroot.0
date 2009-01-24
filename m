From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 24 Jan 2009 06:25:40 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdnet
Message-ID: <20090124062541.12788769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-24 06:25:40 +0000 (Sat, 24 Jan 2009)
New Revision: 24994

Log:
Make sure libdnet does not find unsupported libcheck, in host

Modified:
   trunk/buildroot/package/libdnet/libdnet.mk


Changeset:
Modified: trunk/buildroot/package/libdnet/libdnet.mk
===================================================================
--- trunk/buildroot/package/libdnet/libdnet.mk	2009-01-23 23:03:25 UTC (rev 24993)
+++ trunk/buildroot/package/libdnet/libdnet.mk	2009-01-24 06:25:40 UTC (rev 24994)
@@ -10,7 +10,12 @@
 LIBDNET_INSTALL_STAGING = YES
 LIBDNET_INSTALL_TARGET = YES
 LIBDNET_AUTORECONF = YES
-LIBDNET_CONF_OPT = --with-gnu-ld --enable-shared --enable-static
+LIBDNET_CONF_OPT = \
+	--with-gnu-ld \
+	--enable-shared \
+	--enable-static \
+	--with-check=no
+
 LIBDNET_DEPENDENCIES = uclibc
 
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
