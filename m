From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 May 2015 13:13:35 +0200
Subject: [Buildroot] [git commit] php: add PHP_VERSION_MAJOR variable
Message-ID: <20150520132935.D181681D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24d340fd46c082f71d04db186fdb703b39b57f22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add PHP_VERSION_MAJOR variable to php.mk for use by other packages.
E.g. to install the Ioncube loader binary, it is necessary to
know the PHP major version.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 3e4601e..abbdc24 100644
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
