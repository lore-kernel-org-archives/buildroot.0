From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 14 Apr 2016 11:28:11 +0100
Subject: [Buildroot] [PATCH] php: bump version to 7.0.5
Message-ID: <1460629691-56260-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- php-geoip: switched to HEAD of master on GitHub.
  - Bug: https://bugs.php.net/bug.php?id=71083

- php-gnupg: switched to HEAD of master on GitHub.
  - Bug: https://bugs.php.net/bug.php?id=71138

- php-imagick: bump version to 3.4.1.
  - Necessary to work with php-7.

- php-memcached: switched to HEAD of master on GitHub.
  - Bug: https://bugs.php.net/bug.php?id=70751

- php-ssh2: switched to HEAD of master on GitHub.
  - Bug: https://bugs.php.net/bug.php?id=71376

- php-yaml: bump version to 2.0.0RC7.
  - Necessary to work with php-7.

- php-zmq: bump version to 1.1.3.
  - Necessary to work with php-7.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php-geoip/php-geoip.hash         | 2 +-
 package/php-geoip/php-geoip.mk           | 6 ++----
 package/php-gnupg/php-gnupg.hash         | 2 +-
 package/php-gnupg/php-gnupg.mk           | 5 ++---
 package/php-imagick/php-imagick.hash     | 2 +-
 package/php-imagick/php-imagick.mk       | 5 ++---
 package/php-memcached/php-memcached.hash | 2 +-
 package/php-memcached/php-memcached.mk   | 6 ++----
 package/php-ssh2/php-ssh2.hash           | 2 +-
 package/php-ssh2/php-ssh2.mk             | 6 ++----
 package/php-yaml/php-yaml.hash           | 2 +-
 package/php-yaml/php-yaml.mk             | 5 ++---
 package/php-zmq/php-zmq.hash             | 2 +-
 package/php-zmq/php-zmq.mk               | 5 ++---
 package/php/php.hash                     | 2 +-
 package/php/php.mk                       | 2 +-
 16 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/package/php-geoip/php-geoip.hash b/package/php-geoip/php-geoip.hash
