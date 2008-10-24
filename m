From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 25 Oct 2008 01:09:44 +0200
Subject: [Buildroot] [PATCH] docker: s/PKGCONFIG/PKG_CONFIG/ to be consistent
Message-ID: <200810250109.44430.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/docker/docker-1.5-pkgconfig.patch |    4 ++--
 package/docker/docker.mk                  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker/docker-1.5-pkgconfig.patch b/package/docker/docker-1.5-pkgconfig.patch
index cba4d81..1b56b1b 100644
--- a/package/docker/docker-1.5-pkgconfig.patch
+++ b/package/docker/docker-1.5-pkgconfig.patch
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
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 78137cc..1e41ea9 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -15,7 +15,7 @@ DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
 						-I$(STAGING_DIR)/usr/include/glib-2.0 \
 						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
 					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
-					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+					PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 					PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 					PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 
-- 
1.5.6.4
