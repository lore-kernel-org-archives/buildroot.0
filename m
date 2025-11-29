Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47D7CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 17:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91BF560766;
	Sat, 29 Nov 2025 17:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueiUmnAKZ5V1; Sat, 29 Nov 2025 17:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B7B96078A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B7B96078A;
	Sat, 29 Nov 2025 17:54:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 058B31A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9983F60754
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjAMVYirs7ip for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 17:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D43760760
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D43760760
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:54:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E60181E98; Sat, 29 Nov 2025 17:54:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 18:31:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c72c50254b37cb3e7a169133f9449a1fdab26141
X-Git-Newrev: 9e7172ceac1e93a7167031a50edbff813c4b4774
X-Patchwork-Hint: ignore
Message-Id: <20251129175420.8E60181E98@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/postgresql: bump
 version to 18.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e7172ceac1e93a7167031a50edbff813c4b4774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://www.postgresql.org/docs/release/18.0/
https://www.postgresql.org/docs/release/18.1/

Please note that upgrading a PostgreSQL server to a newer major version
requires a manual upgrade not provided by buildroot:
https://www.postgresql.org/docs/18/upgrading.html

Removed configure options for spinlocks:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=e25626677f8076eb3ce94586136c5464ee154381

Upstream removed support for toolchains not providing atomics support:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=81385261362962deb9861b39b509aeffe213721d

Added dependency to !BR2_sparc to disable build with defconfig
bootlin-sparc-uclibc to fix a build error:

../src/include/port/atomics.h:99:2: error:
 #error "could not find an implementation of pg_atomic_uint32"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bandwidthd/Config.in       | 3 +++
 package/collectd/Config.in         | 2 ++
 package/lighttpd/Config.in         | 2 ++
 package/php/Config.ext             | 2 ++
 package/poco/Config.in             | 1 +
 package/postgresql/Config.in       | 2 ++
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 8 +-------
 package/python-psycopg2/Config.in  | 2 ++
 package/qt5/qt5base/Config.in      | 2 ++
 package/qt6/qt6base/Config.in      | 2 ++
 package/zabbix/Config.in           | 1 +
 12 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index b0485ef957..5c2e507737 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -35,6 +35,7 @@ if BR2_PACKAGE_BANDWIDTHD
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -48,9 +49,11 @@ config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	  (github.com/nroach44/bandwidthd) for more information.
 
 comment "postgresql support needs a toolchain w/ dynamic library, wchar"
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "postgresql support can't be built with Optimize for fast"
+	depends on !BR2_sparc
 	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_BANDWIDTHD_SQLITE3
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 6568aa1d7b..127bcace6d 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -476,6 +476,7 @@ config BR2_PACKAGE_COLLECTD_PING
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -489,6 +490,7 @@ config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	  collectd 'value lists'.
 
 comment "postgresql support needs a toolchain w/ wchar"
+	depends on !BR2_sparc
 	depends on !BR2_USE_WCHAR
 
 comment "postgresql support can't be built with Optimize for fast"
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index fe2c7a2815..0168f1d83c 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -122,6 +122,7 @@ config BR2_PACKAGE_LIGHTTPD_PCRE
 config BR2_PACKAGE_LIGHTTPD_PGSQL
 	bool "pgsql support"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -133,6 +134,7 @@ config BR2_PACKAGE_LIGHTTPD_PGSQL
 
 comment "pgsql support needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on !BR2_USE_WCHAR
 
 comment "pgsql support can't be built with Optimize for fast"
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 609cf17016..8cf4a7d160 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -139,6 +139,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 config BR2_PACKAGE_PHP_EXT_PGSQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -150,6 +151,7 @@ config BR2_PACKAGE_PHP_EXT_PGSQL
 
 comment "PostgreSQL extension needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL extension can't be built with Optimize for fast"
diff --git a/package/poco/Config.in b/package/poco/Config.in
index fa23e6aa59..4801b36a24 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 config BR2_PACKAGE_POCO_DATA_PGSQL
 	bool "Data/PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 06e8646119..ebf310a6a1 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_sparc # atomic.h
 	depends on BR2_USE_WCHAR
 	depends on BR2_ENABLE_LOCALE # locale_t
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -36,6 +37,7 @@ endif
 
 comment "postgresql needs a toolchain w/ dynamic library, wchar, locale"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on !BR2_USE_WCHAR
 	depends on !BR2_ENABLE_LOCALE
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index efa1b5e751..524066c61e 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.7/postgresql-17.7.tar.bz2.sha256
-sha256  ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5  postgresql-17.7.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.1/postgresql-18.1.tar.bz2.sha256
+sha256  ff86675c336c46e98ac991ebb306d1b67621ece1d06787beaade312c2c915d54  postgresql-18.1.tar.bz2
 # License file, Locally calculated
 sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 86761bf939..78d7cef4f6 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.7
+POSTGRESQL_VERSION = 18.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
@@ -38,12 +38,6 @@ POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
 POSTGRESQL_INSTALL_STAGING_OPTS += DESTDIR=$(STAGING_DIR) install-world
 endif
 
-ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_riscv)$(BR2_xtensa),y)
-POSTGRESQL_CONF_OPTS += -Dspinlocks=false
-else
-POSTGRESQL_CONF_OPTS += -Dspinlocks=true
-endif
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 POSTGRESQL_DEPENDENCIES += readline
 POSTGRESQL_CONF_OPTS += -Dreadline=enabled
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 8eeeb42692..24eaea6d9c 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -29,6 +30,7 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 
 comment "python-psycopg2 needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "python-psycopg2 can't be built with Optimize for fast"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index c45b8c1591..8f14540eb4 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -72,6 +72,7 @@ config BR2_PACKAGE_QT5BASE_MYSQL
 config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -84,6 +85,7 @@ config BR2_PACKAGE_QT5BASE_PSQL
 
 comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL plugin can't be built with Optimize for fast"
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 7f3948ec27..e6bb99de28 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -202,6 +202,7 @@ comment "MySQL plugin needs a toolchain w/ C++, threads"
 config BR2_PACKAGE_QT6BASE_PSQL
 	bool "PostgreSQL Plugin"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -213,6 +214,7 @@ config BR2_PACKAGE_QT6BASE_PSQL
 
 comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL plugin can't be built with optimize for fast"
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 226bce51ba..c1e8ad62f3 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
 config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
