From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 23:25:11 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.6.22
Message-ID: <20160526213123.BD06681DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47aa250650ae6d9b1a80c66e6b5536f5fa606432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
Core: Integer Overflow in php_html_entities
Core: Integer underflow / arbitrary null write in fread/gzread
GD: imagescale out-of-bounds read
Intl: get_icu_value_internal out-of-bounds read

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4feb3ca..f97baea 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	566ff1a486cb0485ed477a91ea292423f77a58671270ff73b74e67e3ce7084f9	php-5.6.21.tar.xz
+sha256	c96980d7de1d66c821a4ee5809df0076f925b2fe0b8c362d234d92f2f0a178e2	php-5.6.22.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index d58c4fd..90633ef 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.21
+PHP_VERSION = 5.6.22
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
