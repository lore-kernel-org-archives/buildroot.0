From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 22:56:13 +0200
Subject: [Buildroot] [git commit] qt,
	php: selecting mysql requires depending on MMU
Message-ID: <20130429205838.9C4CD9B8E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=331b14a2aede9259e5b0db20336a371ec223aff2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mysql_client package is only available on architectures having a
MMU, so all packages that are selecting mysql_client should depend on
BR2_USE_MMU.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/Config.ext   |    3 +++
 package/qt/Config.sql.in |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 2cf71d3..006d7dd 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -105,6 +105,7 @@ config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
 config BR2_PACKAGE_PHP_EXT_MYSQL
 	bool "Mysql"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  MySQL support
@@ -112,6 +113,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQL
 config BR2_PACKAGE_PHP_EXT_MYSQLI
 	bool "Mysqli"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	select BR2_PACKAGE_PHP_EXT_MYSQL
 	help
@@ -127,6 +129,7 @@ if BR2_PACKAGE_PHP_EXT_PDO
 config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	bool "MySQL"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  PDO driver for MySQL
diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index eceb15d..04489c7 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_QT_MYSQL
 	select BR2_PACKAGE_MYSQL_CLIENT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
+	depends on BR2_USE_MMU # mysql
 	help
 	  Build MySQL driver
 	  If unsure, say n.
