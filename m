From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sun, 27 Apr 2008 02:51:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rpm
Message-ID: <20080427095133.504A83C6E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-27 02:51:32 -0700 (Sun, 27 Apr 2008)
New Revision: 21875

Log:
* Bump to 5.1.0
* Use fnctl for locking


Modified:
   trunk/buildroot/package/rpm/rpm.mk


Changeset:
Modified: trunk/buildroot/package/rpm/rpm.mk
===================================================================
--- trunk/buildroot/package/rpm/rpm.mk	2008-04-27 03:33:29 UTC (rev 21874)
+++ trunk/buildroot/package/rpm/rpm.mk	2008-04-27 09:51:32 UTC (rev 21875)
@@ -3,7 +3,7 @@
 # rpm
 #
 #############################################################
-RPM_VERSION = 5.0.3
+RPM_VERSION = 5.1.0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-5.0/
 RPM_AUTORECONF = YES
 
@@ -18,7 +18,7 @@
 	--with-zlib=$(STAGING_DIR) \
 	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=$(STAGING_DIR) \
-	--disable-mutexsupport \
+	--with-mutex=UNIX/fcntl \
 	$(DISABLE_NLS)
 
 RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
