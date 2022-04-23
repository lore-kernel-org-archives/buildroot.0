Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603FCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20EF883E51;
	Sat, 23 Apr 2022 15:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ww7rJ1l2D31c; Sat, 23 Apr 2022 15:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0333081432;
	Sat, 23 Apr 2022 15:16:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 173211BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0CA341A1B
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkGQvF_VXFS2 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1943C41A4E
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D02AF83FD4; Sat, 23 Apr 2022 15:02:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:00:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c7f712c4814c0aacbd11bf71e2f81a3b33365bb
X-Git-Newrev: e702a05d8998a1f2416225eb62b43b6585738fe9
X-Patchwork-Hint: ignore
Message-Id: <20220423150245.D02AF83FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: can't be built with
 BR2_OPTIMIZE_FAST
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e702a05d8998a1f2416225eb62b43b6585738fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

postgresql can't be built with BR2_OPTIMIZE_FAST:

configure: error: do not put -ffast-math in CFLAGS

Fixes:
 - http://autobuild.buildroot.org/results/106bb61bcff5d03e44d3e2e9149c76e6705606a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bandwidthd/Config.in      | 4 ++++
 package/collectd/Config.in        | 4 ++++
 package/lighttpd/Config.in        | 4 ++++
 package/php/Config.ext            | 8 ++++++++
 package/poco/Config.in            | 4 ++++
 package/postgresql/Config.in      | 4 ++++
 package/python-psycopg2/Config.in | 4 ++++
 package/qt5/qt5base/Config.in     | 4 ++++
 package/zabbix/Config.in          | 1 +
 9 files changed, 37 insertions(+)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index 5a3529e0c4..7537552390 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Enable support for logging the bandwidthd data to a remote
@@ -46,6 +47,9 @@ config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 comment "postgresql support needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
+comment "postgresql support can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_BANDWIDTHD_SQLITE3
 	bool "enable sqlite3 log storage"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 43eef3bf66..da8465beee 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -475,6 +475,7 @@ config BR2_PACKAGE_COLLECTD_PING
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Connects to and executes SQL statements on a PostgreSQL
@@ -485,6 +486,9 @@ config BR2_PACKAGE_COLLECTD_POSTGRESQL
 comment "postgresql support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+comment "postgresql support can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_COLLECTD_PROCESSES
 	bool "processes"
 	help
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 6f0c927319..9522b80426 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -93,6 +93,7 @@ config BR2_PACKAGE_LIGHTTPD_PGSQL
 	bool "pgsql support"
 	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Enable postgres support for lighttpd mod_vhostdb_pgsql.
@@ -101,6 +102,9 @@ comment "pgsql support needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
+comment "pgsql support can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	bool "webdav support"
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 5da5d8bed9..e4aced66df 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -141,6 +141,7 @@ config BR2_PACKAGE_PHP_EXT_PGSQL
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  PostgreSQL support
@@ -149,6 +150,9 @@ comment "PostgreSQL extension needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
+comment "PostgreSQL extension can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_PHP_EXT_SQLITE
 	bool "SQLite3"
 	select BR2_PACKAGE_SQLITE
@@ -172,6 +176,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  PDO driver for PostgreSQL
@@ -180,6 +185,9 @@ comment "PostgreSQL drivers need a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
+comment "PostgreSQL drivers can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 699495a241..d2852ba03e 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -52,9 +52,13 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 config BR2_PACKAGE_POCO_DATA_PGSQL
 	bool "Data/PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_POSTGRESQL
 
+comment "Data/PostgreSQL can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_POCO_DATA_SQLITE
 	bool "Data/SQLite"
 	select BR2_PACKAGE_POCO_DATA
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index b42b219558..476427d534 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_POSTGRESQL
 	# postgresql is unlikely to be used in a pure statically
 	# linked environment.
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_OPTIMIZE_FAST
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
@@ -34,3 +35,6 @@ endif
 comment "postgresql needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+comment "postgresql can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index ec27d706de..361c40cfa9 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Psycopg is the most popular PostgreSQL database adapter for
@@ -24,3 +25,6 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 
 comment "python-psycopg2 needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+
+comment "python-psycopg2 can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 601438d2fe..6f2309dffd 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -74,6 +74,7 @@ config BR2_PACKAGE_QT5BASE_PSQL
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL plugin
@@ -83,6 +84,9 @@ comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
+comment "PostgreSQL plugin can't be built with Optimize for fast"
+	depends on !BR2_OPTIMIZE_FAST
+
 choice
 	prompt "SQLite 3 support"
 	default BR2_PACKAGE_QT5BASE_SQLITE_NONE
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 6f8a952936..0f7a0b0003 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -45,6 +45,7 @@ config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_WCHAR # postgresql
 	depends on !BR2_STATIC_LIBS # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
