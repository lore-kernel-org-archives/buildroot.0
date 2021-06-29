From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 29 Jun 2021 09:50:45 -0700
Subject: [Buildroot] [PATCH 02/11] package/php-gnupg: bump version to 1.5.0
In-Reply-To: <20210629165054.3831930-1-aduskett@gmail.com>
References: <20210629165054.3831930-1-aduskett@gmail.com>
Message-ID: <20210629165054.3831930-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
  - Change --with-gnupg=$(STAGING_DIR)/usr/include to
  --with-gnupg=$(STAGING_DIR)/usr as the make system appends /include to the
    gnupgp path now.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/php-gnupg/php-gnupg.hash | 2 +-
 package/php-gnupg/php-gnupg.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index 8d142cdaaf..99ffe87f46 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  35e16bee11345a7d6bf57bea3cadf45e371ad1ed4e0218b0c06f6f637e4e1772  gnupg-1.4.0.tgz
+sha256  d4f5f79aa483908f3df08e5b343ea3593c6d725b9ed2103e30242627659e0a64  gnupg-1.5.0.tgz
 sha256  da1136d4d9326317cbd320dadddf7e9b4b4edffd973eb083cb7b9754fb6a15d9  LICENSE
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index ae0a781154..a89f0978af 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 1.4.0
+PHP_GNUPG_VERSION = 1.5.0
 PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
 PHP_GNUPG_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
 PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--with-gnupg=$(STAGING_DIR)/usr/include --with-gpg=/usr/bin/gpg
+	--with-gnupg=$(STAGING_DIR)/usr --with-gpg=/usr/bin/gpg
 PHP_GNUPG_LICENSE = BSD-2-Clause
 PHP_GNUPG_LICENSE_FILES = LICENSE
 
-- 
2.31.1
