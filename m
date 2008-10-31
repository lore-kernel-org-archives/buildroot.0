From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 31 Oct 2008 07:04:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lite
Message-ID: <20081031140431.E55863C75F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-10-31 07:04:31 -0700 (Fri, 31 Oct 2008)
New Revision: 23882

Log:
package/lite/lite.mk: Bounce version

Bounce version.

Signed-off-by: Thomas Petazzoni<>
Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/lite/lite.mk


Changeset:
Modified: trunk/buildroot/package/lite/lite.mk
===================================================================
--- trunk/buildroot/package/lite/lite.mk	2008-10-31 12:41:02 UTC (rev 23881)
+++ trunk/buildroot/package/lite/lite.mk	2008-10-31 14:04:31 UTC (rev 23882)
@@ -3,15 +3,13 @@
 # LiTE
 #
 #############################################################
-LITE_VERSION:=0.8.9
+LITE_VERSION:=0.8.10
 LITE_SOURCE:=LiTE-$(LITE_VERSION).tar.gz
 LITE_SITE:=http://www.directfb.org/downloads/Libs
-LITE_AUTORECONF = NO
 LITE_INSTALL_STAGING = YES
 LITE_INSTALL_TARGET = YES
 LITE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
-LITE_CONF_OPT =
 LITE_DEPENDENCIES = directfb
 
 $(eval $(call AUTOTARGETS,package,lite))
