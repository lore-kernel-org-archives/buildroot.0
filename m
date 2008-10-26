From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 02:14:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/docker
Message-ID: <20081026091407.0E2C4F800F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-26 02:14:06 -0700 (Sun, 26 Oct 2008)
New Revision: 23796

Log:
docker: s/PKGCONFIG/PKG_CONFIG/ to be consistent

Patch by Markus Heidelberg.

Modified:
   trunk/buildroot/package/docker/docker-1.5-pkgconfig.patch
   trunk/buildroot/package/docker/docker.mk


Changeset:
Modified: trunk/buildroot/package/docker/docker-1.5-pkgconfig.patch
===================================================================
--- trunk/buildroot/package/docker/docker-1.5-pkgconfig.patch	2008-10-26 09:14:02 UTC (rev 23795)
+++ trunk/buildroot/package/docker/docker-1.5-pkgconfig.patch	2008-10-26 09:14:06 UTC (rev 23796)
@@ -13,11 +13,11 @@
  $(target): $(sources:.c=.o)
  	$(CC) $(CFLAGS) -L$(XLIBPATH) -lX11 \
 -		`pkg-config --libs glib-2.0` $^ -o $@
-+		`$(PKGCONFIG) --libs glib-2.0` $^ -o $@
++		`$(PKG_CONFIG) --libs glib-2.0` $^ -o $@
  
  %.o: %.c
 -	$(CC) -c $(CFLAGS) `pkg-config --cflags glib-2.0` $<
-+	$(CC) -c $(CFLAGS) `$(PKGCONFIG) --cflags glib-2.0` $<
++	$(CC) -c $(CFLAGS) `$(PKG_CONFIG) --cflags glib-2.0` $<
  
  version.h: version.h.in Makefile
  	sed -e "s/@VERSION@/$(VERSION)/" version.h.in > $@

Modified: trunk/buildroot/package/docker/docker.mk
===================================================================
--- trunk/buildroot/package/docker/docker.mk	2008-10-26 09:14:02 UTC (rev 23795)
+++ trunk/buildroot/package/docker/docker.mk	2008-10-26 09:14:06 UTC (rev 23796)
@@ -14,6 +14,7 @@
 					CFLAGS="-I$(STAGING_DIR)/usr/include \
 						-I$(STAGING_DIR)/usr/include/glib-2.0 \
 						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
+					PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
