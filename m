From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Jan 2011 17:13:01 -0300
Subject: [Buildroot] [PATCH 12/13] php: security bump to 5.2.17
In-Reply-To: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294431182-27793-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PHP bug #53632 and CVE-2010-4645, where conversions from string to
double might cause the PHP interpreter to hang on systems using x87 FPU
registers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index aa99d23..ad0ae43 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,14 +4,13 @@
 #
 #############################################################
 
-PHP_VERSION = 5.2.16
+PHP_VERSION = 5.2.17
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_LIBTOOL_PATCH = NO
-PHP_DEPENDENCIES =
 PHP_CONF_OPT =  --mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--disable-all \
-- 
1.7.2.2
