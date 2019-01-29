From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 17:28:18 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/php: security
 bump to 7.2.14
Message-ID: <20190129162720.D9C2B8148D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8df933efac73c2295f6240e56dbb09674062ed5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes the following security issue:

- CVE-2018-19935: Allows remote attackers to cause a denial of service (NULL
  pointer dereference and application crash) via an empty string in the
  message argument to the imap_mail function.
  https://www.cvedetails.com/cve/CVE-2018-19935/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 094977c548..acbe499536 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 14b0429abdb46b65c843e5882c9a8c46b31dfbf279c747293b8ab950c2644a4b  php-7.2.13.tar.xz
+sha256 ee3f1cc102b073578a3c53ba4420a76da3d9f0c981c02b1664ae741ca65af84f  php-7.2.14.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index b95ceb5c9d..e5a0d7729c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.13
+PHP_VERSION = 7.2.14
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
