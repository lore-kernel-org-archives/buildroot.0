From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 14:49:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/squid: add SQUID_CPE_ID_VENDOR
Message-ID: <20210130134937.2368713-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:squid-cache:squid is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asquid-cache%3Asquid

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/squid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 1ba375e547..473af2ac12 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -9,6 +9,7 @@ SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
+SQUID_CPE_ID_VENDOR = squid-cache
 SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.29.2
