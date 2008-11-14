From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 05:39:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lzo
Message-ID: <20081114133946.360FD3C941@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-14 05:39:46 -0800 (Fri, 14 Nov 2008)
New Revision: 24041

Log:
lzo: add $(DISABLE_LARGEFILE) to configure options

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/lzo/lzo.mk


Changeset:
Modified: trunk/buildroot/package/lzo/lzo.mk
===================================================================
--- trunk/buildroot/package/lzo/lzo.mk	2008-11-14 13:03:01 UTC (rev 24040)
+++ trunk/buildroot/package/lzo/lzo.mk	2008-11-14 13:39:46 UTC (rev 24041)
@@ -11,7 +11,7 @@
 LZO_INSTALL_TARGET = YES
 LZO_INSTALL_STAGING_OPT = CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) install
 LZO_CONF_ENV =
-LZO_CONF_OPT =
+LZO_CONF_OPT = $(DISABLE_LARGEFILE)
 LZO_DEPENDENCIES = uclibc
 
 $(eval $(call AUTOTARGETS,package,lzo))
