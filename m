From: bradford barr <bradford.barr@gmail.com>
Date: Mon, 26 Jun 2017 09:17:44 -0700
Subject: [Buildroot] [PATCH 1/1] sqlite: add json1 support
Message-ID: <20170626161744.11355-1-bradford.barr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: bradford barr <bradford@density.io>

Add support for the JSON1 SQLite extensions. This extension allows SQLite to
store and query JSON objects in a database.

Signed-off-by: bradford barr <bradford.barr@gmail.com>
Signed-off-by: bradford barr <bradford@density.io>
---
 package/sqlite/Config.in | 6 ++++++
 package/sqlite/sqlite.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index c9fde53..cc8f328 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -22,6 +22,12 @@ config BR2_PACKAGE_SQLITE_ENABLE_FTS3
 	  (see http://www.sqlite.org/amalgamation.html), version 3 of
 	  the full-text search engine is added to the build automatically.
 
+config BR2_PACKAGE_SQLITE_ENABLE_JSON1
+	bool "Enable the JSON extensions for SQLite"
+	help
+	  When this option is defined in the amalgamation, the JSON extensions
+	  are added to the build automatically.
+
 config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
 	bool "Enable sqlite3_unlock_notify() interface"
 	help
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 7b9c897..f6b249d 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -19,6 +19,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
+SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
 endif
-- 
2.9.3
