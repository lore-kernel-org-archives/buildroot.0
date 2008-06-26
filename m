From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Jun 2008 07:04:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/matchbox
Message-ID: <20080626140434.3D8093C651@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-26 07:04:30 -0700 (Thu, 26 Jun 2008)
New Revision: 22518

Log:
matchbox: depend on libXext at configure time


Modified:
   trunk/buildroot/package/matchbox/matchbox.mk


Changeset:
Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2008-06-26 11:43:02 UTC (rev 22517)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2008-06-26 14:04:30 UTC (rev 22518)
@@ -211,7 +211,7 @@
 endif
 
 
-$(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked
+$(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked xlib_libXext-install-staging
 	(cd $(MATCHBOX_LIB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
