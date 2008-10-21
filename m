From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 21 Oct 2008 05:24:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/atk
Message-ID: <20081021122413.5A24D3C69C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-10-21 05:24:12 -0700 (Tue, 21 Oct 2008)
New Revision: 23751

Log:
package/atk/atk.mk: Bounce version 

Bounce version to 1.22.0

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/atk/atk.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2008-10-21 08:56:26 UTC (rev 23750)
+++ trunk/buildroot/package/atk/atk.mk	2008-10-21 12:24:12 UTC (rev 23751)
@@ -3,10 +3,9 @@
 # atk
 #
 #############################################################
-ATK_VERSION = 1.9.1
+ATK_VERSION = 1.22.0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.bz2
-ATK_SITE = ftp://ftp.gtk.org/pub/gtk/v2.10/dependencies
-ATK_AUTORECONF = NO
+ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/1.22/
 ATK_INSTALL_STAGING = YES
 ATK_INSTALL_TARGET = YES
 ATK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
@@ -45,7 +44,7 @@
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
 ATK_CONF_OPT_X = --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib
+		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
 else
 ATK_CONF_OPT_X = --without-x
 endif
