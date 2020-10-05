From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2020 08:10:52 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/php: security
 bump to version 7.4.11
Message-ID: <20201005060201.345AA8D696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32cec2af363db4c0a9cfcdbc1d28a69760371014
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

- Fix CVE-2020-7069: In PHP versions 7.2.x below 7.2.34, 7.3.x below
  7.3.23 and 7.4.x below 7.4.11, when AES-CCM mode is used with
  openssl_encrypt() function with 12 bytes IV, only first 7 bytes of the
  IV is actually used. This can lead to both decreased security and
  incorrect encryption data.
- Fix CVE-2020-7070: In PHP versions 7.2.x below 7.2.34, 7.3.x below
  7.3.23 and 7.4.x below 7.4.11, when PHP is processing incoming HTTP
  cookie values, the cookie names are url-decoded. This may lead to
  cookies with prefixes like __Host confused with cookies that decode to
  such prefix, thus leading to an attacker being able to forge cookie
  which is supposed to be secure. See also CVE-2020-8184 for more
  information.

https://www.php.net/ChangeLog-7.php#7.4.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 51d9617474db14e4757ca3a340deccc1dc3df6c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index c383c471eb..77a0feb555 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  c2d90b00b14284588a787b100dee54c2400e7db995b457864d66f00ad64fb010  php-7.4.10.tar.xz
+sha256  5d31675a9b9c21b5bd03389418218c30b26558246870caba8eb54f5856e2d6ce  php-7.4.11.tar.xz
 
 # License file
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7b59ac654d..011c9019c5 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.10
+PHP_VERSION = 7.4.11
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
