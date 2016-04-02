From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 16:51:22 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.6.20
Message-ID: <20160402145127.3645B7F9BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=039db88c6b500bbc1863e11a1141f12b1842af82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (no CVEs yet):
Buffer over-write in finfo_open with malformed magic file.
Invalid memory write in phar on filename with \0 in name.
Parsing of tar file with duplicate filenames causes memory leak.
php_snmp_error() Format String Vulnerability.
Integer Overflow in php_raw_url_encode.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 9cfbcad..e359bf7 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	bb32337f93a00b71789f116bddafa8848139120e7fb6f4f98a84f52dbcb8329f	php-5.6.19.tar.xz
+sha256	2b87d40213361112af49157a435e0d4cdfd334c9b7c731c8b844932b1f444e7a	php-5.6.20.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 6d27c30..1c92060 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.19
+PHP_VERSION = 5.6.20
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
