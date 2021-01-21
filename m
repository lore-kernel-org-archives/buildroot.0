From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 21 Jan 2021 21:43:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/libgcrypt: drop
 LIBGCRYPT_DISABLE_TESTS
Message-ID: <20210121204357.2359264-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop LIBGCRYPT_DISABLE_TESTS which is not needed since commit
ef79770dcd4337e52725c43922b2fb2dbeda43b8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgcrypt/libgcrypt.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 7146b3aa95..170c4946b0 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -31,11 +31,4 @@ ifeq ($(BR2_arm),y)
 LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
 endif
 
-# Tests use fork()
-define LIBGCRYPT_DISABLE_TESTS
-	$(SED) 's/ tests//' $(@D)/Makefile.in
-endef
-
-LIBGCRYPT_POST_PATCH_HOOKS += LIBGCRYPT_DISABLE_TESTS
-
 $(eval $(autotools-package))
-- 
2.29.2
