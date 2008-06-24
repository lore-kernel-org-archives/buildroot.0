From: correa at uclibc.org <correa@uclibc.org>
Date: Tue, 24 Jun 2008 15:52:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rdesktop
Message-ID: <20080624225214.BA75A3C5FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-06-24 15:52:14 -0700 (Tue, 24 Jun 2008)
New Revision: 22495

Log:
Fix rdesktop build

Modified:
   trunk/buildroot/package/rdesktop/rdesktop.mk


Changeset:
Modified: trunk/buildroot/package/rdesktop/rdesktop.mk
===================================================================
--- trunk/buildroot/package/rdesktop/rdesktop.mk	2008-06-24 21:39:32 UTC (rev 22494)
+++ trunk/buildroot/package/rdesktop/rdesktop.mk	2008-06-24 22:52:14 UTC (rev 22495)
@@ -27,7 +27,7 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--with-openssl=$(STAGING_DIR) \
+		--with-openssl=$(STAGING_DIR)/usr \
 		--sysconfdir=/etc \
 	)
 	touch $(RDESKTOP_DIR)/.configured
