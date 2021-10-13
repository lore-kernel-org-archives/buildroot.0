Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BCEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:12:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1126E610CE
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1126E610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D1C60BAE;
	Wed, 13 Oct 2021 18:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtxaOyYXPkBX; Wed, 13 Oct 2021 18:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F25ED60C2F;
	Wed, 13 Oct 2021 18:12:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5141BF9C2
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8969B60C33
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKOTvezRNGuj for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:12:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A9E460BAE
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0C3E195608; Wed, 13 Oct 2021 18:09:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:07:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6aac6ebdbbd3873110a9e19de1957e49cb9344e
X-Git-Newrev: ddc6f1199a1b53af60698c2f01ef2e47a17463a7
X-Patchwork-Hint: ignore
Message-Id: <20211013180931.0C3E195608@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdbi-drivers: new package
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2350514077156691486=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2350514077156691486==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ddc6f1199a1b53af60698c2f01ef2e47a17463a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libdbi-drivers project provides the database-specific drivers
for the libdbi framework

http://libdbi-drivers.sourceforge.net/

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 ...YSQL_CONFIG-variable-instead-of-mysql_con.patch | 47 +++++++++++++++++++++
 package/libdbi-drivers/Config.in                   |  8 ++++
 package/libdbi-drivers/libdbi-drivers.hash         |  3 ++
 package/libdbi-drivers/libdbi-drivers.mk           | 48 ++++++++++++++++++++++
 6 files changed, 109 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index edf15041d7..d5929685ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1152,6 +1152,7 @@ F:	package/json-glib/
 N:	Hervé Codina <herve.codina@bootlin.com>
 F:	package/dtbocfg/
 F:	package/libdbi/
+F:	package/libdbi-drivers/
 F:	package/lua-augeas/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
@@ -1990,6 +1991,7 @@ F:	configs/galileo_defconfig
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
 F:	package/libdbi/
+F:	package/libdbi-drivers/
 F:	package/lua-augeas/
 F:	package/php-xdebug/
 F:	package/python-augeas/
diff --git a/package/Config.in b/package/Config.in
index 51a837cdf6..b391177785 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1416,6 +1416,7 @@ menu "Database"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
 	source "package/libdbi/Config.in"
+	source "package/libdbi-drivers/Config.in"
 	source "package/libgit2/Config.in"
 	source "package/libmdbx/Config.in"
 	source "package/libodb/Config.in"
