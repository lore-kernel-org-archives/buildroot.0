From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 20:59:41 +0100
Subject: [Buildroot] [PATCH v3 5/8] qt5base: remove postgresql introduced
	uclibc dependency for the PostgresSQL plugin
In-Reply-To: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
Message-ID: <1426017584-6096-5-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 --> v2:
  - added (thanks to Baruch Siach for the hint)
---
 package/qt5/qt5base/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 99e249f..17ed5db 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -60,14 +60,10 @@ config BR2_PACKAGE_QT5BASE_MYSQL
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
