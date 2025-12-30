Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF0BEE4999
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA4EB40858;
	Tue, 30 Dec 2025 18:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DHTMX9VU_uh; Tue, 30 Dec 2025 18:13:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B75964085C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118380;
	bh=A1nLxdZTzZofzpwr9Qu6COG/jK2yApSxiIYm9rmP1CE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pvG0ejxCYM7KTZbfhcZPItWCGskSdHmylcxT+rCPdRNZ7IT/GJIpxQ1IAF7NnEgua
	 lfcvYT/Wrn92LnO8QHFyiyXFoHMrSfa2/gj6dbDrHGbfQkA2RfK5XQ9hsqLgXfIEFU
	 Jftwv3Hde10tcYK+fhZmlUJ25D7Sml+SUW1SwE5bqYq4eKfQGGETjjUPyYk0ZVX5JF
	 oqqG4NwRVnUdAoRFfH7ekKZmRe5DiRFok7uT7ydy07Zbuj2+Pdtkl5YQbnp2OQ9KWZ
	 tUXWqaJ0FCf5HJKoTudNqhjPPD8a4Ccjjrr/bjAiv8Zq7PhIUZbI9Rap64nwRDArxF
	 7svXWLSGcNznA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B75964085C;
	Tue, 30 Dec 2025 18:13:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CDCD277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFA784062F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY3FXzGsX0cH for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 310D840425
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 310D840425
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3015487C3E; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e12ccc6c5ccf20b7ddd3b007a9c962ac1bfd401
X-Git-Newrev: b7143b2e22dc6d5f6bc0f7fe745118db7dbcb787
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.3015487C3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppdb: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7143b2e22dc6d5f6bc0f7fe745118db7dbcb787
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Analysis of https://sourceforge.net/projects/cppcms/files/cppdb:
last release: Jun 2012
last bug report: 2015
last patch: 2022

The package is broken with cmake 4 and no other package depends on it.

There are no known autobuilder failures for this issue.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  7 ++++++
 package/Config.in                             |  1 -
 package/cppdb/0001-mysql-library-suffix.patch | 23 --------------------
 package/cppdb/Config.in                       | 20 -----------------
 package/cppdb/cppdb.hash                      |  6 ------
 package/cppdb/cppdb.mk                        | 31 ---------------------------
 7 files changed, 7 insertions(+), 82 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a23fbf64a2..99b6841b39 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -271,7 +271,6 @@ package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
 package/connman/S45connman lib_sysv.Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch lib_patch.Upstream
 package/coremark-pro/coremark-pro.sh.in Shellcheck
-package/cppdb/0001-mysql-library-suffix.patch lib_patch.Upstream
 package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch lib_patch.Upstream
 package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch lib_patch.Upstream
 package/cpulimit/0003-Fix-an-infrequent-crash.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ecd22e2194..16807fa196 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_CPPDB
+	bool "cppdb has been removed"
+	select BR2_LEGACY
+	help
+	  cppdb was no longer maintained upstream, and therefore was
+	  removed.
+
 config BR2_PACKAGE_PYTHON_AIOREDIS
 	bool "python-aioredis has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 6ad17c1925..c92a642dcb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1651,7 +1651,6 @@ endmenu
 
 menu "Database"
 	source "package/berkeleydb/Config.in"
-	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
 	source "package/hiredis/Config.in"
 	source "package/kompexsqlite/Config.in"
diff --git a/package/cppdb/0001-mysql-library-suffix.patch b/package/cppdb/0001-mysql-library-suffix.patch
deleted file mode 100644
index e65e3e26b6..0000000000
--- a/package/cppdb/0001-mysql-library-suffix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Add mysql/ to PATH_SUFFIXES for the library search for mysql.
-
-On common distros libmysqlclient* is installed and/or symlinked
-into /usr/lib.
-Since we install the libraries into /usr/lib/mysql alone cppdb
-fails to properly link to it giving runtime errors.
-
-Status: https://sourceforge.net/p/cppcms/bugs/135/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura cppdb-0.3.1.orig/CMakeLists.txt cppdb-0.3.1/CMakeLists.txt
---- cppdb-0.3.1.orig/CMakeLists.txt	2014-10-17 11:05:57.875429748 -0300
-+++ cppdb-0.3.1/CMakeLists.txt	2014-10-17 11:12:57.486775484 -0300
-@@ -196,7 +196,7 @@
- endif()
- 
- if(NOT DISABLE_MYSQL)
--	find_library(MYSQL_LIB mysqlclient)
-+	find_library(MYSQL_LIB mysqlclient PATH_SUFFIXES mysql)
- 	find_path(MYSQL_PATH mysql.h PATH_SUFFIXES mysql)
- 	if(MYSQL_LIB AND MYSQL_PATH)
- 		include_directories(${MYSQL_PATH})
diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
deleted file mode 100644
index 1394c1efd8..0000000000
--- a/package/cppdb/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_CPPDB
-	bool "cppdb"
-	# dlfcn.h
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Can be built without them but it's useless
-	depends on BR2_PACKAGE_MARIADB || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
-	help
-	  CppDB is an SQL connectivity library that is designed to
-	  provide platform and Database independent connectivity API
-	  similarly to what JDBC, ODBC and other connectivity libraries
-	  do.
-
-	  http://cppcms.com/sql/cppdb/
-
-comment "cppdb needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_PACKAGE_MARIADB || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
diff --git a/package/cppdb/cppdb.hash b/package/cppdb/cppdb.hash
deleted file mode 100644
index bca9f55959..0000000000
--- a/package/cppdb/cppdb.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From http://sourceforge.net/projects/cppcms/files/cppdb/0.3.1/
-md5  129f1d75f46114b79160b93807d5223f  cppdb-0.3.1.tar.bz2
-sha1  c0410dcc482d71696ac9206044b3a3ac03d31f96  cppdb-0.3.1.tar.bz2
-# locally computed
-sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
-sha256  503ed52ef942d44bb26bd47dd5c6765927b198624e4f375e32cc660dfc2a0981  MIT.txt
diff --git a/package/cppdb/cppdb.mk b/package/cppdb/cppdb.mk
deleted file mode 100644
index d2a901d28b..0000000000
--- a/package/cppdb/cppdb.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# cppdb
-#
-################################################################################
-
-CPPDB_VERSION = 0.3.1
-CPPDB_SOURCE = cppdb-$(CPPDB_VERSION).tar.bz2
-CPPDB_SITE = http://downloads.sourceforge.net/project/cppcms/cppdb/$(CPPDB_VERSION)
-CPPDB_INSTALL_STAGING = YES
-CPPDB_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
-CPPDB_LICENSE = BSL-1.0 or MIT
-CPPDB_LICENSE_FILES = LICENSE_1_0.txt MIT.txt
-
-ifeq ($(BR2_PACKAGE_MARIADB),y)
-CPPDB_DEPENDENCIES += mariadb
-else
-CPPDB_CONF_OPTS += -DDISABLE_MYSQL=ON
-endif
-
-ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
-CPPDB_DEPENDENCIES += postgresql
-else
-CPPDB_CONF_OPTS += -DDISABLE_PQ=ON
-endif
-
-ifeq ($(BR2_PACKAGE_SQLITE),)
-CPPDB_CONF_OPTS += -DDISABLE_SQLITE=ON
-endif
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
