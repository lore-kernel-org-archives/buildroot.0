Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68E3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D80845C6;
	Thu, 26 May 2022 08:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cX4-S28lG5va; Thu, 26 May 2022 08:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE06845BF;
	Thu, 26 May 2022 08:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43CC01BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31C5F845BF
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Df2wE5GPhQD for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A70C84553
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B05B9864D6; Thu, 26 May 2022 08:09:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:07:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c716238bbd8904a3e9fc30d8ad712221860f13e6
X-Git-Newrev: 7acaf2e990f82eca9ef4ab16baf728534f24befd
X-Patchwork-Hint: ignore
Message-Id: <20220526080925.B05B9864D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql: can't
 be built with BR2_OPTIMIZE_FAST
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

commit: https://git.buildroot.net/buildroot/commit/?id=7acaf2e990f82eca9ef4ab16baf728534f24befd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

postgresql can't be built with BR2_OPTIMIZE_FAST:

configure: error: do not put -ffast-math in CFLAGS

Fixes:
 - http://autobuild.buildroot.org/results/106bb61bcff5d03e44d3e2e9149c76e6705606a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e702a05d8998a1f2416225eb62b43b6585738fe9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bandwidthd/Config.in      | 4 ++++
 package/collectd/Config.in        | 4 ++++
 package/lighttpd/Config.in        | 4 ++++
 package/php/Config.ext            | 8 ++++++++
 package/postgresql/Config.in      | 4 ++++
 package/python-psycopg2/Config.in | 4 ++++
 package/qt5/qt5base/Config.in     | 4 ++++
 package/zabbix/Config.in          | 1 +
 8 files changed, 33 insertions(+)

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
index 67413ffde0..e1f213bd67 100644
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
