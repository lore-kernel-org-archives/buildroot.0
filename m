From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:57:29 +0100
Subject: [Buildroot] [git commit] php: bump to 7.2.1
Message-ID: <20180130215731.28281880F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3595613c14cb01e43b8a77474447170bb95b6cdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update 0003-configure-disable-the-phar-tool.patch as configure.in is no
longer provided in the tarballs. Instead, configure.ac is patched.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/0003-configure-disable-the-phar-tool.patch | 16 +++++++++-------
 package/php/php.hash                                   |  2 +-
 package/php/php.mk                                     |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index 3b64b7b6bf..17a92abe63 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -10,15 +10,17 @@ on the target.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for autoreconf/configure.in]
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+[Aduskett: update for php7.2.1]
 ---
- configure.in | 9 ++-------
+ configure.ac | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index 25c8abf..4dc8a09 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1445,13 +1445,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
+diff --git a/configure.ac b/configure.ac
+index d20af76..7f02f1a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1419,13 +1419,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
@@ -35,5 +37,5 @@ index 25c8abf..4dc8a09 100644
  all_targets="$lcov_target \$(OVERALL_TARGET) \$(PHP_MODULES) \$(PHP_ZEND_EX) \$(PHP_BINARIES) $pharcmd"
  install_targets="$install_sapi $install_modules $install_binaries install-build install-headers install-programs $install_pear $pharcmd_install"
 -- 
-2.7.4
+2.14.3
 
diff --git a/package/php/php.hash b/package/php/php.hash
index 3b3c97bd38..60783cac7a 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 1a0b3f2fb61959b57a3ee01793a77ed3f19bde5aa90c43dcacc85ea32f64fc10  php-7.1.13.tar.xz
+sha256 6c6cf82fda6660ed963821eb0525214bb3547e8e29f447b9c15b2d8e6efd8822  php-7.2.1.tar.xz
 
 # License file
 sha256 a44951f93b10c87c3f7cd9f311d95999c57c95ed950eec32b14c1c7ea6baf25e  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 941000cd6b..152ec7d780 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.13
+PHP_VERSION = 7.2.1
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
