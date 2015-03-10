From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 20:59:43 +0100
Subject: [Buildroot] [PATCH v3 7/8] php: remove postgresql introduced uclibc
	dependency for the PostgresSQL support
In-Reply-To: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
Message-ID: <1426017584-6096-7-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 --> v3:
  - added (thanks to Baruch Siach for the hint)
---
 package/php/Config.ext | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 57685b2..935f966 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -148,14 +148,10 @@ comment "MySQL drivers need a toolchain w/ C++, threads"
 
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  PDO driver for PostgreSQL
 
-comment "PostgreSQL driver needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
 	select BR2_PACKAGE_SQLITE
-- 
2.1.4
