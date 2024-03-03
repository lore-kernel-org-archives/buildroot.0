Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE782C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 20:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B008407CD;
	Sun,  3 Mar 2024 20:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W36Jmz3ZAr3O; Sun,  3 Mar 2024 20:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0AD5407C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0AD5407C2;
	Sun,  3 Mar 2024 20:46:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76DBC1BF340
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64CF781DEB
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O05QtsrkLro4 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 20:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F9E481DA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9E481DA0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F9E481DA0
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 20:46:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E99381BF203;
 Sun,  3 Mar 2024 20:46:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rgsjL-00BtuU-2Q;
 Sun, 03 Mar 2024 21:46:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 21:46:41 +0100
Message-Id: <20240303204642.2836507-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240303204642.2836507-1-peter@korsgaard.com>
References: <20240303204642.2836507-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 2/2] package: drop mysql virtual package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christopher McCrory <chrismcc@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 David GOUARIN <dgouarin@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>, Kamel Bouhara <kamel.bouhara@gmail.com>,
 Alexey Lukyanchuk <skif@skif-web.ru>, Simon Dawson <spdawson@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that oracle-mysql is dropped there isn't any need for the mysql virtual
package.

Adjust the other packages to directly use the mariadb symbols.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                              |  8 +++++
 package/Config.in                             |  2 +-
 package/apr-util/apr-util.mk                  |  4 +--
 package/collectd/Config.in                    |  2 +-
 package/collectd/collectd.mk                  |  4 +--
 package/cppdb/Config.in                       |  4 +--
 package/cppdb/cppdb.mk                        |  4 +--
 package/dovecot/Config.in                     |  6 ++--
 package/dovecot/dovecot.mk                    |  2 +-
 .../freeradius-server/freeradius-server.mk    |  4 +--
 package/gerbera/gerbera.mk                    |  4 +--
 package/kodi/Config.in                        |  2 +-
 package/kodi/kodi.mk                          |  2 +-
 package/libdbi-drivers/libdbi-drivers.mk      |  4 +--
 package/libodb-mysql/Config.in                |  4 +--
 package/libodb-mysql/libodb-mysql.mk          |  2 +-
 package/lighttpd/lighttpd.mk                  |  2 +-
 package/linknx/linknx.mk                      |  4 +--
 package/{mysql => mariadb}/Config.in          | 36 +++----------------
 package/mariadb/mariadb.mk                    |  1 -
 package/motion/motion.mk                      |  4 +--
 package/mysql/mysql.mk                        |  7 ----
 package/open2300/open2300.mk                  |  4 +--
 package/perl-dbd-mysql/Config.in              |  2 +-
 package/perl-dbd-mysql/perl-dbd-mysql.mk      |  2 +-
 package/poco/Config.in                        |  2 +-
 package/poco/poco.mk                          |  2 +-
 package/pure-ftpd/pure-ftpd.mk                |  4 +--
 package/qt5/qt5base/Config.in                 |  2 +-
 package/qt5/qt5base/qt5base.mk                |  2 +-
 package/qt6/qt6base/Config.in                 |  2 +-
 package/qt6/qt6base/qt6base.mk                |  2 +-
 package/rsyslog/rsyslog.mk                    |  4 +--
 package/sconeserver/Config.in                 |  2 +-
 package/sconeserver/sconeserver.mk            |  2 +-
 package/strongswan/Config.in                  |  2 +-
 package/strongswan/strongswan.mk              |  2 +-
 package/tcl/tcl.mk                            |  4 +--
 package/ulogd/ulogd.mk                        |  4 +--
 package/zabbix/Config.in                      |  2 +-
 package/zabbix/zabbix.mk                      |  2 +-
 41 files changed, 66 insertions(+), 94 deletions(-)
 rename package/{mysql => mariadb}/Config.in (63%)
 delete mode 100644 package/mysql/mysql.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 918f5075af..1b15d25d6b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_PACKAGE_MYSQL
