From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 19:57:49 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/php: bump version
 to 7.2.12
Message-ID: <20181216185617.5E2778D2A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b227e85ce8b3a4ebc785c1a218ba84005d0023ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Changelog: http://www.php.net/ChangeLog-7.php#7.2.12

Rebased patch 0004 and updated license hash after white space removal:
https://github.com/php/php-src/commit/902d39a3a79c6efe93c8879575fdd5a759cf03de

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d383a73a8e5f45f291afda56af912ab088f2f255)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Pcache-flock-mechanism-is-obviously-linux-so-force-.patch | 12 +++++++-----
 package/php/php.hash                                         |  4 ++--
 package/php/php.mk                                           |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
index 9b530361c9..2c08437e4d 100644
--- a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
+++ b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
@@ -4,6 +4,8 @@ Date: Tue, 9 Aug 2016 11:52:19 +0200
 Subject: [PATCH] OPcache: flock mechanism is obviously linux so force it.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: update for 7.2.12]
 ---
  ext/opcache/config.m4 | 34 ++--------------------------------
  1 file changed, 2 insertions(+), 32 deletions(-)
@@ -21,12 +23,12 @@ index fbb9b21..ffddc8e 100644
 -AC_TRY_RUN([
 -  #include <fcntl.h>
 -  struct flock lock = { 1, 2, 3, 4, 5 };
--  int main() { 
+-  int main() {
 -    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 3 && lock.l_len == 4) {
 -		return 0;
 -    }
 -    return 1;
--  } 
+-  }
 -], [
 -	flock_type=linux
 -    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
@@ -37,15 +39,15 @@ index fbb9b21..ffddc8e 100644
 -AC_TRY_RUN([
 -  #include <fcntl.h>
 -  struct flock lock = { 1, 2, 3, 4, 5 };
--  int main() { 
+-  int main() {
 -    if(lock.l_start == 1 && lock.l_len == 2 && lock.l_type == 4 && lock.l_whence == 5) {
 -		return 0;
 -    }
 -    return 1;
--  } 
+-  }
 -], [
 -	flock_type=bsd
--    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type]) 
+-    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])
 -    AC_MSG_RESULT("yes")
 -], AC_MSG_RESULT("no") )
 +flock_type=linux
diff --git a/package/php/php.hash b/package/php/php.hash
index 59532771a9..cea6997aa2 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 da1a705c0bc46410e330fc6baa967666c8cd2985378fb9707c01a8e33b01d985  php-7.2.11.tar.xz
+sha256 989c04cc879ee71a5e1131db867f3c5102f1f7565f805e2bb8bde33f93147fe1  php-7.2.12.tar.xz
 
 # License file
-sha256 00e567a8d50359d93ee1f9afdd9511277660c1e70a0cbf3229f84403aa9aebb1  LICENSE
+sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 4365847733..b6b6aea615 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.11
+PHP_VERSION = 7.2.12
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
