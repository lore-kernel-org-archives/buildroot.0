From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:28:07 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/php: fix zip
 support
Message-ID: <20200506051932.44684882AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab30ce809cde5643cf11c6fb6adcb97eade0abea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

since php7.4, --enable-zip becomes --with-zip due to
migration to pkg-config.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ac2b371732b20bacce9c79b7f3b824bd68b94242)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 91f82dbf31..8282bb1cc7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -113,7 +113,7 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_SYSVMSG),--enable-sysvmsg) \
 	$(if $(BR2_PACKAGE_PHP_EXT_SYSVSEM),--enable-sysvsem) \
 	$(if $(BR2_PACKAGE_PHP_EXT_SYSVSHM),--enable-sysvshm) \
-	$(if $(BR2_PACKAGE_PHP_EXT_ZIP),--enable-zip) \
+	$(if $(BR2_PACKAGE_PHP_EXT_ZIP),--with-zip) \
 	$(if $(BR2_PACKAGE_PHP_EXT_CTYPE),--enable-ctype) \
 	$(if $(BR2_PACKAGE_PHP_EXT_FILTER),--enable-filter) \
 	$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
