From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Dec 2010 14:04:23 -0300
Subject: [Buildroot] [PATCH 02/13] php: security bump to version 5.2.16
In-Reply-To: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292605474-19443-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Fixed extract() to do not overwrite $GLOBALS and $this when using
  EXTR_OVERWRITE.

* Fixed crash in zip extract method (possible CWE-170).

* Fixed a possible double free in imap extension.

* Fixed possible flaw in open_basedir (CVE-2010-3436).

* Fixed NULL pointer dereference in ZipArchive::getArchiveComment.
  (CVE-2010-3709).

* Fixed bug #52929 (Segfault in filter_var with FILTER_VALIDATE_EMAIL
  with large amount of data).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index af4fa29..4db2b84 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.2.14
+PHP_VERSION = 5.2.16
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.7.2.2
