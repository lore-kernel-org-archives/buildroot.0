From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:12:21 +0200
Subject: [Buildroot] [git commit] php: use $() to reference make variables
 instead of ${}
Message-ID: <20180708101935.57BE7863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dba254cdf006e559ed61e1a136677843a3b4a94e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 4c3a87118e..028fa6fc55 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -137,7 +137,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
 PHP_CONF_ENV += php_cv_libxml_build_works=yes
-PHP_CONF_OPTS += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
+PHP_CONF_OPTS += --enable-libxml --with-libxml-dir=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += libxml2
 endif
 