+	bool "mysql virtual package removed"
+	select BR2_LEGACY
+	help
+	  The mysql virtual package has been removed as mariadb is the
+	  only supported mysql variant. Use the mariadb package
+	  instead.
+
 config BR2_PACKAGE_ORACLE_MYSQL
 	bool "oracle mysql removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..33039331f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1587,8 +1587,8 @@ menu "Database"
 	source "package/libodb-mysql/Config.in"
 	source "package/libodb-pgsql/Config.in"
 	source "package/libpqxx/Config.in"
+	source "package/mariadb/Config.in"
 	source "package/mongodb/Config.in"
-	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 if BR2_PACKAGE_POSTGRESQL
 	source "package/osm2pgsql/Config.in"
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 02b6d5e277..477db1c593 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -35,9 +35,9 @@ else
 APR_UTIL_CONF_OPTS += --without-gdbm
 endif
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_MARIADB),y)
 APR_UTIL_CONF_OPTS += --with-mysql="$(STAGING_DIR)/usr"
-APR_UTIL_DEPENDENCIES += mysql
+APR_UTIL_DEPENDENCIES += mariadb
 else
 APR_UTIL_CONF_OPTS += --without-mysql
 endif
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index a0c367c78d..e6d549f81f 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -394,7 +394,7 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_MARIADB
 	help
 	  Connects to a MySQL database and issues a "show status"
 	  command.
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 76f622b8db..b47b2efaba 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -194,7 +194,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
 	$(if $(BR2_PACKAGE_COLLECTD_MQTT),mosquitto) \
-	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql) \
+	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mariadb) \
 	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),libmnl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NGINX),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
@@ -224,7 +224,7 @@ endif
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 COLLECTD_CONF_ENV += LIBLUA_PKG_CONFIG_NAME=luajit
 endif
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_MARIADB),y)
 COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
index ceff0ab76f..1394c1efd8 100644
--- a/package/cppdb/Config.in
+++ b/package/cppdb/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CPPDB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Can be built without them but it's useless
-	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_MARIADB || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
 	help
 	  CppDB is an SQL connectivity library that is designed to
 	  provide platform and Database independent connectivity API
@@ -15,6 +15,6 @@ config BR2_PACKAGE_CPPDB
 	  http://cppcms.com/sql/cppdb/
 
 comment "cppdb needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_MARIADB || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/cppdb/cppdb.mk b/package/cppdb/cppdb.mk
index e73f04e194..d2a901d28b 100644
--- a/package/cppdb/cppdb.mk
+++ b/package/cppdb/cppdb.mk
@@ -12,8 +12,8 @@ CPPDB_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
 CPPDB_LICENSE = BSL-1.0 or MIT
 CPPDB_LICENSE_FILES = LICENSE_1_0.txt MIT.txt
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
-CPPDB_DEPENDENCIES += mysql
+ifeq ($(BR2_PACKAGE_MARIADB),y)
+CPPDB_DEPENDENCIES += mariadb
 else
 CPPDB_CONF_OPTS += -DDISABLE_MYSQL=ON
 endif
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 377fd4dbb8..20b08b62be 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -17,9 +17,9 @@ if BR2_PACKAGE_DOVECOT
 
 config BR2_PACKAGE_DOVECOT_MYSQL
 	bool "mysql support"
-	depends on BR2_INSTALL_LIBSTDCPP # mysql
-	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL
+	depends on BR2_INSTALL_LIBSTDCPP # mariadb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
+	select BR2_PACKAGE_MARIADB
 	help
 	  Enable MySQL support.
 
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 2933401cbc..f90996fdd7 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -83,7 +83,7 @@ endif
 ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL),y)
 DOVECOT_CONF_ENV += MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
 DOVECOT_CONF_OPTS += --with-mysql
