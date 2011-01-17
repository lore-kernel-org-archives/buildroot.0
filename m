From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] php: security bump to 5.2.17
Message-ID: <20110117202413.07C648A6AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b3395489fee554ee2d08269d1d72e1357d7c4c13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PHP bug #53632 and CVE-2010-4645, where conversions from string to
double might cause the PHP interpreter to hang on systems using x87 FPU
registers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
