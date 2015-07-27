From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:51:53 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.8.11
Message-ID: <20150727205259.9A30C81933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4aef1bc698e7dacffcdf96ab81e34d724e77eeeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/0001-fix-parallel-build.patch |   22 ----------------------
 package/sqlite/sqlite.hash                   |    2 +-
 package/sqlite/sqlite.mk                     |    2 +-
 3 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/package/sqlite/0001-fix-parallel-build.patch b/package/sqlite/0001-fix-parallel-build.patch
deleted file mode 100644
index 79d80fb..0000000
--- a/package/sqlite/0001-fix-parallel-build.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Use correct dependency in Makefile.am
-
-Depending on a libtool library should be done using the .la name, not on
-the object file.
-
-Fixes hard-to-reproduce parallel build failures, like so:
-    http://autobuild.buildroot.org/results/aed/aed3690689b60844e3278626da3c3eb75f2a2586/build-end.log
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN sqlite-3081000.orig/Makefile.am sqlite-3081000/Makefile.am
---- sqlite-3081000.orig/Makefile.am	2015-05-07 16:59:22.000000000 +0200
-+++ sqlite-3081000/Makefile.am	2015-05-20 23:30:03.878784079 +0200
-@@ -7,7 +7,7 @@
- 
- bin_PROGRAMS = sqlite3
- sqlite3_SOURCES = shell.c sqlite3.h
--sqlite3_LDADD = sqlite3.$(OBJEXT) @READLINE_LIBS@
-+sqlite3_LDADD = libsqlite3.la @READLINE_LIBS@
- 
- include_HEADERS = sqlite3.h sqlite3ext.h
- 
diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 85e9709..1c30137 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	c2f2c17d3dc4c4e179d35cc04e4420636d48a152	sqlite-autoconf-3081002.tar.gz
+sha1	da1322d883548bdb0f6312941b20ed497e3754fa	sqlite-autoconf-3081100.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e4f42af..34eab2b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3081002
+SQLITE_VERSION = 3081100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