index 275a098..61945cf 100644
--- a/package/php-geoip/php-geoip.hash
+++ b/package/php-geoip/php-geoip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	82c6deb7264d2ff7c4d6c45a7d27cff7ab097be965795e317e04a9c5b7be98b9	geoip-1.1.0.tgz
+sha256 8b5e8dec6353c437809e58d798627927ae659682b5bbdad023e9e569c278bfed  php-geoip-1fd53288458100e9e30acf5a62bc9ef8426513d3.tar.gz
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 0826c19..93dcf01 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-PHP_GEOIP_VERSION = 1.1.0
-PHP_GEOIP_SOURCE = geoip-$(PHP_GEOIP_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_GEOIP_SITE = http://sources.buildroot.net
+PHP_GEOIP_VERSION = 1fd53288458100e9e30acf5a62bc9ef8426513d3
+PHP_GEOIP_SITE = $(call github,php7-extensions,ext-php7-geoip,$(PHP_GEOIP_VERSION))
 PHP_GEOIP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-geoip=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index ef066a5..632a3fa 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	50065cb81f1ac3ec5fcd796e58c8433071ff24cc14900e6077682717f5239307	gnupg-1.3.6.tgz
+sha256 7d92c9695a74bc1f371260104301e4646af9f1bf562c41122f61ed92d4975ec4  php-gnupg-f7d42c6bc3f7cf3404ed56ef4f7ec3235a507970.tar.gz
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index c5964c2..6963ece 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 1.3.6
-PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
-PHP_GNUPG_SITE = http://pecl.php.net/get
+PHP_GNUPG_VERSION = f7d42c6bc3f7cf3404ed56ef4f7ec3235a507970
+PHP_GNUPG_SITE = $(call github,Sean-Der,pecl-encryption-gnupg,$(PHP_GNUPG_VERSION))
 # phpize does the autoconf magic
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
 PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index 6173eca..551bed6 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	528769ac304a0bbe9a248811325042188c9d16e06de16f111fee317c85a36c93	imagick-3.1.2.tgz
+sha256 a729fbd69e0aa145824d61dc9225bfb636dcd8421874a5667ac3822e609449e1  imagick-3.4.1.tgz
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 1cd4a48..84cc311 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.1.2
+PHP_IMAGICK_VERSION = 3.4.1
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_IMAGICK_SITE = http://sources.buildroot.net
+PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-imagick=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
index bc2e97a..f2a096f 100644
--- a/package/php-memcached/php-memcached.hash
+++ b/package/php-memcached/php-memcached.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	17b9600f6d4c807f23a3f5c45fcd8775ca2e61d6eda70370af2bef4c6e159f58	memcached-2.2.0.tgz
+sha256 73266212e791a4817da06be1daddf9ff7dd5b5b0b650b3fbd0f5fc6ccc18491b  php-memcached-6ee96cad7be5caa1f13a1f3e5a4d5f900b9c04ce.tar.gz
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 599e22e..ea241b2 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-PHP_MEMCACHED_VERSION = 2.2.0
-PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_MEMCACHED_SITE = http://sources.buildroot.net
+PHP_MEMCACHED_VERSION = 6ee96cad7be5caa1f13a1f3e5a4d5f900b9c04ce
+PHP_MEMCACHED_SITE = $(call github,php-memcached-dev,php-memcached,$(PHP_MEMCACHED_VERSION))
 PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--disable-memcached-sasl \
 	--with-libmemcached-dir=$(STAGING_DIR)/usr \
diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
index d599662..1e046df 100644
--- a/package/php-ssh2/php-ssh2.hash
+++ b/package/php-ssh2/php-ssh2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	600c82d2393acf3642f19914f06a7afea57ee05cb8c10e8a5510b32188b97f99	ssh2-0.12.tgz
+sha256 877f2fa9a709aa2dd9567848fae7b45ecac359904296a0aedbf718e99d8568f5  php-ssh2-aa1739ac26c2177d33ab8d064021032bdc2c3a40.tar.gz
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index ace68e0..cfe6070 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-PHP_SSH2_VERSION = 0.12
-PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_SSH2_SITE = http://sources.buildroot.net
+PHP_SSH2_VERSION = aa1739ac26c2177d33ab8d064021032bdc2c3a40
+PHP_SSH2_SITE = $(call github,php,pecl-networking-ssh2,$(PHP_SSH2_VERSION))
 PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-ssh2=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index e4f22a6..a40677e 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	762ec3d9eb163ac0d063118df8c5e2ee6746dbe8566d32055e7e066e590937c3	yaml-1.1.1.tgz
+sha256 d49acf2b7843258957a16df0d7ced56c0e1fc3eaa54f54289e4012edc002814c  yaml-2.0.0RC7.tgz
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index b6f259d..2711890 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 1.1.1
+PHP_YAML_VERSION = 2.0.0RC7
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_YAML_SITE = http://sources.buildroot.net
+PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-yaml=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
diff --git a/package/php-zmq/php-zmq.hash b/package/php-zmq/php-zmq.hash
index 50ce639..c99e351 100644
--- a/package/php-zmq/php-zmq.hash
+++ b/package/php-zmq/php-zmq.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c9b0af56826fc5e1a95a0fef25e671d9839a421d79e174931faacd8bee389f31	zmq-1.1.2.tgz
+sha256 c492375818bd51b355352798fb94f04d6828c6aeda41ba813849624af74144ce  zmq-1.1.3.tgz
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
index 88c962d..2730996 100644
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PHP_ZMQ_VERSION = 1.1.2
+PHP_ZMQ_VERSION = 1.1.3
 PHP_ZMQ_SOURCE = zmq-$(PHP_ZMQ_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_ZMQ_SITE = http://sources.buildroot.net
+PHP_ZMQ_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
 PHP_ZMQ_DEPENDENCIES = php zeromq host-autoconf host-pkgconf
 PHP_ZMQ_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
diff --git a/package/php/php.hash b/package/php/php.hash
index e359bf7..447adb8 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	2b87d40213361112af49157a435e0d4cdfd334c9b7c731c8b844932b1f444e7a	php-5.6.20.tar.xz
+sha256 c41f1a03c24119c0dd9b741cdb67880486e64349fc33527767f6dc28d3803abb  php-7.0.5.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 1c92060..6ab321d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.20
+PHP_VERSION = 7.0.5
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.7.3
