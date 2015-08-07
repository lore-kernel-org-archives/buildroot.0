From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  8 Aug 2015 00:47:18 +0200
Subject: [Buildroot] [PATCH 6/7] package/libgpgme: add argp-standalone
	dependency with musl
In-Reply-To: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
References: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438987639-30593-6-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since argp-standalone is only available for uClibc-ng
and musl toolchains, it's safe to link with it when
the package is selected.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libgpgme/libgpgme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index ec64d37..1868099 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -22,7 +22,7 @@ LIBGPGME_CONF_OPTS = --with-gpg=/usr/bin/gpg \
 	--disable-gpg-test
 
 # Handle argp-standalone or it errors out during build
-ifeq ($(BR2_PACKAGE_ARGP_STANDALONE)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBGPGME_CONF_ENV += LIBS="-largp"
 LIBGPGME_DEPENDENCIES += argp-standalone
 endif
-- 
2.4.3
