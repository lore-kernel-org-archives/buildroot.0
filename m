From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 May 2017 18:27:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/sngrep: add libgcrypt missing
	dependencies
Message-ID: <20170520162751.30809-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even if libgcrypt is selected at Kconfig level, it's missing from
Makefile level.

Fixes:
http://autobuild.buildroot.net/results/36c/36c28e7e49b31ed2398a67db2e9b08e3aad5a3ee

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/sngrep/sngrep.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 74b05b1..7ae271f 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -23,7 +23,7 @@ SNGREP_DEPENDENCIES += openssl
 SNGREP_CONF_OPTS += --with-openssl --without-gnutls
 # gnutls support also requires libgcrypt
 else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-SNGREP_DEPENDENCIES += gnutls
+SNGREP_DEPENDENCIES += gnutls libgcrypt
 SNGREP_CONF_OPTS += --with-gnutls --without-openssl
 else
 SNGREP_CONF_OPTS += --without-gnutls --without-openssl
-- 
2.9.4
