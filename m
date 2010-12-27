From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Dec 2010 22:50:18 +0100
Subject: [Buildroot] [git commit master 1/1] php: libgmp was renamed to gmp
Message-ID: <20101227222051.7D9798EB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eb8390d66f487559828058a47414617632afb1f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/Config.ext |    2 +-
 package/php/php.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 5c7f5ea..4f1614e 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -77,7 +77,7 @@ comment "gettext support requires a toolchain with WCHAR support"
 
 config BR2_PACKAGE_PHP_EXT_GMP
 	bool "gmp"
-	select BR2_PACKAGE_LIBGMP
+	select BR2_PACKAGE_GMP
 	help
 	  GMP support
 
diff --git a/package/php/php.mk b/package/php/php.mk
index 4db2b84..36b105d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -89,7 +89,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
 	PHP_CONF_OPT += --with-gmp=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += libgmp
+	PHP_DEPENDENCIES += gmp
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_JSON),y)
-- 
1.7.2.2
