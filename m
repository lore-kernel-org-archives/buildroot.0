From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Mar 2015 17:49:42 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/qt: enable unixodbc support
In-Reply-To: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1425660584-25189-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/qt/Config.sql.in |    2 +-
 package/qt/qt.mk         |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index fd62657..81337a1 100644
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
index 3fb557f..1612f5d 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -359,6 +359,7 @@ QT_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
 QT_CONFIGURE_OPTS += -qt-sql-odbc
+QT_DEPENDENCIES += unixodbc
 endif
 ifeq ($(BR2_PACKAGE_QT_PSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-psql
-- 
1.7.10.4
