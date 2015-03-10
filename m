From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 20:59:44 +0100
Subject: [Buildroot] [PATCH v3 8/8] qt: remove postgresql introduced uclibc
	dependency for the PostgresSQL support
In-Reply-To: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
Message-ID: <1426017584-6096-8-git-send-email-ps.report@gmx.net>
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
 package/qt/Config.sql.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index fd62657..6bf4944 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -31,14 +31,10 @@ config BR2_PACKAGE_QT_ODBC
 config BR2_PACKAGE_QT_PSQL
 	bool "PostgreSQL Driver"
 	select BR2_PACKAGE_POSTGRESQL
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Build PostgreSQL driver
 	  If unsure, say n.
 
-comment "PostgreSQL needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 choice
 	prompt "SQLite 3 support"
 	default BR2_PACKAGE_QT_SQLITE_NONE
-- 
2.1.4
