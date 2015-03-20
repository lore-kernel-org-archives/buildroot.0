From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Mar 2015 09:50:22 -0300
Subject: [Buildroot] [PATCH] php-gnupg: bump to version 1.3.6
Message-ID: <1426855822-9969-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-gnupg/php-gnupg.hash | 2 ++
 package/php-gnupg/php-gnupg.mk   | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 package/php-gnupg/php-gnupg.hash

diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
new file mode 100644
index 0000000..ef066a5
--- /dev/null
+++ b/package/php-gnupg/php-gnupg.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	50065cb81f1ac3ec5fcd796e58c8433071ff24cc14900e6077682717f5239307	gnupg-1.3.6.tgz
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index 23826c6..c5964c2 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 1.3.3
+PHP_GNUPG_VERSION = 1.3.6
 PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_GNUPG_SITE = http://sources.buildroot.net
+PHP_GNUPG_SITE = http://pecl.php.net/get
 # phpize does the autoconf magic
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
 PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.0.5
