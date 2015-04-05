From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 15:57:36 +0200
Subject: [Buildroot] [git commit] package/qt: enable unixodbc support
Message-ID: <20150405135759.28D758194D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f33fe4886e2a2b8254fc68aaacdcce316d31a1ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.sql.in |    2 +-
 package/qt/qt.mk         |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 6bf4944..037837f 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_QT_IBASE
 
 config BR2_PACKAGE_QT_ODBC
 	bool "ODBC Driver"
-	depends on BROKEN # libodbc not in BR
+	select BR2_PACKAGE_UNIXODBC
 	help
 	  Build ODBC driver
 	  If unsure, say n.
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 8b5aa17..76acbfc 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -345,6 +345,7 @@ QT_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
 QT_CONFIGURE_OPTS += -qt-sql-odbc
+QT_DEPENDENCIES += unixodbc
 endif
 ifeq ($(BR2_PACKAGE_QT_PSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-psql -psql_config $(STAGING_DIR)/usr/bin/pg_config