-DOVECOT_DEPENDENCIES += mysql
+DOVECOT_DEPENDENCIES += mariadb
 else
 DOVECOT_CONF_OPTS += --without-mysql
 endif
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 1b5751d753..1e8ada6bb9 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -140,9 +140,9 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_cache_memcached
 endif
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_MARIADB),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_mysql
-FREERADIUS_SERVER_DEPENDENCIES += mysql
+FREERADIUS_SERVER_DEPENDENCIES += mariadb
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_mysql
 endif
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index c60d49b0f9..6616a83e74 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -89,8 +89,8 @@ GERBERA_DEPENDENCIES += libupnp
 GERBERA_CONF_OPTS += -DWITH_NPUPNP=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
-GERBERA_DEPENDENCIES += mysql
+ifeq ($(BR2_PACKAGE_MARIADB),y)
+GERBERA_DEPENDENCIES += mariadb
 GERBERA_CONF_OPTS += -DWITH_MYSQL=ON
 else
 GERBERA_CONF_OPTS += -DWITH_MYSQL=OFF
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6b68e6d504..8ad9fdae78 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -198,7 +198,7 @@ comment "nfs support needs a toolchain w/ threads support"
 
 config BR2_PACKAGE_KODI_MYSQL
 	bool "mysql"
-	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_MARIADB
 	help
 	  Enable MySQL support
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index d057eb3f05..eebb48238a 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -216,7 +216,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
 KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=ON
-KODI_DEPENDENCIES += mysql
+KODI_DEPENDENCIES += mariadb
 else
 KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=OFF
 endif
diff --git a/package/libdbi-drivers/libdbi-drivers.mk b/package/libdbi-drivers/libdbi-drivers.mk
index af8db79581..a6ff9d9cfe 100644
--- a/package/libdbi-drivers/libdbi-drivers.mk
+++ b/package/libdbi-drivers/libdbi-drivers.mk
@@ -15,8 +15,8 @@ LIBDBI_DRIVERS_AUTORECONF = YES
 
 LIBDBI_DRIVERS_CONF_OPTS = --with-dbi-libdir=$(STAGING_DIR)/usr/lib
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
-LIBDBI_DRIVERS_DEPENDENCIES += mysql
+ifeq ($(BR2_PACKAGE_MARIADB),y)
+LIBDBI_DRIVERS_DEPENDENCIES += mariadb
 LIBDBI_DRIVERS_CONF_OPTS += --with-mysql
 LIBDBI_DRIVERS_CONF_ENV += MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
 else
diff --git a/package/libodb-mysql/Config.in b/package/libodb-mysql/Config.in
index d606165f9b..5645ccbbfb 100644
--- a/package/libodb-mysql/Config.in
+++ b/package/libodb-mysql/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBODB_MYSQL
 	bool "libodb-mysql"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_MYSQL
+	depends on BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_LIBODB
 	help
 	  This package contains the MySQL ODB runtime library. Every
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBODB_MYSQL
 
 comment "libodb-mysql needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_MYSQL
+	depends on BR2_PACKAGE_MARIADB
diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index 88b6f4cb31..427224dfb0 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -11,7 +11,7 @@ LIBODB_MYSQL_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_MYSQL_VE
 LIBODB_MYSQL_INSTALL_STAGING = YES
 LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
-LIBODB_MYSQL_DEPENDENCIES = libodb mysql
+LIBODB_MYSQL_DEPENDENCIES = libodb mariadb
 LIBODB_MYSQL_CONF_ENV = \
 	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
 	LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 91877f8aae..5109e3cebb 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -73,7 +73,7 @@ LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_MYSQL),y)
-LIGHTTPD_DEPENDENCIES += mysql
+LIGHTTPD_DEPENDENCIES += mariadb
 LIGHTTPD_CONF_OPTS += -Dwith_mysql=enabled
 else
 LIGHTTPD_CONF_OPTS += -Dwith_mysql=disabled
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index dcfcd5e3f5..683e0c49cb 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -49,9 +49,9 @@ else
 LINKNX_CONF_OPTS += --without-lua
 endif
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_MARIADB),y)
 LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
