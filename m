From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2021 08:38:28 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/php: security
 bump version to 7.4.14
Message-ID: <20210108072013.E9CD48640D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f00c4a5a3bc1d1ba8b5d9381cda7f6e93d5f5a09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes CVE-2020-7071: https://bugs.php.net/bug.php?id=77423

Release notes: https://news-web.php.net/php.announce/304
Changelog: https://www.php.net/ChangeLog-7.php#7.4.14

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2136d7ca5cfb5f451fbea11d27d424dfc41bd299)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/0002-iconv-tweak-iconv-detection.patch | 2 +-
 package/php/php.hash                               | 2 +-
 package/php/php.mk                                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index 959afd80da..65ed6055bc 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -26,7 +26,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index 9586c490..8b3d47ed 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1967,7 +1967,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1973,7 +1973,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl Check external libs for iconv funcs.
    if test "$found_iconv" = "no"; then
  
diff --git a/package/php/php.hash b/package/php/php.hash
index 5078228f48..46c589661d 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  aead303e3abac23106529560547baebbedba0bb2943b91d5aa08fff1f41680f4  php-7.4.13.tar.xz
+sha256  f9f3c37969fcd9006c1dbb1dd76ab53f28c698a1646fa2dde8547c3f45e02886  php-7.4.14.tar.xz
 
 # License file
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index a2d3cbff4f..29d63a34d5 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.13
+PHP_VERSION = 7.4.14
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
