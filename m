From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Fri, 21 Sep 2018 16:58:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] libxslt: point to the correct
 xml2-config location
Message-ID: <20180921145836.30424-1-ferdinand@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently libxslt configure finds native /usr/bin/xml2-config.

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
---
Changes v1 -> v2:
  - Title format change (requested by Thomas).
  - Drop the unneeded host changes.
---
 package/libxslt/libxslt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 972d5b80d5..5b1c0ae268 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -13,7 +13,8 @@ LIBXSLT_LICENSE_FILES = COPYING
 LIBXSLT_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-debug \
-	--without-python
+	--without-python \
+	--with-libxml-prefix=$(STAGING_DIR)/usr
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = host-pkgconf libxml2
 
-- 
2.19.0
