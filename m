From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:45:02 +0200
Subject: [Buildroot] [git commit] php: remove redundant --static flag to
	pkg-config
Message-ID: <20150726214549.5C53081DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ccde01652bc41da325bf4c9a5abbf0031080784
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
from package .mk files.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 39f4e2a..4b171cf 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -116,7 +116,7 @@ PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += openssl
 # openssl needs zlib, but the configure script forgets to link against
 # it causing detection failures with static linking
-PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static openssl`
+PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
@@ -187,7 +187,7 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += sqlite
-PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static sqlite3`
+PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs sqlite3`
 endif
 
 ### PDO
