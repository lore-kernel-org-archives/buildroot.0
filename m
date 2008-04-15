From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Tue, 15 Apr 2008 01:25:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rpm
Message-ID: <20080415082533.2284B3C53D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-15 01:25:32 -0700 (Tue, 15 Apr 2008)
New Revision: 21737

Log:
* Disable DB3 mutexes in rpm, this caused a segfault after a "Function Not Implemented" error


Modified:
   trunk/buildroot/package/rpm/rpm.mk


Changeset:
Modified: trunk/buildroot/package/rpm/rpm.mk
===================================================================
--- trunk/buildroot/package/rpm/rpm.mk	2008-04-15 08:23:19 UTC (rev 21736)
+++ trunk/buildroot/package/rpm/rpm.mk	2008-04-15 08:25:32 UTC (rev 21737)
@@ -18,6 +18,7 @@
 	--with-zlib=$(STAGING_DIR) \
 	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=$(STAGING_DIR) \
+	--disable-mutexsupport \
 	$(DISABLE_NLS)
 
 RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
