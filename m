From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:05:45 +0100
Subject: [Buildroot] [git commit] package/php: security bump to 7.1.13
Message-ID: <20180107140601.822F983B38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c59323b846f9eefafb0d3c5d892119d2aa7becd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0008-fix-asm-constraints-in-aarch64-multiply-macro.patch, patch
was applied upstream:
https://github.com/php/php-src/commit/d6d4f2a9b38cd7fa7e938142e49e5a514d612e52

Renumbered patch 0009.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ch => 0008-Call-apxs-with-correct-prefix.patch} |  0
 ...asm-constraints-in-aarch64-multiply-macro.patch | 28 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/php/0009-Call-apxs-with-correct-prefix.patch b/package/php/0008-Call-apxs-with-correct-prefix.patch
similarity index 100%
rename from package/php/0009-Call-apxs-with-correct-prefix.patch
rename to package/php/0008-Call-apxs-with-correct-prefix.patch
diff --git a/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch b/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch
deleted file mode 100644
index f4812da..0000000
--- a/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1622f24fde4220967bd907bf8f0325d444bf9339 Mon Sep 17 00:00:00 2001
-From: Andy Postnikov <apostnikov@gmail.com>
-Date: Sat, 10 Dec 2016 23:51:17 +0300
-Subject: [PATCH] Fix bug #70015 - Compilation failure on aarch64
-
-Fixes build at -O0.
-
-[From pull request https://github.com/php/php-src/pull/2236.]
-Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
----
- Zend/zend_multiply.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Zend/zend_multiply.h b/Zend/zend_multiply.h
-index 75769db..fbd69ab 100644
---- a/Zend/zend_multiply.h
-+++ b/Zend/zend_multiply.h
-@@ -75,8 +75,8 @@
- 	__asm__("mul %0, %2, %3\n"										\
- 		"smulh %1, %2, %3\n"										\
- 		"sub %1, %1, %0, asr #63\n"									\
--			: "=X"(__tmpvar), "=X"(usedval)							\
--			: "X"(a), "X"(b));										\
-+			: "=&r"(__tmpvar), "=&r"(usedval)						\
-+			: "r"(a), "r"(b));										\
- 	if (usedval) (dval) = (double) (a) * (double) (b);				\
- 	else (lval) = __tmpvar;											\
- } while (0)
diff --git a/package/php/php.hash b/package/php/php.hash
index cdec308..3b3c97b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 a0118850774571b1f2d4e30b4fe7a4b958ca66f07d07d65ebdc789c54ba6eeb3  php-7.1.12.tar.xz
+sha256 1a0b3f2fb61959b57a3ee01793a77ed3f19bde5aa90c43dcacc85ea32f64fc10  php-7.1.13.tar.xz
 
 # License file
 sha256 a44951f93b10c87c3f7cd9f311d95999c57c95ed950eec32b14c1c7ea6baf25e  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 72d5ea8..941000c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.12
+PHP_VERSION = 7.1.13
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
