From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 23:28:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/wavpack: set WAVPACK_CPE_ID_VENDOR
Message-ID: <20210111222808.1418024-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:wavpack:wavpack is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awavpack%3Awavpack

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wavpack/wavpack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 6403f93ac9..586082fdd6 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -12,6 +12,7 @@ WAVPACK_INSTALL_STAGING = YES
 WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 WAVPACK_LICENSE = BSD-3-Clause
 WAVPACK_LICENSE_FILES = COPYING
+WAVPACK_CPE_ID_VENDOR = $(WAVPACK_NAME)
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
-- 
2.29.2
