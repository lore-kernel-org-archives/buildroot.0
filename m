From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Sep 2014 16:18:56 +0200
Subject: [Buildroot] [git commit] php: bump to version 5.5.17
Message-ID: <20140919153050.030219D6FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b423f3b02e1604d8b66b0b6555218e5409ca99f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash and switch to xz download for space savings.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash |    2 ++
 package/php/php.mk   |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
