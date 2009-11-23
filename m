From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 15:10:53 +0100
Subject: [Buildroot] [git commit master] php: fix pdo sqlite compilation
	with !BR2_LARGEFILE
Message-ID: <20091123141346.E14BF777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bba2fd540bc211bbcea1ad1dfc552fe32021097d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar fix as with the sqlite package.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 2668774..eaf39c3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -156,6 +156,9 @@ else
 	PHP_CONF_OPT += --with-pdo-sqlite
 endif
 	PHP_CONF_ENV += CFLAGS+=" -DSQLITE_OMIT_LOAD_EXTENSION"
+ifneq ($(BR2_LARGEFILE),y)
+	PHP_CONF_ENV += CFLAGS+=" -DSQLITE_DISABLE_LFS"
+endif
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
 	PHP_CONF_OPT += --with-pdo-mysql=$(STAGING_DIR)/usr
-- 
1.6.3.3
