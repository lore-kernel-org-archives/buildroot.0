From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat,  3 Jan 2009 08:04:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rsync
Message-ID: <20090103080422.489B676BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-03 08:04:21 +0000 (Sat, 03 Jan 2009)
New Revision: 24664

Log:
rsync doesn't support install-exec, override RSYNC_INSTALL_TARGET_OPT to install non-stripped


Modified:
   trunk/buildroot/package/rsync/rsync.mk


Changeset:
Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2009-01-03 01:06:36 UTC (rev 24663)
+++ trunk/buildroot/package/rsync/rsync.mk	2009-01-03 08:04:21 UTC (rev 24664)
@@ -10,8 +10,11 @@
 RSYNC_AUTORECONF:=no
 RSYNC_INSTALL_STAGING:=NO
 RSYNC_INSTALL_TARGET:=YES
-ifeq ($(BR2_ENABLE_DEBUG),)
+ifeq ($(BR2_ENABLE_DEBUG),y)
 RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
+			  install
+else
+RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
 			  STRIPPROG="$(TARGET_STRIP)" install-strip
 endif
 RSYNC_CONF_OPT:=--with-included-popt
