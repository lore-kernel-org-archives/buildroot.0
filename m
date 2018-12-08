From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 10:55:53 +0100
Subject: [Buildroot] [git commit] php: security bump to version 7.2.13
Message-ID: <20181208095218.E6F4A86C19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1af52321389f56cec4888389b2161cc1ee2bfaed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-19518: University of Washington IMAP Toolkit 2007f on UNIX,
as used in imap_open() in PHP and other products, launches an rsh command
(by means of the imap_rimap function in c-client/imap4r1.c and the tcp_aopen
function in osdep/unix/tcp_unix.c) without preventing argument injection,
which might allow remote attackers to execute arbitrary OS commands if the
IMAP server name is untrusted input (e.g., entered by a user of a web
application) and if rsh has been replaced by a program with different
argument semantics.  For example, if rsh is a link to ssh (as seen on Debian
and Ubuntu systems), then the attack can use an IMAP server name containing
a "-oProxyCommand" argument.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index cea6997aa2..094977c548 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 989c04cc879ee71a5e1131db867f3c5102f1f7565f805e2bb8bde33f93147fe1  php-7.2.12.tar.xz
+sha256 14b0429abdb46b65c843e5882c9a8c46b31dfbf279c747293b8ab950c2644a4b  php-7.2.13.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ae7e742b65..b95ceb5c9d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.12
+PHP_VERSION = 7.2.13
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
