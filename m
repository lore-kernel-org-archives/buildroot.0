From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 07:40:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070812144017.D6BC4A659D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 07:40:16 -0700 (Sun, 12 Aug 2007)
New Revision: 19463

Log:
Make DirectFB buildable by removing sysfs, enabling sdl

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-08-12 14:13:39 UTC (rev 19462)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-08-12 14:40:16 UTC (rev 19463)
@@ -43,20 +43,21 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-gfxdrivers=cle266,unichrome \
+		--enable-shared \
 		--enable-jpeg \
 		--enable-png \
 		--enable-linux-input \
 		--enable-zlib \
 		--enable-freetype \
-		--enable-sysfs \
-		--disable-sdl \
+		--disable-sysfs \
+		--enable-sdl \
 		--disable-video4linux \
 		--disable-video4linux2 \
 		--disable-fusion );
 	touch $(DIRECTFB_DIR)/.configured
 
 $(DIRECTFB_DIR)/.compiled: $(DIRECTFB_DIR)/.configured
-	$(MAKE) -C $(DIRECTFB_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DIRECTFB_DIR)
 	touch $(DIRECTFB_DIR)/.compiled
 
 $(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
