Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3B3D70DED
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D545406A1;
	Thu, 28 Nov 2024 20:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDJgebQVASx5; Thu, 28 Nov 2024 20:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6508D406AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6508D406AA;
	Thu, 28 Nov 2024 20:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A55B1A6A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86359820A6
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqK6-lINqbUT for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB828820A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB828820A3
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:16:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D69CD8674C; Thu, 28 Nov 2024 20:16:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Nov 2024 20:11:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b03dc5b615b217ea3246caa5f94de5e62ec17a8a
X-Git-Newrev: cc77be28fc030f8583a4a7f9f724d0fc9543dba5
X-Patchwork-Hint: ignore
Message-Id: <20241128201655.D69CD8674C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/postgresql: bump
 version to 17.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc77be28fc030f8583a4a7f9f724d0fc9543dba5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://www.postgresql.org/about/news/postgresql-172-166-1510-1415-1318-and-1222-released-2965/

- Use meson build system and drop automake quirks.

- Since commit https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=68a4b58eca032916e2aad78d63f717dcb147e906
  BR2_TOOLCHAIN_HAS_THREADS_NPTL is mandatory dependency

- Since commit https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=8d9a9f034e925568342c7ccfd8d351a3cd20e7f3
  BR2_ENABLE_LOCALE is mandatory dependency

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Julien:
  - add dependencies to host-bison and host-flex
  - remove extra empty lines
  - add -Dspinlocks=true
  - add -Dreadline=enabled
  - fix --Dreadline=disabled extra dash
  - add -Dzlib=enabled
  - add -Dssl=none
]
Signed-off-by: Julien Olivain <ju.o@free.fr>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bandwidthd/Config.in                       |  5 +-
 package/collectd/Config.in                         |  4 +
 package/lighttpd/Config.in                         |  3 +
 package/php/Config.ext                             |  8 +-
 package/poco/Config.in                             |  4 +
 .../0001-Fix-compile-without-threads.patch         | 87 ----------------------
 package/postgresql/Config.in                       |  9 ++-
 package/postgresql/postgresql.hash                 |  4 +-
 package/postgresql/postgresql.mk                   | 78 ++++++++-----------
 package/python-psycopg2/Config.in                  |  4 +
 package/qt5/qt5base/Config.in                      |  4 +-
 package/qt6/qt6base/Config.in                      | 10 ++-
 package/zabbix/Config.in                           |  3 +
 13 files changed, 77 insertions(+), 146 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index e2a6f1acb1..b0485ef957 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -34,8 +34,11 @@ if BR2_PACKAGE_BANDWIDTHD
 
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
-	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 39c0d352e5..6568aa1d7b 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -475,7 +475,11 @@ config BR2_PACKAGE_COLLECTD_PING
 
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 66532d7dd5..5311f37ae1 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -94,6 +94,9 @@ config BR2_PACKAGE_LIGHTTPD_PGSQL
 	bool "pgsql support"
 	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/php/Config.ext b/package/php/Config.ext
index d5f8659016..609cf17016 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -139,8 +139,10 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 config BR2_PACKAGE_PHP_EXT_PGSQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
@@ -174,8 +176,10 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 9bdef125ad..db1b36964e 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -52,6 +52,10 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 config BR2_PACKAGE_POCO_DATA_PGSQL
 	bool "Data/PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_POSTGRESQL
