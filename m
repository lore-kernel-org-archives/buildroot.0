From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Sep 2014 09:31:19 -0300
Subject: [Buildroot] [PATCH] php: bump to version 5.5.17
Message-ID: <1411129879-6055-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash and switch to xz download for space savings.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.hash | 2 ++
 package/php/php.mk   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/php/php.hash

diff --git a/package/php/php.hash b/package/php/php.hash
new file mode 100644
index 0000000..bee8cff
--- /dev/null
+++ b/package/php/php.hash
@@ -0,0 +1,2 @@
+# From http://php.net/downloads.php
+md5	e5f25dae73004658533ee7701a527bd0	php-5.5.17.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 712561c..fe5f0fe 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.16
+PHP_VERSION = 5.5.17
 PHP_SITE = http://www.php.net/distributions
+PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
-- 
1.8.5.5
