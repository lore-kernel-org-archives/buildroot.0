From: Herve Codina <herve.codina@bootlin.com>
Date: Mon, 21 Jun 2021 16:11:23 +0200
Subject: [Buildroot] [PATCH 08/15] package/apache: Move
 APACHE_FIXUP_APR_LIBTOOL to <PKG>_PER_PACKAGE_TWEAK_HOOKS
In-Reply-To: <20210621141130.48654-1-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
Message-ID: <20210621141130.48654-9-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

APACHE_FIXUP_APR_LIBTOOL tweaks files for per package directory build.
This is typically the kind of operation expected to be in
<PKG>_PER_PACKAGE_TWEAK_HOOKS

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 package/apache/apache.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 7dbd1a4512..f496333174 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -23,7 +23,7 @@ define APACHE_FIXUP_APR_LIBTOOL
 	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
 		$(STAGING_DIR)/usr/build-1/libtool
 endef
-APACHE_POST_CONFIGURE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
+APACHE_PER_PACKAGE_TWEAK_HOOKS += APACHE_FIXUP_APR_LIBTOOL
 endif
 
 APACHE_CONF_ENV= \
-- 
2.31.1
