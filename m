From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Mar 2015 23:08:10 +0100
Subject: [Buildroot] [PATCH v2 5/5] qt5base: remove postgresql introduced
	uclibc dependency for the PostgresSQL plugin
In-Reply-To: <1425938890-454-1-git-send-email-ps.report@gmx.net>
References: <1425938890-454-1-git-send-email-ps.report@gmx.net>
Message-ID: <1425938890-454-5-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index d57dd8e..e0e7f9f 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -61,14 +61,10 @@ config BR2_PACKAGE_QT5BASE_MYSQL
 config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
 	select BR2_PACKAGE_POSTGRESQL
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Build PostgreSQL plugin
 	  If unsure, say n.
 
-comment "PostgreSQL needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 choice
 	prompt "SQLite 3 support"
 	default BR2_PACKAGE_QT5BASE_SQLITE_NONE
-- 
2.1.4
