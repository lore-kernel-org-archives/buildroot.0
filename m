From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:05:57 +0200
Subject: [Buildroot] [git commit] package/php: bump version to 7.4.10
Message-ID: <20200920131304.AA57A81321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fecbce9535b2169381a0b92ccd218dba03fefd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.php.net/ChangeLog-7.php#7.4.10

Rebased patches 0002 & 0003.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/0002-iconv-tweak-iconv-detection.patch     | 4 +++-
 package/php/0003-configure-disable-the-phar-tool.patch | 4 +++-
 package/php/php.hash                                   | 2 +-
 package/php/php.mk                                     | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index 1aa8400136..a12041603d 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -15,6 +15,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for 5.6.10]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett at gmail.com: Update for 7.3.0]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 7.4.10]
 ---
  build/php.m4        |  2 +-
  ext/iconv/config.m4 | 22 ----------------------
@@ -24,7 +26,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index 9586c490..8b3d47ed 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1971,7 +1971,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1965,7 +1965,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl Check external libs for iconv funcs.
    if test "$found_iconv" = "no"; then
  
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index 7cc3637973..aface92d77 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -12,6 +12,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for autoreconf/configure.in]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [Aduskett: update for 7.3.0]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 7.4.10]
 ---
  configure.ac | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
@@ -20,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1430,13 +1430,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
+@@ -1453,13 +1453,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/php.hash b/package/php/php.hash
index d648d90c04..c383c471eb 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  23733f4a608ad1bebdcecf0138ebc5fd57cf20d6e0915f98a9444c3f747dc57b  php-7.4.9.tar.xz
+sha256  c2d90b00b14284588a787b100dee54c2400e7db995b457864d66f00ad64fb010  php-7.4.10.tar.xz
 
 # License file
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index d9516ae127..3047bfe94d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.9
+PHP_VERSION = 7.4.10
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
