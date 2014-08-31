From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 21:02:35 +0200
Subject: [Buildroot] [git commit] php-geoip: get tarball from
	sources.buildroot.net
Message-ID: <20140831190434.BFB419D573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=752b94c7dc42582d00d9cfc37548e03ebb058902
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pecl.php.net seems to have a database issue and returns a html page instead
of the tarball.

Fixes http://autobuild.buildroot.net/results/c56/c56b3bf6c141b2b9b9062816bec559b2529534a1/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-geoip/php-geoip.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 99f74e0..e871bc1 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -6,7 +6,8 @@
 
 PHP_GEOIP_VERSION = 1.1.0
 PHP_GEOIP_SOURCE = geoip-$(PHP_GEOIP_VERSION).tgz
-PHP_GEOIP_SITE = http://pecl.php.net/get
+# pecl.php.net returns html with db connect failed
+PHP_GEOIP_SITE = http://sources.buildroot.net
 PHP_GEOIP_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-geoip=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
