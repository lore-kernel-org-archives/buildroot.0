From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:19:53 +0100
Subject: [Buildroot] [git commit] php: add missing indirect dependency on
	!avr32 for mysql extensions
Message-ID: <20150207202910.7A5458046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ba821c45f1bdd99c27e3599e2b201bb15e47401
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fix the comment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 241e4a9..2b1e615 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -106,6 +106,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	depends on !BR2_avr32 # mysql
 	select BR2_PACKAGE_MYSQL
 	help
 	  MySQL support
@@ -115,6 +116,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	depends on !BR2_avr32 # mysql
 	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_PHP_EXT_MYSQL
 	help
@@ -132,13 +134,15 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	depends on !BR2_avr32 # mysql
 	select BR2_PACKAGE_MYSQL
 	help
 	  PDO driver for MySQL
 
-comment "MySQL drivers need a toolchain w/ C++"
+comment "MySQL drivers need a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32
 
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
