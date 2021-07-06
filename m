From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:49 +0200
Subject: [Buildroot] [PATCH v2 06/18] package/apache: move
 APACHE_FIXUP_APR_LIBTOOL to post-prepare hook
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-7-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

APACHE_FIXUP_APR_LIBTOOL tweaks files for per package directory build.
This is typically the kind of operation expected to be in
post-prepare hook.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 to v2:
 - Renamed <PKG>_PER_PACKAGE_TWEAK_HOOKS to <PKG>_POST_PREPARE_HOOKS
 - Added 'Reviewed-by: Yann E. MORIN'

 package/apache/apache.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 7dbd1a4512..dc66cd660e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -23,7 +23,7 @@ define APACHE_FIXUP_APR_LIBTOOL
 	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
 		$(STAGING_DIR)/usr/build-1/libtool
 endef
-APACHE_POST_CONFIGURE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
+APACHE_POST_PREPARE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
 endif
 
 APACHE_CONF_ENV= \
-- 
2.31.1
