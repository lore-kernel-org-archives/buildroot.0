From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 21 Jun 2007 15:05:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pkgconfig
Message-ID: <20070621220539.0300B4864D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-21 15:05:39 -0700 (Thu, 21 Jun 2007)
New Revision: 18885

Log:
- use the correct path to the pkgconfig .pc


Modified:
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2007-06-21 16:58:36 UTC (rev 18884)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2007-06-21 22:05:39 UTC (rev 18885)
@@ -48,7 +48,7 @@
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) install
 	mv $(STAGING_DIR)/usr/bin/pkg-config $(STAGING_DIR)/usr/bin/pkg-config.real
 	cp package/pkgconfig/pkgconfig-filter.sh $(STAGING_DIR)/usr/bin/pkg-config
-	mkdir -p $(STAGING_DIR)/lib/pkgconfig
+	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
 	rm -rf $(STAGING_DIR)/share/locale $(STAGING_DIR)/usr/info \
 		$(STAGING_DIR)/usr/man $(STAGING_DIR)/usr/share/doc
 
