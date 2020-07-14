From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 23:49:20 +0200
Subject: [Buildroot] [git commit] package/libodb-mysql: fix static build
Message-ID: <20200714214641.538CC8257B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c858f653d04f97111dc4d3095939b0a14da32056
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use mysql_config to help libodb-mysql to retrieve mysql dependencies
such as -lz

Fixes:
 - http://autobuild.buildroot.org/results/a5447c5105f15606ed562b39ca84c06e7e6b78c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libodb-mysql/libodb-mysql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index 97cbcddf93..835e5bc6bf 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -12,5 +12,6 @@ LIBODB_MYSQL_INSTALL_STAGING = YES
 LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
 LIBODB_MYSQL_DEPENDENCIES = libodb mysql
+LIBODB_MYSQL_CONF_ENV = LIBS="$(shell $(STAGING_DIR)/usr/bin/mysql_config --libs)"
 
 $(eval $(autotools-package))
