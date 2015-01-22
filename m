From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Jan 2015 14:17:45 -0300
Subject: [Buildroot] [PATCH 1/2] php: security bump to version 5.5.21
Message-ID: <1421947066-25455-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-0231 - Use After Free Vulnerability in PHP's unserialize()
CVE-2014-9427 - Out of bounds read crashes php-cgi
CVE-2015-0232 - Free called on unitialized pointer

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0117289..cd27b10 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-md5	51377838dfee2d7bb4715674ac715394	php-5.5.20.tar.xz
+md5	79664ce44f7c93f355a25a3fe3dcc91b	php-5.5.21.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index a5f4574..4bcbe18 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.20
+PHP_VERSION = 5.5.21
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.0.5
