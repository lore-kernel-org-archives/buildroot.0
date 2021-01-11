From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 21:49:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtomcrypt: add
 LIBTOMCRYPT_CPE_ID_VENDOR
Message-ID: <20210111204942.1416678-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libtom:libtomcrypt is indeed the right CPE identifier
for this package, as can be seen from:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtom%3Alibtomcrypt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtomcrypt/libtomcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index c2f1babb49..fccd4b051c 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -9,6 +9,7 @@ LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/v$(LI
 LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.xz
 LIBTOMCRYPT_LICENSE = WTFPL
 LIBTOMCRYPT_LICENSE_FILES = LICENSE
+LIBTOMCRYPT_CPE_ID_VENDOR = libtom
 LIBTOMCRYPT_INSTALL_STAGING = YES
 LIBTOMCRYPT_INSTALL_TARGET = NO # only static library
 LIBTOMCRYPT_DEPENDENCIES = libtommath
-- 
2.29.2