-LINKNX_DEPENDENCIES += mysql
+LINKNX_DEPENDENCIES += mariadb
 else
 LINKNX_CONF_OPTS += --without-mysql
 endif
diff --git a/package/mysql/Config.in b/package/mariadb/Config.in
similarity index 63%
rename from package/mysql/Config.in
rename to package/mariadb/Config.in
index 3257253166..d19495bf50 100644
--- a/package/mysql/Config.in
+++ b/package/mariadb/Config.in
@@ -1,22 +1,9 @@
-config BR2_PACKAGE_MYSQL
-	bool "mysql support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  Select the desired mysql provider.
-
-if BR2_PACKAGE_MYSQL
-
-choice
-	prompt "mysql variant"
-	help
-	  Select either the oracle mysql server or the mariadb server
-
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
 	depends on BR2_INSTALL_LIBSTDCPP # fmt
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_LIBAIO
@@ -33,13 +20,11 @@ config BR2_PACKAGE_MARIADB
 
 	  http://www.mariadb.org/
 
-comment "mariadb needs a toolchain w/ dynamic library, C++, wchar"
+comment "mariadb needs a toolchain w/ dynamic library, C++, threads, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_USE_WCHAR
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 
-endchoice
-
 if BR2_PACKAGE_MARIADB
 
 config BR2_PACKAGE_MARIADB_SERVER
@@ -54,16 +39,3 @@ config BR2_PACKAGE_MARIADB_SERVER_EMBEDDED
 	  Install the mariadb embedded server on the target.
 
 endif
-
-config BR2_PACKAGE_HAS_MYSQL
-	bool
-
-config BR2_PACKAGE_PROVIDES_MYSQL
-	string
-	default "mariadb"      if BR2_PACKAGE_MARIADB
-
-endif
-
-comment "mysql needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 7f3755892a..8641437d4d 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -13,7 +13,6 @@ MARIADB_LICENSE_FILES = README.md COPYING
 MARIADB_CPE_ID_VENDOR = mariadb
 MARIADB_SELINUX_MODULES = mysql
 MARIADB_INSTALL_STAGING = YES
-MARIADB_PROVIDES = mysql
 MARIADB_CONFIG_SCRIPTS = mysql_config
 
 MARIADB_DEPENDENCIES = \
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index a42c2ad149..ff5e2c1403 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -23,8 +23,8 @@ else
 MOTION_CONF_OPTS += --without-ffmpeg
 endif
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
-MOTION_DEPENDENCIES += mysql
+ifeq ($(BR2_PACKAGE_MARIADB),y)
+MOTION_DEPENDENCIES += mariadb
 MOTION_CONF_OPTS += --with-mysql
 else
 MOTION_CONF_OPTS += --without-mysql
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
deleted file mode 100644
index d65562563d..0000000000
--- a/package/mysql/mysql.mk
+++ /dev/null
@@ -1,7 +0,0 @@
-################################################################################
-#
-# mysql
-#
-################################################################################
-
-$(eval $(virtual-package))
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 9fb7dbc2fd..74f6d720f9 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -15,8 +15,8 @@ OPEN2300_BINS = \
 OPEN2300_CFLAGS = $(TARGET_CFLAGS)
 OPEN2300_LDFLAGS = $(TARGET_LDFLAGS)
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
-OPEN2300_DEPENDENCIES += mysql
+ifeq ($(BR2_PACKAGE_MARIADB),y)
+OPEN2300_DEPENDENCIES += mariadb
 OPEN2300_BINS += mysql2300 mysqlhistlog2300
 OPEN2300_CFLAGS += $(shell $(STAGING_DIR)/usr/bin/mysql_config --cflags)
 OPEN2300_LDFLAGS += $(shell $(STAGING_DIR)/usr/bin/mysql_config --libs)
diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index 55bbc95347..eff76f5b61 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_PERL_DBI # runtime
 	help
 	  A MySQL driver for the Perl5 Database Interface (DBI).
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.mk b/package/perl-dbd-mysql/perl-dbd-mysql.mk
index 98521a78cf..e87e34100a 100644
--- a/package/perl-dbd-mysql/perl-dbd-mysql.mk
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.mk
@@ -9,7 +9,7 @@ PERL_DBD_MYSQL_SOURCE = DBD-mysql-$(PERL_DBD_MYSQL_VERSION).tar.gz
 PERL_DBD_MYSQL_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPTTOFU
 PERL_DBD_MYSQL_DEPENDENCIES = \
 	host-perl-dbi \
-	mysql
+	mariadb
 PERL_DBD_MYSQL_LICENSE = Artistic or GPL-1.0+
 PERL_DBD_MYSQL_LICENSE_FILES = LICENSE
 PERL_DBD_MYSQL_DISTNAME = DBD-mysql
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 820e631966..7cb9987ec7 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -46,7 +46,7 @@ config BR2_PACKAGE_POCO_DATA
 config BR2_PACKAGE_POCO_DATA_MYSQL
 	bool "Data/MySQL"
 	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_POCO_DATA
 
 config BR2_PACKAGE_POCO_DATA_PGSQL
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index f8c2a658de..b1d5a653c4 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -15,7 +15,7 @@ POCO_DEPENDENCIES = \
 	pcre2 \
 	zlib \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql) \
+	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mariadb) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),postgresql) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 138b05ebb4..ffd27d7b99 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -31,9 +31,9 @@ ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 PURE_FTPD_DEPENDENCIES += libsodium
 endif
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_MARIADB),y)
 PURE_FTPD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
-PURE_FTPD_DEPENDENCIES += mysql
+PURE_FTPD_DEPENDENCIES += mariadb
 else
 PURE_FTPD_CONF_OPTS += --without-mysql
 endif
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 0c7ed41c46..6e6a7cf984 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -62,7 +62,7 @@ if BR2_PACKAGE_QT5BASE_SQL
 config BR2_PACKAGE_QT5BASE_MYSQL
 	bool "MySQL Plugin"
 	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index fbd882da21..e173639cca 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -129,7 +129,7 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
 QT5BASE_CONFIGURE_OPTS += -plugin-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
-QT5BASE_DEPENDENCIES   += mysql
+QT5BASE_DEPENDENCIES   += mariadb
 else
 QT5BASE_CONFIGURE_OPTS += -no-sql-mysql
 endif
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 98a7520486..3b15d40c83 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -190,7 +190,7 @@ config BR2_PACKAGE_QT6BASE_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_MARIADB
 	help
 	  Build MySQL plugin
 
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 667dd4133f..6857725ef5 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -313,7 +313,7 @@ QT6BASE_CONF_OPTS += -DFEATURE_sql_db2=OFF -DFEATURE_sql_ibase=OFF -DFEATURE_sql
 
 ifeq ($(BR2_PACKAGE_QT6BASE_MYSQL),y)
 QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=ON
