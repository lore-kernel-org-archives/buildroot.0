From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jan 2021 22:44:55 +0100
Subject: [Buildroot] [PATCH 1/2] package/socat: add SOCAT_CPE_ID_VENDOR
Message-ID: <20210127214456.3402995-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:dest-unreach:socat is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adest-unreach%3Asocat

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/socat/socat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 4bfdc18f91..aedc21c3e3 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -9,6 +9,7 @@ SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
 SOCAT_LICENSE_FILES = README COPYING COPYING.OpenSSL
+SOCAT_CPE_ID_VENDOR = dest-unreach
 
 ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 SOCAT_CONF_ENV += \
-- 
2.29.2
