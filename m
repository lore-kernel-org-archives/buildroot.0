From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:35:26 +0200
Subject: [Buildroot] [git commit] php-memcached: bump version to 3.0.3
Message-ID: <20170601202901.E2D1C7FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea887aac3f8e7ac3c230b9becf867eb95463e9bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And switch to the official PECL site.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-memcached/php-memcached.hash | 2 +-
 package/php-memcached/php-memcached.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
index f2a096f..7a8ec28 100644
--- a/package/php-memcached/php-memcached.hash
+++ b/package/php-memcached/php-memcached.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 73266212e791a4817da06be1daddf9ff7dd5b5b0b650b3fbd0f5fc6ccc18491b  php-memcached-6ee96cad7be5caa1f13a1f3e5a4d5f900b9c04ce.tar.gz
+sha256 5d1c29a1d5e391d6bb7b736a07e063d2f0834800673dd246d64ce1b73e47645d  memcached-3.0.3.tgz
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index c4b7636..1f962b0 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PHP_MEMCACHED_VERSION = 6ee96cad7be5caa1f13a1f3e5a4d5f900b9c04ce
-PHP_MEMCACHED_SITE = $(call github,php-memcached-dev,php-memcached,$(PHP_MEMCACHED_VERSION))
+PHP_MEMCACHED_VERSION = 3.0.3
+PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
+PHP_MEMCACHED_SITE = https://pecl.php.net/get
 PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--disable-memcached-sasl \
 	--with-libmemcached-dir=$(STAGING_DIR)/usr \
