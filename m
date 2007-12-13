From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 13 Dec 2007 04:22:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/stunnel
Message-ID: <20071213122226.225521200F1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-13 04:22:26 -0800 (Thu, 13 Dec 2007)
New Revision: 20648

Log:
make stunnel see OpenSSL libs

Modified:
   trunk/buildroot/package/stunnel/stunnel.mk


Changeset:
Modified: trunk/buildroot/package/stunnel/stunnel.mk
===================================================================
--- trunk/buildroot/package/stunnel/stunnel.mk	2007-12-13 12:15:48 UTC (rev 20647)
+++ trunk/buildroot/package/stunnel/stunnel.mk	2007-12-13 12:22:26 UTC (rev 20648)
@@ -44,7 +44,7 @@
 		--infodir=/usr/info \
 		--with-random=/dev/urandom \
 		--disable-libwrap \
-		--with-ssl=$(STAGING_DIR) \
+		--with-ssl=$(STAGING_DIR)/usr/ \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	)
