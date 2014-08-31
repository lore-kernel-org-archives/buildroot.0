From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 21:06:22 +0200
Subject: [Buildroot] [git commit] php-gnupg: get tarball from
	sources.buildroot.net
Message-ID: <20140831191403.ABCB99D561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6708db52c7468d3e0e12f5a4504782f1d52001f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pecl.php.net seems to have a database issue and returns a html page instead
of the tarball.

Fixes http://autobuild.buildroot.net/results/3b6/3b6c53ecbd8d25307ed77b29bffa62f5395f1981/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-gnupg/php-gnupg.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index 989c55b..121eaff 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -6,7 +6,8 @@
 
 PHP_GNUPG_VERSION = 1.3.3
 PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
-PHP_GNUPG_SITE = http://pecl.php.net/get
+# pecl.php.net returns html with db connect failed
+PHP_GNUPG_SITE = http://sources.buildroot.net
 # phpize does the autoconf magic
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
 PHP_GNUPG_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
