From: Romain Naour <romain.naour@smile.fr>
Date: Tue,  4 Feb 2020 14:24:43 +0100
Subject: [Buildroot] [PATCH] package/php-*: remove php dependency for php
 modules
Message-ID: <20200204132443.1186904-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

php modules can't be selected if the php package is not selected, see [1].
So adding the dependency is not necessary.
Also we don't add such dependencies for python modules.

[1] https://git.buildroot.net/buildroot/tree/package/Config.in?h=2019.11#n798

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/php-amqp/Config.in    | 1 -
 package/php-geoip/Config.in   | 1 -
 package/php-gnupg/Config.in   | 1 -
 package/php-imagick/Config.in | 2 --
 package/php-ssh2/Config.in    | 1 -
 package/php-yaml/Config.in    | 1 -
 package/php-zmq/Config.in     | 1 -
 7 files changed, 8 deletions(-)

diff --git a/package/php-amqp/Config.in b/package/php-amqp/Config.in
index dc779f0ee0..48fff91d4d 100644
--- a/package/php-amqp/Config.in
+++ b/package/php-amqp/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PHP_AMQP
 	bool "php-amqp"
-	depends on BR2_PACKAGE_PHP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # rabbitmq-c
 	select BR2_PACKAGE_OPENSSL # rabbitmq-c: amqp_ssl_socket.h
 	select BR2_PACKAGE_RABBITMQ_C
diff --git a/package/php-geoip/Config.in b/package/php-geoip/Config.in
index adb20466fc..35c6c1c362 100644
--- a/package/php-geoip/Config.in
+++ b/package/php-geoip/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PHP_GEOIP
 	bool "php-geoip"
-	depends on BR2_PACKAGE_PHP
 	select BR2_PACKAGE_GEOIP
 	help
 	  PHP GeoIP-based IP address mapper to geographical places.
diff --git a/package/php-gnupg/Config.in b/package/php-gnupg/Config.in
index 113017d02a..8cc8bb9f3c 100644
--- a/package/php-gnupg/Config.in
+++ b/package/php-gnupg/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PHP_GNUPG
 	bool "php-gnupg"
-	depends on BR2_PACKAGE_PHP
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # ligpgme
 	depends on BR2_USE_MMU # libassuan
 	select BR2_PACKAGE_LIBGPGME
diff --git a/package/php-imagick/Config.in b/package/php-imagick/Config.in
index f759eea2f5..488e375849 100644
--- a/package/php-imagick/Config.in
+++ b/package/php-imagick/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PHP_IMAGICK
 	bool "php-imagick"
-	depends on BR2_PACKAGE_PHP
 	depends on BR2_USE_MMU # imagemagick
 	depends on BR2_TOOLCHAIN_HAS_THREADS # imagemagick
 	select BR2_PACKAGE_IMAGEMAGICK
@@ -11,5 +10,4 @@ config BR2_PACKAGE_PHP_IMAGICK
 
 comment "php-imagemagick needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_PHP
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
index b457900740..5a23114baf 100644
--- a/package/php-ssh2/Config.in
+++ b/package/php-ssh2/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PHP_SSH2
 	bool "php-ssh2"
-	depends on BR2_PACKAGE_PHP
 	select BR2_PACKAGE_LIBSSH2
 	help
 	  PHP bindings for the libssh2 library.
diff --git a/package/php-yaml/Config.in b/package/php-yaml/Config.in
index 8d09ce28f3..28f917fe60 100644
--- a/package/php-yaml/Config.in
+++ b/package/php-yaml/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PHP_YAML
 	bool "php-yaml"
-	depends on BR2_PACKAGE_PHP
 	select BR2_PACKAGE_LIBYAML
 	help
 	  PHP YAML-1.1 parser and emitter.
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
index 058f93d9a8..37be17792a 100644
--- a/package/php-zmq/Config.in
+++ b/package/php-zmq/Config.in
@@ -3,7 +3,6 @@ comment "php-zmq needs a toolchain w/ C++, threads"
 
 config BR2_PACKAGE_PHP_ZMQ
 	bool "php-zmq"
-	depends on BR2_PACKAGE_PHP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZEROMQ
-- 
2.24.1
