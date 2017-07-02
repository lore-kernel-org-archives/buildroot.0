From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:59:08 +0200
Subject: [Buildroot] [git commit] sqlite: add json1 support
Message-ID: <20170702215613.B364080641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2538e4b19c055ee99b5328fb606deb47fada06f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the JSON1 SQLite extensions. This extension allows SQLite to
store and query JSON objects in a database.

Signed-off-by: Bradford Barr <bradford@density.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/Config.in | 6 ++++++
 package/sqlite/sqlite.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index c9fde53..eec41c5 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -22,6 +22,12 @@ config BR2_PACKAGE_SQLITE_ENABLE_FTS3
 	  (see http://www.sqlite.org/amalgamation.html), version 3 of
 	  the full-text search engine is added to the build automatically.
 
+config BR2_PACKAGE_SQLITE_ENABLE_JSON1
+	bool "Enable the JSON extensions for SQLite"
+	help
+	  When this option is defined in the amalgamation, the JSON
+	  extensions are added to the build automatically.
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
