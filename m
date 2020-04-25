From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Apr 2020 00:31:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libarchive: add mbedtls support
Message-ID: <20200425223153.1546816-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libarchive/libarchive.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 89eeffe92e..4aabbea560 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -9,7 +9,6 @@ LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
-LIBARCHIVE_CONF_OPTS = --without-mbedtls
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -92,6 +91,13 @@ else
 LIBARCHIVE_CONF_OPTS += --without-lzo2
 endif
 
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBARCHIVE_DEPENDENCIES += mbedtls
+LIBARCHIVE_CONF_OPTS += --with-mbedtls
+else
+LIBARCHIVE_CONF_OPTS += --without-mbedtls
+endif
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 LIBARCHIVE_DEPENDENCIES += nettle
 LIBARCHIVE_CONF_OPTS += --with-nettle
-- 
2.25.1
