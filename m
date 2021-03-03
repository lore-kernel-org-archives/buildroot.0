From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 15:40:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/stunnel: add STUNNEL_CPE_ID_VENDOR
Message-ID: <20210303144025.500853-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:stunnel:stunnel is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astunnel%3Astunnel

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stunnel/stunnel.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index e0cc5630e4..51cb4a4db4 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -15,6 +15,7 @@ STUNNEL_CONF_ENV = \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 STUNNEL_LICENSE = GPL-2.0+
 STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
+STUNNEL_CPE_ID_VENDOR = stunnel
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 STUNNEL_DEPENDENCIES += systemd
-- 
2.30.0
