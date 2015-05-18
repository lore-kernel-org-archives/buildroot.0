From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 18 May 2015 21:52:02 +0200
Subject: [Buildroot] [PATCH 4/6] php: add PHP_VERSION_MAJOR variable
In-Reply-To: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1431978724-25081-4-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add PHP_VERSION_MAJOR variable to php.mk for use by other packages.
E.g. to install the Ioncube loader binary, it is necessary to
know the PHP major version.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/php.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 65d5015..1635a63 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.8
+PHP_VERSION_MAJOR = 5.6
+PHP_VERSION = $(PHP_VERSION_MAJOR).8
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.1.4
