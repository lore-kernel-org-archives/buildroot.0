From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Jun 2009 21:40:23 +0200
Subject: [Buildroot] [git commit] sqlite: bump version
Message-ID: <20090630194637.6235C77625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5818010f92c37cdfa2667bc52616f134bc167148
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closed #333.

 * Refactor the internal representation of SQL expressions so that they
   use less memory on embedded platforms.
 * Reduce the amount of stack space used
 * Fix an 64-bit alignment bug on HP/UX and Sparc
 * The sqlite3_create_function() family of interfaces now return
   SQLITE_MISUSE instead of SQLITE_ERROR when passed invalid parameter
   combinations.
 * When new tables are created using CREATE TABLE ... AS SELECT ... the
   datatype of the columns is the simplified SQLite datatype (TEXT, INT,
   REAL, NUMERIC, or BLOB) instead of a copy of the original datatype
   from the source table.
 * Resolve race conditions when checking for a hot rollback journal.
 * The sqlite3_shutdown() interface frees all mutexes under windows.
 * Enhanced robustness against corrupt database files
 * Continuing improvements to the test suite and fixes to obscure bugs
   and inconsistencies that the test suite improvements are uncovering.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                           |    1 +
 package/database/sqlite/sqlite.mk |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 605d4bd..2d646b7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,6 +3,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#241: device mapper + lvm2: build together
+	#333: Bump sqlite package to 3.6.15
 	#349: update libsoup to version 2.26.2
 	#367: linux kernel compile error for arm926t
 	#373: Support for building gstreamer without libxml
diff --git a/package/database/sqlite/sqlite.mk b/package/database/sqlite/sqlite.mk
index 9f10f1e..9bceee2 100644
--- a/package/database/sqlite/sqlite.mk
+++ b/package/database/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.13
-SQLITE_SOURCE = sqlite-$(SQLITE_VERSION).tar.gz
+SQLITE_VERSION = 3.6.15
+SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
 SQLITE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-- 
1.6.3.3
