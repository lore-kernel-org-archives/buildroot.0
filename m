From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 06:16:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20080630131623.A33A53C669@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 06:16:18 -0700 (Mon, 30 Jun 2008)
New Revision: 22571

Log:
libxml: fix compilation without large file support


Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2008-06-30 13:16:00 UTC (rev 22570)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2008-06-30 13:16:18 UTC (rev 22571)
@@ -11,6 +11,10 @@
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_INSTALL_TARGET = YES
 
+ifneq ($(BR2_LARGEFILE),y)
+LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
+endif
+
 LIBXML2_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
 		--exec-prefix=/usr --bindir=/usr/bin \
