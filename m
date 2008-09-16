From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 16 Sep 2008 13:57:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/findutils
Message-ID: <20080916205717.A156B3C8C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-16 13:57:17 -0700 (Tue, 16 Sep 2008)
New Revision: 23412

Log:
findutils: use install-strip for target install

Modified:
   trunk/buildroot/package/findutils/findutils.mk


Changeset:
Modified: trunk/buildroot/package/findutils/findutils.mk
===================================================================
--- trunk/buildroot/package/findutils/findutils.mk	2008-09-16 20:53:45 UTC (rev 23411)
+++ trunk/buildroot/package/findutils/findutils.mk	2008-09-16 20:57:17 UTC (rev 23412)
@@ -59,7 +59,7 @@
 		-o $(TARGET_DIR)/$(FINDUTILS_TARGET_BINARY) \
 		-ot $(FINDUTILS_DIR)/$(FINDUTILS_BINARY) ]; then \
 		set -x; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FINDUTILS_DIR) install; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FINDUTILS_DIR) install-strip; \
 		$(STRIPCMD) $(TARGET_DIR)/usr/lib/locate/* > /dev/null 2>&1; \
 	fi
 ifneq ($(BR2_HAVE_INFOPAGES),y)
