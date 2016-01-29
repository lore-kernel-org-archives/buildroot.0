From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 29 Jan 2016 08:52:43 +0100
Subject: [Buildroot] [PATCH 2/2] php: drop useless PHP_VERSION_MAJOR variable
In-Reply-To: <1454053963-1805-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1454053963-1805-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1454053963-1805-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

~/buildroot$ grep -R PHP_VERSION_MAJOR .
./package/php/php.mk:PHP_VERSION_MAJOR = 5.6
./package/php/php.mk:PHP_VERSION = $(PHP_VERSION_MAJOR).17
 
Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/php/php.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ed391c0..84443a1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).17
+PHP_VERSION = 5.6.17
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
1.9.1
