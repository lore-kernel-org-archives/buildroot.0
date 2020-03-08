From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 20:08:21 +0100
Subject: [Buildroot] [git commit] package/php: fix build without zlib
Message-ID: <20200308190047.6A05F8FF23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57bbd39d61ba073b603f1eeaf2fc714012913ceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build will fail if zlib is not found and mysqlnd compression support
is not disabled since version 7.4.1 and
https://github.com/php/php-src/commit/ee4295b4ce421003c2e1d2af98066826deb23319

Fixes:
 - http://autobuild.buildroot.org/results/9496d81437dba55d22a03762dcfe60d632115ab5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index d4829645e8..c0abecad19 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -174,6 +174,8 @@ endif
 ifneq ($(BR2_PACKAGE_PHP_EXT_ZLIB)$(BR2_PACKAGE_PHP_EXT_ZIP),)
 PHP_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += zlib
+else
+PHP_CONF_OPTS += --disable-mysqlnd_compression_support
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
