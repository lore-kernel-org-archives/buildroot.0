From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 30 May 2015 00:00:52 -0400
Subject: [Buildroot] [PATCH] libgcrypt: allow optimization
Message-ID: <1432958452-22626-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the --disable-optimization option, which makes the libgcrypt
configure remove buildroot's optimation setting passed in from CFLAGS.
---
 package/libgcrypt/libgcrypt.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 57c5ab1..9153fb8 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -16,7 +16,6 @@ LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
 LIBGCRYPT_CONF_OPTS = \
-	--disable-optimization \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
 # Code doesn't build in thumb mode
-- 
1.9.1
