From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 22:34:19 +0100
Subject: [Buildroot] [git commit] php: security bump to 7.3.1
Message-ID: <20190119214058.1A40E8D2C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e6b257d546039b9207cda32e4c281fecba87ae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2018-19935: Allows remote attackers to cause a denial of service
  (NULL pointer dereference and application crash) via an empty string in the
  message argument to the imap_mail function.
https://www.cvedetails.com/cve/CVE-2018-19935/

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index c1c6e8c3e9..2cb89e0366 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 7d195cad55af8b288c3919c67023a14ff870a73e3acc2165a6d17a4850a560b5  php-7.3.0.tar.xz
+sha256 cfe93e40be0350cd53c4a579f52fe5d8faf9c6db047f650a4566a2276bf33362  php-7.3.1.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index b6b17a1562..be7e9b3c89 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.0
+PHP_VERSION = 7.3.1
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
