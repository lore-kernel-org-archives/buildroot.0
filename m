From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 19:13:59 +0100
Subject: [Buildroot] [git commit] qt: remove postgresql introduced uclibc
	dependency for the PostgresSQL support
Message-ID: <20150315181408.6F4588073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc96e8a523f1b72ef9c3da095d0e957888090051
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.sql.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
