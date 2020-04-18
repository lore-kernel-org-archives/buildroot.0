From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Sat, 18 Apr 2020 11:03:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/php: fix zip support
Message-ID: <20200418090343.140078-1-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since php7.4, --enable-zip becomes --with-zip due to
migration to pkg-config.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 91f82dbf31..8282bb1cc7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -113,7 +113,7 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_SYSVMSG),--enable-sysvmsg) \
 	$(if $(BR2_PACKAGE_PHP_EXT_SYSVSEM),--enable-sysvsem) \
 	$(if $(BR2_PACKAGE_PHP_EXT_SYSVSHM),--enable-sysvshm) \
-	$(if $(BR2_PACKAGE_PHP_EXT_ZIP),--enable-zip) \
+	$(if $(BR2_PACKAGE_PHP_EXT_ZIP),--with-zip) \
 	$(if $(BR2_PACKAGE_PHP_EXT_CTYPE),--enable-ctype) \
 	$(if $(BR2_PACKAGE_PHP_EXT_FILTER),--enable-filter) \
 	$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
-- 
2.26.0
