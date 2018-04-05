From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:37 +0200
Subject: [Buildroot] [PATCH 23/23] php: remove Blackfin patch
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-24-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And renumber remaining patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x.patch => 0006-Call-apxs-with-correct-prefix.patch} |  0
 package/php/0006-avoid-bfin-gcc-segfault.patch          | 17 -----------------
 ...p_ini.c-build-empty-php_load_zend_extension_c.patch} |  0
 3 files changed, 17 deletions(-)
 rename package/php/{0007-Call-apxs-with-correct-prefix.patch => 0006-Call-apxs-with-correct-prefix.patch} (100%)
 delete mode 100644 package/php/0006-avoid-bfin-gcc-segfault.patch
 rename package/php/{0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch => 0007-main-php_ini.c-build-empty-php_load_zend_extension_c.patch} (100%)

diff --git a/package/php/0007-Call-apxs-with-correct-prefix.patch b/package/php/0006-Call-apxs-with-correct-prefix.patch
similarity index 100%
rename from package/php/0007-Call-apxs-with-correct-prefix.patch
rename to package/php/0006-Call-apxs-with-correct-prefix.patch
diff --git a/package/php/0006-avoid-bfin-gcc-segfault.patch b/package/php/0006-avoid-bfin-gcc-segfault.patch
deleted file mode 100644
index 7f8cb24e7a..0000000000
--- a/package/php/0006-avoid-bfin-gcc-segfault.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Avoid gcc segmentation fault
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[aduskett at gmail.com: Update for 7.2.2]
-diff -Nur php-7.0.12.orig/Zend/zend_portability.h php-7.0.12/Zend/zend_portability.h
---- php-7.0.12.orig/Zend/zend_portability.h	2016-10-13 16:04:17.000000000 +0200
-+++ php-7.0.12/Zend/zend_portability.h	2016-11-08 02:49:39.118388999 +0100
-@@ -95,7 +95,7 @@
- 
- #if defined(ZEND_WIN32) && !defined(__clang__)
- # define ZEND_ASSUME(c)	__assume(c)
--#elif ((defined(__GNUC__) && ZEND_GCC_VERSION >= 4005) || __has_builtin(__builtin_unreachable)) && PHP_HAVE_BUILTIN_EXPECT
-+#elif ((defined(__GNUC__) && ZEND_GCC_VERSION >= 4005) || __has_builtin(__builtin_unreachable)) && PHP_HAVE_BUILTIN_EXPECT && !defined(__bfin__)
- # define ZEND_ASSUME(c)	do { \
- 		if (__builtin_expect(!(c), 0)) __builtin_unreachable(); \
- 	} while (0)
diff --git a/package/php/0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch b/package/php/0007-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
similarity index 100%
rename from package/php/0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
rename to package/php/0007-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
-- 
2.14.3
