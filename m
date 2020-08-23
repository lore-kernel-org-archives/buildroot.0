From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 19:02:20 +0200
Subject: [Buildroot] [git commit] package/php: drop --with-libxml-dir
Message-ID: <20200823165655.28FDE7FC20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f3e2697379f78e5e3cd1fd19fea853bbea2abbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--with-libxml-dir has been dropped since version 7.4.0 and
https://github.com/php/php-src/commit/29d1b7fd521af288e9f04d784f59a2d15b494a30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 6e0b5c6e8d..ef9c7e8644 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -151,7 +151,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
 PHP_CONF_ENV += php_cv_libxml_build_works=yes
-PHP_CONF_OPTS += --with-libxml --with-libxml-dir=$(STAGING_DIR)/usr
+PHP_CONF_OPTS += --with-libxml
 PHP_DEPENDENCIES += libxml2
 endif
 
