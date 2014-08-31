From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 21:13:47 +0200
Subject: [Buildroot] [git commit] php-*: get tarball from
	sources.buildroot.net
Message-ID: <20140831191403.B28ED9D533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f24945a212d66a38e992ce73d9aacf53238e9314
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pecl.php.net seems to have a database issue and returns a html page instead
of the tarball.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-imagick/php-imagick.mk     |    3 ++-
 package/php-memcached/php-memcached.mk |    3 ++-
 package/php-ssh2/php-ssh2.mk           |    3 ++-
 package/php-yaml/php-yaml.mk           |    3 ++-
 package/php-zmq/php-zmq.mk             |    3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 148d519..05340e3 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -6,7 +6,8 @@
 
 PHP_IMAGICK_VERSION = 3.1.2
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
-PHP_IMAGICK_SITE = http://pecl.php.net/get
+# pecl.php.net returns html with db connect failed
+PHP_IMAGICK_SITE = http://sources.buildroot.net
 PHP_IMAGICK_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-imagick=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index b9cc115..1fa6481 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -6,7 +6,8 @@
 
 PHP_MEMCACHED_VERSION = 2.2.0
 PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
-PHP_MEMCACHED_SITE = http://pecl.php.net/get
+# pecl.php.net returns html with db connect failed
+PHP_MEMCACHED_SITE = http://sources.buildroot.net
 PHP_MEMCACHED_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--disable-memcached-sasl \
 	--with-libmemcached-dir=$(STAGING_DIR)/usr \
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index f2067a4..d1e8304 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -6,7 +6,8 @@
 
 PHP_SSH2_VERSION = 0.12
 PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
-PHP_SSH2_SITE = http://pecl.php.net/get
+# pecl.php.net returns html with db connect failed
+PHP_SSH2_SITE = http://sources.buildroot.net
 PHP_SSH2_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-ssh2=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index a53e012..053efc4 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -6,7 +6,8 @@
 
 PHP_YAML_VERSION = 1.1.1
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
-PHP_YAML_SITE = http://pecl.php.net/get
+# pecl.php.net returns html with db connect failed
+PHP_YAML_SITE = http://sources.buildroot.net
 PHP_YAML_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-yaml=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
index 2b48a63..1991635 100644
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -6,7 +6,8 @@
 
 PHP_ZMQ_VERSION = 1.1.2
 PHP_ZMQ_SOURCE = zmq-$(PHP_ZMQ_VERSION).tgz
-PHP_ZMQ_SITE = http://pecl.php.net/get
+# pecl.php.net returns html with db connect failed
+PHP_ZMQ_SITE = http://sources.buildroot.net
 # phpize does the autoconf magic
 PHP_ZMQ_DEPENDENCIES = php zeromq host-autoconf host-pkgconf
 PHP_ZMQ_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
