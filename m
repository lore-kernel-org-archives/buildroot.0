From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Apr 2013 16:42:06 +0200
Subject: [Buildroot] [git commit] php: fix libxml2 build failure
Message-ID: <20130426144238.11F929B857@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e08e72d7d1c9f1482217e07255f874187bb5dc63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libxml2 build test uses the PHP_TEST_BUILD macro which in turn uses
AC_TRY_RUN which is bad for cross compilations.
Force php_cv_libxml_build_works to yes when libxml2 is selected. Fixes:
http://autobuild.buildroot.net/results/8b45a1260ab6ae15dc59a5d6b5b98698ec3e7bbe/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ba428a6..2a452d1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -66,6 +66,7 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
+	PHP_CONF_ENV += php_cv_libxml_build_works=yes
 	PHP_CONF_OPT += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
 	PHP_DEPENDENCIES += libxml2
 endif
