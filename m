From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 21:51:17 +0200
Subject: [Buildroot] [git commit] mysql: disable for AVR32
Message-ID: <20140601200641.0FCD79CE46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bdc60c6b77f825d4e28526b858823db7f6b99ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The compiler can't even build it, fixes:
http://autobuild.buildroot.net/results/b5c/b5c3893accc777d717e1d70283437aa626f0aa2d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in    |    1 +
 package/mysql/Config.in       |    2 ++
 package/poco/Config.in        |    1 +
 package/qt5/qt5base/Config.in |    1 +
 package/sconeserver/Config.in |    1 +
 5 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index f693f31..a2e7877 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -240,6 +240,7 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	depends on !BR2_avr32 # mysql
 	select BR2_PACKAGE_MYSQL
 	help
 	  Connects to a MySQL database and issues a "show status" command.
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 7133892..9c5d6ed 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# Toolchain is not up to the task
+	depends on !BR2_avr32
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
diff --git a/package/poco/Config.in b/package/poco/Config.in
index e8832e8..8384b42 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -55,6 +55,7 @@ config BR2_PACKAGE_POCO_DATA_SQLITE
 config BR2_PACKAGE_POCO_DATA_MYSQL
 	bool "mysql"
 	depends on BR2_USE_MMU # mysql
+	depends on !BR2_avr32 # mysql
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_MYSQL
 
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 5d5b7f6..70ddcd3 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -57,6 +57,7 @@ config BR2_PACKAGE_QT5BASE_MYSQL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	depends on BR2_USE_MMU # mysql
+	depends on !BR2_avr32 # mysql
 	help
 	  Build MySQL plugin
 	  If unsure, say n.
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 0e0b07c..6999535 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
 config BR2_PACKAGE_SCONESERVER_MYSQL
 	bool "mysql"
 	depends on BR2_USE_MMU # mysql
+	depends on !BR2_avr32 # mysql
 	select BR2_PACKAGE_MYSQL
 	help
 	  MySQL module for Sconeserver
