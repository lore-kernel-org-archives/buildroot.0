From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 08:54:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/oracle-mysql: use
 bundled GPL-2.0+ libreadline
Message-ID: <20191119074645.ED7D18F2C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddaeec1038f14a4e88fc465e38cd8a3ee40bf79b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

oracle-mysql is licensed under GPL-2.0, which is not license compatible with
modern readline (GPL-3.0+), so instead use the bundled older version
(GPL-2.0+ licensed) of readline instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 11e75a714567e2b02ddeb0bb40809a163619684a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mysql/Config.in              | 1 -
 package/oracle-mysql/oracle-mysql.mk | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index d3f9f1f00d..ef4a9531a7 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -37,7 +37,6 @@ comment "mariadb needs a toolchain w/ dynamic library"
 config BR2_PACKAGE_ORACLE_MYSQL
 	bool "oracle mysql"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_HAS_MYSQL
 	help
 	  The MySQL Open Source Database System
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 0275a8428f..326fbcc040 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -9,7 +9,7 @@ ORACLE_MYSQL_VERSION = $(ORACLE_MYSQL_VERSION_MAJOR).73
 ORACLE_MYSQL_SOURCE = mysql-$(ORACLE_MYSQL_VERSION).tar.gz
 ORACLE_MYSQL_SITE = http://dev.mysql.com/get/Downloads/MySQL-$(ORACLE_MYSQL_VERSION_MAJOR)
 ORACLE_MYSQL_INSTALL_STAGING = YES
-ORACLE_MYSQL_DEPENDENCIES = readline ncurses
+ORACLE_MYSQL_DEPENDENCIES = ncurses
 ORACLE_MYSQL_AUTORECONF = YES
 ORACLE_MYSQL_LICENSE = GPL-2.0
 ORACLE_MYSQL_LICENSE_FILES = README COPYING
@@ -33,7 +33,7 @@ ORACLE_MYSQL_CONF_OPTS = \
 	--without-docs \
 	--without-man \
 	--without-libedit \
-	--without-readline \
+	--with-readline \
 	--with-low-memory \
 	--enable-thread-safe-client \
 	--with-unix-socket-path=$(MYSQL_SOCKET) \
