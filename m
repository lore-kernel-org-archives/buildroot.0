From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2021 23:03:39 +0100
Subject: [Buildroot] [git commit] package/libgcrypt: drop
 LIBGCRYPT_DISABLE_TESTS
Message-ID: <20210121214424.13B6A863FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b251b57f083a48bfc12fcb0ede4baa3f00a91498
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop LIBGCRYPT_DISABLE_TESTS which is not needed since commit
ef79770dcd4337e52725c43922b2fb2dbeda43b8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
