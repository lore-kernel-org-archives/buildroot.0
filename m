From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 10:52:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/libidn: add LIBIDN_CPE_ID_VENDOR
Message-ID: <20210516085201.3763389-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:libidn is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alibidn

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn/libidn.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 2df3437029..c49bbe098e 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -12,6 +12,7 @@ LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
 LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
+LIBIDN_CPE_ID_VENDOR = gnu
 
 define LIBIDN_REMOVE_BINARY
 	rm -f $(TARGET_DIR)/usr/bin/idn
-- 
2.30.2
