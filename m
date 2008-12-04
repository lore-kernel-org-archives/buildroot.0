From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  4 Dec 2008 08:10:07 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-utils
Message-ID: <20081204161007.3C4033C6BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-04 08:10:06 -0800 (Thu, 04 Dec 2008)
New Revision: 24270

Log:
alsa-utils: add dependency to libintl if libintl is enabled

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk	2008-12-04 15:49:26 UTC (rev 24269)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk	2008-12-04 16:10:06 UTC (rev 24270)
@@ -71,7 +71,7 @@
 	fi
 	touch -c $@
 
-alsa-utils: uclibc alsa-lib ncurses $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
+alsa-utils: uclibc alsa-lib ncurses $(if $(BR2_PACKAGE_LIBINTL),libintl) $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
 
 alsa-utils-source: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
 
