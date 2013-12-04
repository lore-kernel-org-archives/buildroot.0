From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Dec 2013 15:23:47 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.8.1
Message-ID: <1386181427-9745-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/Config.in | 8 +++-----
 package/sqlite/sqlite.mk | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 8766786..fe6cc08 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -6,9 +6,10 @@ config BR2_PACKAGE_SQLITE
 
 	  http://www.sqlite.org/
 
+if BR2_PACKAGE_SQLITE
+
 config BR2_PACKAGE_SQLITE_READLINE
 	bool "Command-line editing"
-	depends on BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
@@ -16,7 +17,6 @@ config BR2_PACKAGE_SQLITE_READLINE
 
 config BR2_PACKAGE_SQLITE_STAT3
 	bool "Additional query optimizations (stat3)"
-	depends on BR2_PACKAGE_SQLITE
 	help
 	  Adds additional logic to the ANALYZE command and to the query
 	  planner that can help SQLite to choose a better query plan under
@@ -24,7 +24,6 @@ config BR2_PACKAGE_SQLITE_STAT3
 
 config BR2_PACKAGE_SQLITE_ENABLE_FTS3
 	bool "Enable version 3 of the full-text search engine"
-	depends on BR2_PACKAGE_SQLITE
 	help
 	  When this option is defined in the amalgamation
 	  (see http://www.sqlite.org/amalgamation.html), version 3 of
@@ -32,7 +31,6 @@ config BR2_PACKAGE_SQLITE_ENABLE_FTS3
 
 config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
 	bool "Enable sqlite3_unlock_notify() interface"
-	depends on BR2_PACKAGE_SQLITE
 	help
 	  This option enables the sqlite3_unlock_notify() interface and its
 	  accosiated functionality. See the documentation
@@ -40,7 +38,6 @@ config BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
 
 config BR2_PACKAGE_SQLITE_SECURE_DELETE
 	bool "Set the secure_delete pragma on by default"
-	depends on BR2_PACKAGE_SQLITE
 	help
 	  This compile-time option changes the default settings of the
 	  secure_delete pragma. When this option is not used, secure_delete
@@ -56,3 +53,4 @@ config BR2_PACKAGE_SQLITE_SECURE_DELETE
 	  http://www.sqlite.org/pragma.html#pragma_secure_delete
 	  for additional information.
 
+endif
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c20e782..39b1777 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080002
+SQLITE_VERSION = 3080100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2013
 SQLITE_LICENSE = Public domain
-- 
1.8.3.2
