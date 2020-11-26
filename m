From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 26 Nov 2020 18:34:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 7.4.13
Message-ID: <20201126173430.540104-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patches.

Changelog: https://www.php.net/ChangeLog-7.php#7.4.13

According to the release notes this is a "security bug fix release":
https://news-web.php.net/php.announce/301

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/0002-iconv-tweak-iconv-detection.patch     | 4 ++--
 package/php/0003-configure-disable-the-phar-tool.patch | 4 ++--
 package/php/php.hash                                   | 2 +-
 package/php/php.mk                                     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index a12041603d..959afd80da 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -16,7 +16,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett at gmail.com: Update for 7.3.0]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 7.4.10]
+[Bernd: rebased for 7.4.10 & 7.4.13]
 ---
  build/php.m4        |  2 +-
  ext/iconv/config.m4 | 22 ----------------------
@@ -26,7 +26,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index 9586c490..8b3d47ed 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1965,7 +1965,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1967,7 +1967,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl Check external libs for iconv funcs.
    if test "$found_iconv" = "no"; then
  
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index aface92d77..4a25ec05c1 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -13,7 +13,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [Aduskett: update for 7.3.0]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 7.4.10]
+[Bernd: rebased for 7.4.10 & 7.4.13]
 ---
  configure.ac | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1453,13 +1453,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
+@@ -1454,13 +1454,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/php.hash b/package/php/php.hash
index 8e8131d301..5078228f48 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  e82d2bcead05255f6b7d2ff4e2561bc334204955820cabc2457b5239fde96b76  php-7.4.12.tar.xz
+sha256  aead303e3abac23106529560547baebbedba0bb2943b91d5aa08fff1f41680f4  php-7.4.13.tar.xz
 
 # License file
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ce0e3e4a49..0feb96e97a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.12
+PHP_VERSION = 7.4.13
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.27.0
