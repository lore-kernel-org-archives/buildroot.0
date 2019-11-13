From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 21:47:51 +0100
Subject: [Buildroot] [git commit] package/mariadb: use bundled GPL-2.0+
 libreadline
Message-ID: <20191113205215.B48A38EE90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29cdf119f33538fb90c36e42966c1a7693389190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mariadb is licensed under GPL-2.0, which is not license compatible with
modern readline (GPL-3.0+), so instead use the bundled older version
(GPL-2.0+ licensed) of readline instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mariadb/mariadb.mk | 6 ++++--
 package/mysql/Config.in    | 1 -
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 6a18db48ab..82e3c16daf 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -19,8 +19,10 @@ MARIADB_DEPENDENCIES = \
 	openssl \
 	zlib \
 	libaio \
-	libxml2 \
-	readline
+	libxml2
+
+# use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
+MARIADB_CONF_OPTS += -DWITH_READLINE=ON
 
 # We won't need unit tests
 MARIADB_CONF_OPTS += -DWITH_UNIT_TESTS=0
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 30a82cc91b..d3f9f1f00d 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -22,7 +22,6 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_HAS_MYSQL
 	help
 	  MariaDB is one of the most popular database servers in the