diff --git a/package/postgresql/0001-Fix-compile-without-threads.patch b/package/postgresql/0001-Fix-compile-without-threads.patch
deleted file mode 100644
index a280df540f..0000000000
--- a/package/postgresql/0001-Fix-compile-without-threads.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 6c71182dde4d37fd70ee8015f61935254ae6f9a6 Mon Sep 17 00:00:00 2001
-From: Maxim Kochetkov <fido_max@inbox.ru>
-Date: Thu, 19 Sep 2024 10:04:05 +0300
-Subject: [PATCH] Fix compile without threads
-
-All mutexes should be wrapped by #ifdef ENABLE_THREAD_SAFETY.
-
-Fixes: https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=52afe563206e753f4c45c014fee2459ad0855826
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Signed-off-by: Maxim Kochetkov <m.kochetkov@yadro.com>
-Upstream: N/A, as --disable-thread-safety will disappear in PostgreSQL 17.
----
- src/interfaces/ecpg/ecpglib/misc.c | 6 ++++++
- src/interfaces/libpq/fe-misc.c     | 6 ++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/src/interfaces/ecpg/ecpglib/misc.c b/src/interfaces/ecpg/ecpglib/misc.c
-index 4b54322926..5a4d2e847e 100644
---- a/src/interfaces/ecpg/ecpglib/misc.c
-+++ b/src/interfaces/ecpg/ecpglib/misc.c
-@@ -538,7 +538,9 @@ ecpg_gettext(const char *msgid)
- 	 * might as well do it the same way everywhere.
- 	 */
- 	static volatile bool already_bound = false;
-+#ifdef ENABLE_THREAD_SAFETY
- 	static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
-+#endif
- 
- 	if (!already_bound)
- 	{
-@@ -549,7 +551,9 @@ ecpg_gettext(const char *msgid)
- 		int			save_errno = errno;
- #endif
- 
-+#ifdef ENABLE_THREAD_SAFETY
- 		(void) pthread_mutex_lock(&binddomain_mutex);
-+#endif
- 
- 		if (!already_bound)
- 		{
-@@ -566,7 +570,9 @@ ecpg_gettext(const char *msgid)
- 			already_bound = true;
- 		}
- 
-+#ifdef ENABLE_THREAD_SAFETY
- 		(void) pthread_mutex_unlock(&binddomain_mutex);
-+#endif
- 
- #ifdef WIN32
- 		SetLastError(save_errno);
-diff --git a/src/interfaces/libpq/fe-misc.c b/src/interfaces/libpq/fe-misc.c
-index 488f7d6e55..2185e0ba7a 100644
---- a/src/interfaces/libpq/fe-misc.c
-+++ b/src/interfaces/libpq/fe-misc.c
-@@ -1232,7 +1232,9 @@ libpq_binddomain(void)
- 	 * might as well do it the same way everywhere.
- 	 */
- 	static volatile bool already_bound = false;
-+#ifdef ENABLE_THREAD_SAFETY
- 	static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
-+#endif
- 
- 	if (!already_bound)
- 	{
-@@ -1243,7 +1245,9 @@ libpq_binddomain(void)
- 		int			save_errno = errno;
- #endif
- 
-+#ifdef ENABLE_THREAD_SAFETY
- 		(void) pthread_mutex_lock(&binddomain_mutex);
-+#endif
- 
- 		if (!already_bound)
- 		{
-@@ -1260,7 +1264,9 @@ libpq_binddomain(void)
- 			already_bound = true;
- 		}
- 
-+#ifdef ENABLE_THREAD_SAFETY
- 		(void) pthread_mutex_unlock(&binddomain_mutex);
-+#endif
- 
- #ifdef WIN32
- 		SetLastError(save_errno);
--- 
-2.45.2
-
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 899907d6a5..06e8646119 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE # locale_t
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	# fails to build in a pure static linking scenario, and
 	# postgresql is unlikely to be used in a pure statically
 	# linked environment.
@@ -32,9 +34,12 @@ config BR2_PACKAGE_POSTGRESQL_FULL
 
 endif
 
-comment "postgresql needs a toolchain w/ dynamic library, wchar"
+comment "postgresql needs a toolchain w/ dynamic library, wchar, locale"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR
+	depends on !BR2_ENABLE_LOCALE
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_STATIC_LIBS
 
 comment "postgresql can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 1d9a9081b7..98246ca9b6 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.4/postgresql-16.4.tar.bz2.sha256
-sha256  971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f  postgresql-16.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.2/postgresql-17.2.tar.bz2.sha256
+sha256  82ef27c0af3751695d7f64e2d963583005fbb6a0c3df63d0e4b42211d7021164  postgresql-17.2.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4021a54300..5ad3cea9e7 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.4
+POSTGRESQL_VERSION = 17.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
@@ -13,59 +13,46 @@ POSTGRESQL_CPE_ID_VENDOR = postgresql
 POSTGRESQL_SELINUX_MODULES = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
-POSTGRESQL_CONF_ENV = \
-	ac_cv_type_struct_sockaddr_in6=yes \
-	pgac_cv_prog_cc_LDFLAGS_EX_BE__Wl___export_dynamic=yes \
-	LIBS=$(TARGET_NLS_LIBS)
-POSTGRESQL_CONF_OPTS = --disable-rpath
-POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+POSTGRESQL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+POSTGRESQL_CONF_OPTS = -Drpath=false
+POSTGRESQL_DEPENDENCIES = \
+	$(TARGET_NLS_DEPENDENCIES) \
+	host-bison \
+	host-flex
 
 # CVE-2017-8806 is related to postgresql-common package
 # It is false positive for postgresql
 POSTGRESQL_IGNORE_CVES += CVE-2017-8806
 
-# https://www.postgresql.org/docs/11/static/install-procedure.html:
-# "If you want to invoke the build from another makefile rather than
-# manually, you must unset MAKELEVEL or set it to zero"
-POSTGRESQL_MAKE_OPTS = MAKELEVEL=0
-
 ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
-POSTGRESQL_MAKE_OPTS += world
+POSTGRESQL_NINJA_OPTS += world
 POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
 POSTGRESQL_INSTALL_STAGING_OPTS += DESTDIR=$(STAGING_DIR) install-world
 endif
 
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-# PostgreSQL does not build against uClibc with locales
-# enabled, due to an uClibc bug, see
-# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
-# so overwrite automatic detection and disable locale support
-POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
-endif
-
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
-POSTGRESQL_CONF_OPTS += --disable-thread-safety
-endif
-
 ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_riscv)$(BR2_xtensa),y)
