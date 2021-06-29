From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 29 Jun 2021 09:50:52 -0700
Subject: [Buildroot] [PATCH 09/11] package/php-geoip: add php8 build support
In-Reply-To: <20210629165054.3831930-1-aduskett@gmail.com>
References: <20210629165054.3831930-1-aduskett@gmail.com>
Message-ID: <20210629165054.3831930-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that allows php-geoip to compile against php8.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-add-build-support-for-php8.patch     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/php-geoip/0001-add-build-support-for-php8.patch

diff --git a/package/php-geoip/0001-add-build-support-for-php8.patch b/package/php-geoip/0001-add-build-support-for-php8.patch
new file mode 100644
index 0000000000..5672b00ce8
--- /dev/null
+++ b/package/php-geoip/0001-add-build-support-for-php8.patch
@@ -0,0 +1,35 @@
+From 9500f9964a1ef03890376c61f1b17db88753c8e2 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 28 Jun 2021 12:24:59 -0700
+Subject: [PATCH] add build support for php8
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ php_geoip.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/php_geoip.h b/php_geoip.h
+index 2f67cb6..d19d612 100644
+--- a/php_geoip.h
++++ b/php_geoip.h
+@@ -30,6 +30,17 @@ extern zend_module_entry geoip_module_entry;
+ typedef long zend_long;
+ #endif
+ 
++/* Small change to let it build after a major internal change for php8.0
++ * More info:
++ * https://github.com/php/php-src/blob/php-8.0.0/UPGRADING.INTERNALS#L47
++ */
++#if PHP_MAJOR_VERSION >= 8
++# define TSRMLS_DC
++# define TSRMLS_D
++# define TSRMLS_CC
++# define TSRMLS_C
++# endif
++
+ #ifdef PHP_WIN32
+ #define PHP_GEOIP_API __declspec(dllexport)
+ #else
+-- 
+2.31.1
+
-- 
2.31.1
