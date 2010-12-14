From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Dec 2010 16:05:58 -0300
Subject: [Buildroot] [PATCH 02/13] php: libgmp was renamed to gmp
In-Reply-To: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292353569-30172-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
index af4fa29..f3ed0f1 100644
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
