From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:49:15 +0200
Subject: [Buildroot] [git commit] php-memcached: fix legal info
Message-ID: <20170403124919.6CAC5826B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59ee35a5fbaaa993475279da116bd16a31576fbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file refer to PHP license version 3.01. License header in all
source files refer to PHP license version 3.01 except source files for
fastlz library which is provided under MIT license and g_fmt.{c,h}
which has ISC-like license header.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-memcached/php-memcached.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index ea241b2..c4b7636 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -12,8 +12,8 @@ PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-zlib-dir=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_MEMCACHED_DEPENDENCIES = libmemcached php zlib host-autoconf host-pkgconf
-PHP_MEMCACHED_LICENSE = MIT
-PHP_MEMCACHED_LICENSE_FILES = LICENSE
+PHP_MEMCACHED_LICENSE = PHP-3.01, MIT (fastlz), ISC-like (g_fmt.c, g_fmt.h)
+PHP_MEMCACHED_LICENSE_FILES = LICENSE fastlz/LICENSE g_fmt.h
 
 define PHP_MEMCACHED_PHPIZE
 	(cd $(@D); \
