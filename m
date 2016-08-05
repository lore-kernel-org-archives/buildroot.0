From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Aug 2016 09:16:45 +0200
Subject: [Buildroot] [git commit] libgcrypt: disable assembly for coldfire
Message-ID: <20160805071803.85F32818DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e60f2d7735040a1dd83a9477f328d763ac987625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/374/374158bb0a0e6a16af5d0b909cd05ec52812aaa3/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 5eb54a4..5ee488d 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -18,6 +18,11 @@ LIBGCRYPT_CONF_ENV = \
 LIBGCRYPT_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
+# Libgcrypt doesn't support assembly for coldfire
+ifeq ($(BR2_m68k_cf),y)
+LIBGCRYPT_CONF_OPTS += --disable-asm
+endif
+
 # Code doesn't build in thumb mode
 ifeq ($(BR2_arm),y)
 LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