-QT6BASE_DEPENDENCIES += mysql
+QT6BASE_DEPENDENCIES += mariadb
 else
 QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
 endif
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 1919863f4f..dc30a2edcd 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -102,8 +102,8 @@ else
 RSYSLOG_CONF_OPTS += --disable-impcap
 endif
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
-RSYSLOG_DEPENDENCIES += mysql
+ifeq ($(BR2_PACKAGE_MARIADB),y)
+RSYSLOG_DEPENDENCIES += mariadb
 RSYSLOG_CONF_OPTS += --enable-mysql
 RSYSLOG_CONF_ENV += ac_cv_prog_MYSQL_CONFIG=$(STAGING_DIR)/usr/bin/mysql_config
 else
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 0e8a995090..cce21fc860 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -67,7 +67,7 @@ config BR2_PACKAGE_SCONESERVER_MATHS
 config BR2_PACKAGE_SCONESERVER_MYSQL
 	bool "mysql"
 	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_MARIADB
 	help
 	  MySQL module for Sconeserver
 
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 89abc8d3b2..10a0a22597 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -63,7 +63,7 @@ SCONESERVER_CONF_OPTS += -DWITH_MATHS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
-SCONESERVER_DEPENDENCIES += mysql
+SCONESERVER_DEPENDENCIES += mariadb
 SCONESERVER_CONF_OPTS += -DWITH_MYSQL=ON
 else
 SCONESERVER_CONF_OPTS += -DWITH_MYSQL=OFF
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 5231e69ca8..9be5fe177d 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -193,7 +193,7 @@ config BR2_PACKAGE_STRONGSWAN_STROKE
 
 config BR2_PACKAGE_STRONGSWAN_SQL
 	bool "Enable SQL database configuration backend"
-	depends on BR2_PACKAGE_SQLITE || BR2_PACKAGE_MYSQL
+	depends on BR2_PACKAGE_SQLITE || BR2_PACKAGE_MARIADB
 
 config BR2_PACKAGE_STRONGSWAN_BYPASS_LAN
 	bool "Enable BYPASS-LAN plugin"
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 5521fb7dd4..41959793a3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -80,7 +80,7 @@ STRONGSWAN_DEPENDENCIES += \
 ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
 STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_SQLITE),sqlite) \
-	$(if $(BR2_PACKAGE_MYSQL),mysql)
+	$(if $(BR2_PACKAGE_MARIADB),mariadb)
 endif
 
 # disable connmark/forecast until net/if.h vs. linux/if.h conflict resolved
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 1943bc7b27..18171aebd7 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -35,7 +35,7 @@ HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 # We remove the bundled sqlite as we prefer to not use bundled stuff at all.
 define TCL_REMOVE_PACKAGES
 	rm -fr $(@D)/pkgs/sqlite3* \
-		$(if $(BR2_PACKAGE_MYSQL),,$(@D)/pkgs/tdbcmysql*) \
+		$(if $(BR2_PACKAGE_MARIADB),,$(@D)/pkgs/tdbcmysql*) \
 		$(@D)/pkgs/tdbcodbc* \
 		$(if $(BR2_PACKAGE_POSTGRESQL),,$(@D)/pkgs/tdbcpostgres*) \
 		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*)
@@ -74,7 +74,7 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
-	$(if $(BR2_PACKAGE_MYSQL),mysql) \
+	$(if $(BR2_PACKAGE_MARIADB),mariadb) \
 	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql) \
 	zlib
 
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 033acb06c2..2ebf076d9a 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -22,11 +22,11 @@ ULOGD_DEPENDENCIES += libdbi
 else
 ULOGD_CONF_OPTS += --disable-dbi
 endif
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_MARIADB),y)
 ULOGD_CONF_OPTS += \
 	--enable-mysql \
 	--with-mysql-config=$(STAGING_DIR)/usr/bin/mysql_config
-ULOGD_DEPENDENCIES += mysql
+ULOGD_DEPENDENCIES += mariadb
 else
 ULOGD_CONF_OPTS += --disable-mysql
 endif
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index af677f782e..9ac668117d 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -39,7 +39,7 @@ config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
 	bool "mysql"
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_MARIADB
 
 config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
 	bool "postgresql"
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 3b126caa49..76568f5a18 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -107,7 +107,7 @@ ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
 endif
 
 ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
-ZABBIX_DEPENDENCIES += mysql
+ZABBIX_DEPENDENCIES += mariadb
 ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config --without-postgresql
 ZABBIX_DATABASE = mysql
 else ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