diff --git a/package/libdbi-drivers/0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch b/package/libdbi-drivers/0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch
new file mode 100644
index 0000000000..66e99c430f
--- /dev/null
+++ b/package/libdbi-drivers/0001-build-Use-MYSQL_CONFIG-variable-instead-of-mysql_con.patch
@@ -0,0 +1,47 @@
+From bc966656d8598a6d87c901a67ecdb91c436f4939 Mon Sep 17 00:00:00 2001
+From: Herve Codina <herve.codina@bootlin.com>
+Date: Wed, 29 Sep 2021 15:08:33 +0200
+Subject: [PATCH] build: Use MYSQL_CONFIG variable instead of
+ 'mysql_config'
+
+The MYSQL_CONFIG variable is used to check 'mysql_config' prog.
+This variable can be override by the user but was not used for
+retrieving MYSQL_INCLUDE, MYSQL_LIBS, ...
+
+This commit replaces the hardcoded usage of 'mysql_config' by
+the use of MYSQL_CONFIG variable.
+
+This lead to 'MYSQL_CONFIG=/some/where/mysql_config ./configure'
+command to work properly.
+
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ acinclude.m4 | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index e99318f..9dd2b0f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -116,15 +116,15 @@ if test "$ac_mysql" = "yes"; then
+ 	fi
+ 
+ 	if test "$ac_mysql_incdir" = "no"; then
+-		MYSQL_INCLUDE=`mysql_config --include`
++		MYSQL_INCLUDE=`$MYSQL_CONFIG --include`
+ 	else
+ 		MYSQL_INCLUDE=-I$ac_mysql_incdir
+ 	fi
+ 	if test "$ac_mysql_libdir" = "no"; then
+ 	   	if test "$ac_mysql_threadsafe" = "YES"; then
+-			MYSQL_LIBS=`mysql_config --libs_r`
++			MYSQL_LIBS=`$MYSQL_CONFIG --libs_r`
+ 		else
+-			MYSQL_LIBS=`mysql_config --libs`
++			MYSQL_LIBS=`$MYSQL_CONFIG --libs`
+ 		fi
+ 	else
+ 	   	if test "$ac_mysql_threadsafe" = "YES"; then
+-- 
+2.31.1
+
diff --git a/package/libdbi-drivers/Config.in b/package/libdbi-drivers/Config.in
new file mode 100644
index 0000000000..087e6aaf0e
--- /dev/null
+++ b/package/libdbi-drivers/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBDBI_DRIVERS
+	bool "libdbi-drivers"
+	select BR2_PACKAGE_LIBDBI
+	help
+	  The libdbi-drivers project provides the
+	  database-specific drivers for the libdbi framework.
+
+	  http://libdbi-drivers.sourceforge.net
diff --git a/package/libdbi-drivers/libdbi-drivers.hash b/package/libdbi-drivers/libdbi-drivers.hash
new file mode 100644
index 0000000000..f6110c2a11
--- /dev/null
+++ b/package/libdbi-drivers/libdbi-drivers.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0237c8006cefd6873f0b43d9676b14d5674270adf5e7501cd0e3423ff5b41549  libdbi-drivers-7a8e24ec1cf763226f4be31ba1018d888d4989f3-br1.tar.gz
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libdbi-drivers/libdbi-drivers.mk b/package/libdbi-drivers/libdbi-drivers.mk
new file mode 100644
index 0000000000..78d1c61515
--- /dev/null
+++ b/package/libdbi-drivers/libdbi-drivers.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# libdbi-drivers
+#
+################################################################################
+
+LIBDBI_DRIVERS_VERSION = 7a8e24ec1cf763226f4be31ba1018d888d4989f3
+LIBDBI_DRIVERS_SITE = https://git.code.sf.net/p/libdbi-drivers/libdbi-drivers
+LIBDBI_DRIVERS_SITE_METHOD = git
+LIBDBI_DRIVERS_LICENSE = LGPL-2.1+
+LIBDBI_DRIVERS_LICENSE_FILES = COPYING
+LIBDBI_DRIVERS_INSTALL_STAGING = YES
+LIBDBI_DRIVERS_DEPENDENCIES = libdbi host-pkgconf
+LIBDBI_DRIVERS_AUTORECONF = YES
+
+LIBDBI_DRIVERS_CONF_OPTS = --with-dbi-libdir=$(STAGING_DIR)/usr/lib
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+LIBDBI_DRIVERS_DEPENDENCIES += mysql
+LIBDBI_DRIVERS_CONF_OPTS += --with-mysql
+LIBDBI_DRIVERS_CONF_ENV += MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
+else
+LIBDBI_DRIVERS_CONF_OPTS += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+LIBDBI_DRIVERS_DEPENDENCIES += postgresql
+LIBDBI_DRIVERS_CONF_OPTS += --with-pgsql
+else
+LIBDBI_DRIVERS_CONF_OPTS += --without-pgsql
+endif
+
+LIBDBI_DRIVERS_CONF_OPTS += --without-sqlite
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+LIBDBI_DRIVERS_DEPENDENCIES += sqlite
+LIBDBI_DRIVERS_CONF_OPTS += --with-sqlite3
+else
+LIBDBI_DRIVERS_CONF_OPTS += --without-sqlite3
+endif
+
+LIBDBI_DRIVERS_CONF_OPTS += --without-msql 	# MiniSQL
+LIBDBI_DRIVERS_CONF_OPTS += --without-oracle	# Oracle OCI
+LIBDBI_DRIVERS_CONF_OPTS += --without-firebird	# Firebird/Interbase
+LIBDBI_DRIVERS_CONF_OPTS += --without-freetds	# Freetds
+LIBDBI_DRIVERS_CONF_OPTS += --without-ingres	# Ingres
+LIBDBI_DRIVERS_CONF_OPTS += --without-db2	# IBM DB2
+
+$(eval $(autotools-package))

--===============2350514077156691486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2350514077156691486==--