-POSTGRESQL_CONF_OPTS += --disable-spinlocks
+POSTGRESQL_CONF_OPTS += -Dspinlocks=false
+else
+POSTGRESQL_CONF_OPTS += -Dspinlocks=true
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 POSTGRESQL_DEPENDENCIES += readline
+POSTGRESQL_CONF_OPTS += -Dreadline=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-readline
+POSTGRESQL_CONF_OPTS += -Dreadline=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 POSTGRESQL_DEPENDENCIES += zlib
+POSTGRESQL_CONF_OPTS += -Dzlib=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-zlib
+POSTGRESQL_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TZDATA),y)
 POSTGRESQL_DEPENDENCIES += tzdata
-POSTGRESQL_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
+POSTGRESQL_CONF_OPTS += -Dsystem_tzdata=/usr/share/zoneinfo
 else
 POSTGRESQL_DEPENDENCIES += host-zic
 POSTGRESQL_CONF_ENV += ZIC="$(ZIC)"
@@ -73,56 +60,53 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 POSTGRESQL_DEPENDENCIES += openssl
-POSTGRESQL_CONF_OPTS += --with-openssl
+POSTGRESQL_CONF_OPTS += -Dssl=openssl
 else
-# PostgreSQL checks for /dev/urandom and fails if it's being cross-compiled and
-# an SSL library isn't found. Since /dev/urandom is guaranteed to be provided
-# on Linux systems, explicitly tell the configure script it's available.
-POSTGRESQL_CONF_ENV += ac_cv_file__dev_urandom=yes
+POSTGRESQL_CONF_OPTS += -Dssl=none
 endif
 
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 POSTGRESQL_DEPENDENCIES += openldap
-POSTGRESQL_CONF_OPTS += --with-ldap
+POSTGRESQL_CONF_OPTS += -Dldap=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-ldap
+POSTGRESQL_CONF_OPTS += -Dldap=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 POSTGRESQL_DEPENDENCIES += icu
-POSTGRESQL_CONF_OPTS += --with-icu
+POSTGRESQL_CONF_OPTS += -Dicu=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-icu
+POSTGRESQL_CONF_OPTS += -Dicu=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 POSTGRESQL_DEPENDENCIES += libxml2
-POSTGRESQL_CONF_OPTS += --with-libxml
+POSTGRESQL_CONF_OPTS += -Dlibxml=enabled
 POSTGRESQL_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
 else
-POSTGRESQL_CONF_OPTS += --without-libxml
+POSTGRESQL_CONF_OPTS += -Dlibxml=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 POSTGRESQL_DEPENDENCIES += host-pkgconf zstd
-POSTGRESQL_CONF_OPTS += --with-zstd
+POSTGRESQL_CONF_OPTS += -Dzstd=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-zstd
+POSTGRESQL_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
 POSTGRESQL_DEPENDENCIES += host-pkgconf lz4
-POSTGRESQL_CONF_OPTS += --with-lz4
+POSTGRESQL_CONF_OPTS += -Dlz4=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-lz4
+POSTGRESQL_CONF_OPTS += -Dlz4=disabled
 endif
 
 # required for postgresql.service Type=notify
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 POSTGRESQL_DEPENDENCIES += systemd
-POSTGRESQL_CONF_OPTS += --with-systemd
+POSTGRESQL_CONF_OPTS += -Dsystemd=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-systemd
+POSTGRESQL_CONF_OPTS += -Dsystemd=disabled
 endif
 
 POSTGRESQL_CFLAGS = $(TARGET_CFLAGS)
@@ -165,4 +149,4 @@ define POSTGRESQL_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/postgresql.service
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 4aa86c7690..307c072bd3 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 6e6a7cf984..16a17dfc27 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -72,8 +72,10 @@ config BR2_PACKAGE_QT5BASE_MYSQL
 config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
 	depends on BR2_USE_MMU # postgresql
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 3b15d40c83..96a0416dbd 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -200,10 +200,12 @@ comment "MySQL plugin needs a toolchain w/ C++, threads"
 
 config BR2_PACKAGE_QT6BASE_PSQL
 	bool "PostgreSQL Plugin"
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_USE_MMU # postgresql
+	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL plugin
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 4940f8ca8e..226bce51ba 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -40,7 +40,10 @@ config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
 
 config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
 	bool "postgresql"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
 	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
