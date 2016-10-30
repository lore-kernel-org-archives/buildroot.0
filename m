From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Oct 2016 09:21:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/mysql: fix SITE url, add sha256 hash
Message-ID: <20161030082101.23998-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mysql/mysql.hash | 2 ++
 package/mysql/mysql.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mysql/mysql.hash b/package/mysql/mysql.hash
index 84f3361..bc309ec 100644
--- a/package/mysql/mysql.hash
+++ b/package/mysql/mysql.hash
@@ -1,2 +1,4 @@
 # From https://downloads.mariadb.com/archives/mysql-5.1/mysql-5.1.73.tar.gz.md5
 md5	887f869bcc757957067b9198f707f32f	mysql-5.1.73.tar.gz
+# Locally computed
+sha256 05ebe21305408b24407d14b77607a3e5ffa3c300e03f1359d3066f301989dcb5  mysql-5.1.73.tar.gz
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 92bf45a..ea330f2 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -7,7 +7,7 @@
 MYSQL_VERSION_MAJOR = 5.1
 MYSQL_VERSION = $(MYSQL_VERSION_MAJOR).73
 MYSQL_SOURCE = mysql-$(MYSQL_VERSION).tar.gz
-MYSQL_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_VERSION_MAJOR)
+MYSQL_SITE = http://dev.mysql.com/get/Downloads/MySQL-$(MYSQL_VERSION_MAJOR)
 MYSQL_INSTALL_STAGING = YES
 MYSQL_DEPENDENCIES = readline ncurses
 MYSQL_AUTORECONF = YES
-- 
2.10.1
