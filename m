From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 19 Sep 2015 23:33:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/liblinear: bump to version 2.01
Message-ID: <1442698430-18748-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/liblinear/liblinear.hash | 2 +-
 package/liblinear/liblinear.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 8a335cc..1c5b184 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0ab97ca81c62457fcfe78f56619a7b2f70c1f7c875b4101827343555b4f6c3f4	liblinear-1.96.tar.gz
+sha256	ebc71999224f5779574b11e248f1e2ef647b5d839c0380c1c5a4ac8789aa95a9  liblinear-2.01.tar.gz
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index d712b95..80ba489 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 1.96
+LIBLINEAR_VERSION = 2.01
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3c
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
@@ -14,8 +14,8 @@ LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 # $1: destination directory
 define LIBLINEAR_INSTALL_SHARED
-	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.2 $(1)/usr/lib/liblinear.so.2
-	ln -sf liblinear.so.2 $(1)/usr/lib/liblinear.so
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.3 $(1)/usr/lib/liblinear.so.3
+	ln -sf liblinear.so.3 $(1)/usr/lib/liblinear.so
 endef
 LIBLINEAR_CFLAGS += -fPIC
 endif
-- 
2.5.3
