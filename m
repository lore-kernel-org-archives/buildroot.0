From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 13:45:17 +0100
Subject: [Buildroot] [PATCH next 4/8] php-gnupg: bump version to 1.4.0
In-Reply-To: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
References: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
Message-ID: <20170512124521.4619-4-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And switch to the official PECL site.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php-gnupg/php-gnupg.hash | 2 +-
 package/php-gnupg/php-gnupg.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index f0654b5..4185665 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6f1a4b5a95fe501519de76d66602e46290cc452fc48f3a5ec2eacaffe68d9a01  php-gnupg-30fab6eaf9eb61c65b3b46987442be058cbd7823.tar.gz
+sha256 35e16bee11345a7d6bf57bea3cadf45e371ad1ed4e0218b0c06f6f637e4e1772  gnupg-1.4.0.tgz
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index e595cd3..55772aa 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 30fab6eaf9eb61c65b3b46987442be058cbd7823
-PHP_GNUPG_SITE = $(call github,Sean-Der,pecl-encryption-gnupg,$(PHP_GNUPG_VERSION))
+PHP_GNUPG_VERSION = 1.4.0
+PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
+PHP_GNUPG_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
 PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.10.2
