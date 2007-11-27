From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 27 Nov 2007 13:44:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
Message-ID: <20071127214456.A5F463006B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-27 13:44:55 -0800 (Tue, 27 Nov 2007)
New Revision: 20554

Log:
libmad $(MAKE) should be run with full configure environment

Modified:
   trunk/buildroot/package/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-11-27 21:40:57 UTC (rev 20553)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-11-27 21:44:55 UTC (rev 20554)
@@ -40,7 +40,7 @@
 
 $(LIBMAD_DIR)/libmad.la: $(LIBMAD_DIR)/.configured
 	rm -f $@
-	$(MAKE) -C $(LIBMAD_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBMAD_DIR)
 
 $(STAGING_DIR)/usr/lib/libmad.so.0: $(LIBMAD_DIR)/libmad.la
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBMAD_DIR) install
