From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 17:41:58 +0100
Subject: [Buildroot] [git commit] package/libodb-mysql: fix static build
 with per-package directories
Message-ID: <20201231162440.341E68350E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3635ddda424c7b0d4c8f275de6db6f70219b2d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ba2c5ef1bb54c2751569f79beef21ff486348469

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libodb-mysql/libodb-mysql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index 835e5bc6bf..a9040c65f8 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -12,6 +12,6 @@ LIBODB_MYSQL_INSTALL_STAGING = YES
 LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
 LIBODB_MYSQL_DEPENDENCIES = libodb mysql
-LIBODB_MYSQL_CONF_ENV = LIBS="$(shell $(STAGING_DIR)/usr/bin/mysql_config --libs)"
+LIBODB_MYSQL_CONF_ENV = LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
 
 $(eval $(autotools-package))
