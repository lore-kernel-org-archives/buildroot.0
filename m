From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Jun 2009 09:26:27 +0200
Subject: [Buildroot] [git commit] php: bump version
Message-ID: <20090623074118.45D39777DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93308ccba3c743297d231f06a5a1fc0523d7e404
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #409.

php-5.2.10 is out, mostly misc bugfixes, one small security fix:

Security Enhancements and Fixes in PHP 5.2.10:

    * Fixed bug #48378 (exif_read_data() segfaults on certain corrupted .jpeg
files). (Pierre)

Key enhancements in PHP 5.2.10 include:

    * Added "ignore_errors" option to http fopen wrapper. (David Zulke, Sara)
    * Fixed memory corruptions while reading properties of zip files. (Ilia)
    * Fixed memory leak in ob_get_clean/ob_get_flush. (Christian)
    * Fixed segfault on invalid session.save_path. (Hannes)
    * Fixed leaks in imap when a mail_criteria is used. (Pierre)
    * Changed default value of array_unique()'s optional sorting type parameter
back to SORT_STRING to fix backwards compatibility breakage introduced in PHP
5.2.9. (Moriyoshi)
    * Fixed bug #47940 (memory leaks in imap_body). (Pierre, Jake Levitt)
    * Fixed bug #47903 ("@" operator does not work with string offsets).
(Felipe)
    * Fixed bug #47644 (Valid integers are truncated with json_decode()).
(Scott)
    * Fixed bug #47564 (unpacking unsigned long 32bit big endian returns wrong
result). (Ilia)
    * Fixed bug #47365 (ip2long() may allow some invalid values on certain
64bit systems).
    * Over 100 bug fixes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 551abeb..eb801a7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.2.9
+PHP_VERSION = 5.2.10
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.6.0.6
