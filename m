From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:28:11 +0100
Subject: [Buildroot] [git commit] qt: remove broken iBase driver
Message-ID: <20170309212905.2A563801E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a603f03f11ef6facd5006cd241696beaad3f1689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option has been marked as broken since 2010. No need for legacy
handling.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: remove dead code in qt.mk, as pointed out by Peter Seiderer.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.sql.in | 7 -------
 package/qt/qt.mk         | 3 ---
 2 files changed, 10 deletions(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 452edd5..5bd63d2 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -14,13 +14,6 @@ config BR2_PACKAGE_QT_MYSQL
 	  Build MySQL driver
 	  If unsure, say n.
 
-config BR2_PACKAGE_QT_IBASE
-	bool "iBase Driver"
-	depends on BROKEN # libfbclient not in BR
-	help
-	  Build iBase driver
-	  If unsure, say n.
-
 config BR2_PACKAGE_QT_ODBC
 	bool "ODBC Driver"
 	select BR2_PACKAGE_UNIXODBC
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 29dcc46..e82bdfe8 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -359,9 +359,6 @@ endif
 
 # Qt SQL Drivers
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
-ifeq ($(BR2_PACKAGE_QT_IBASE),y)
-QT_CONFIGURE_OPTS += -qt-sql-ibase
-endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
 QT_DEPENDENCIES += mysql
