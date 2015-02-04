From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:12 +0100
Subject: [Buildroot] [PATCH 14/21] php: add missing indirect dependency on
	!avr32 for mysql extensions
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-15-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fix the comment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/php/Config.ext | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

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
-- 
2.1.4
