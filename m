From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 23 Feb 2018 19:38:29 +0100
Subject: [Buildroot] [Patch next v1 2/3] qt5base: fix Qt5.10.1 sqlite plugin
 compile failure
In-Reply-To: <20180223183830.16768-1-ps.report@gmx.net>
References: <20180223183830.16768-1-ps.report@gmx.net>
Message-ID: <20180223183830.16768-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA to gain
access to sqlite3_column_table_name16().

Fixes:

    qt5base-5.10.1/src/plugins/sqldrivers/sqlite/qsql_sqlite.cpp:217: undefined reference to `sqlite3_column_table_name16'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index b5755e2b9c..b9aba2d389 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -103,6 +103,7 @@ config BR2_PACKAGE_QT5BASE_SQLITE_QT
 config BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM
 	bool "System SQLite"
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
 	help
 	  Use system SQLite.
 
-- 
2.16.2
