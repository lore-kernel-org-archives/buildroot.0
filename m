From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 09:07:35 -0300
Subject: [Buildroot] [PATCH 1/3] mysql: needs mmu
Message-ID: <1356696457-12445-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in     |    3 ++-
 package/mysql_client/Config.in |    1 +
 package/poco/Config.in         |    1 +
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index fe520f8..74419f6 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -212,7 +212,8 @@ config BR2_PACKAGE_COLLECTD_MEMORY
 
 config BR2_PACKAGE_COLLECTD_MYSQL
 	bool "mysql"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP # mysql
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  Connects to a MySQL database and issues a "show status" command.
diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
index f07fdb4..970b9b9 100644
--- a/package/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MYSQL_CLIENT
 	bool "MySQL client"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 36d8de9..20a8f2d 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -51,6 +51,7 @@ config BR2_PACKAGE_POCO_DATA_SQLITE
 
 config BR2_PACKAGE_POCO_DATA_MYSQL
 	bool "mysql"
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_MYSQL_CLIENT
 
-- 
1.7.8.6
