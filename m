Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258A2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDEFE827A0;
	Sat, 14 May 2022 21:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTjWI_C3N-21; Sat, 14 May 2022 21:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1928271A;
	Sat, 14 May 2022 21:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B86381BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A620781C38
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gqqeSOhmFpU for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA37182564
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6311C85DB3; Sat, 14 May 2022 21:36:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 23:10:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97324175c0e5cbf5457a9f5a80a1bce13aadd81a
X-Git-Newrev: 4f84945cc10a269810559ee38bb24950cab0cee4
X-Patchwork-Hint: ignore
Message-Id: <20220514213618.6311C85DB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: fix BR2_OPTIMIZE_FAST
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f84945cc10a269810559ee38bb24950cab0cee4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e702a05d8998a1f2416225eb62b43b6585738fe9 wrongly added a
dependency on !BR2_OPTIMIZE_FAST instead of BR2_OPTIMIZE_FAST

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bandwidthd/Config.in      | 2 +-
 package/collectd/Config.in        | 2 +-
 package/lighttpd/Config.in        | 2 +-
 package/php/Config.ext            | 4 ++--
 package/poco/Config.in            | 2 +-
 package/postgresql/Config.in      | 2 +-
 package/python-psycopg2/Config.in | 2 +-
 package/qt5/qt5base/Config.in     | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index 7537552390..e2a6f1acb1 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -48,7 +48,7 @@ comment "postgresql support needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "postgresql support can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_BANDWIDTHD_SQLITE3
 	bool "enable sqlite3 log storage"
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index da8465beee..dc6ecd2b72 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -487,7 +487,7 @@ comment "postgresql support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 comment "postgresql support can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_COLLECTD_PROCESSES
 	bool "processes"
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 9522b80426..5d9e624506 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -103,7 +103,7 @@ comment "pgsql support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 comment "pgsql support can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	bool "webdav support"
diff --git a/package/php/Config.ext b/package/php/Config.ext
index e4aced66df..1c2af9fd15 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -151,7 +151,7 @@ comment "PostgreSQL extension needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL extension can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_PHP_EXT_SQLITE
 	bool "SQLite3"
@@ -186,7 +186,7 @@ comment "PostgreSQL drivers need a toolchain w/ wchar, dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL drivers can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
diff --git a/package/poco/Config.in b/package/poco/Config.in
index d2852ba03e..95f9a46e6e 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -57,7 +57,7 @@ config BR2_PACKAGE_POCO_DATA_PGSQL
 	select BR2_PACKAGE_POSTGRESQL
 
 comment "Data/PostgreSQL can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_POCO_DATA_SQLITE
 	bool "Data/SQLite"
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 476427d534..899907d6a5 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -37,4 +37,4 @@ comment "postgresql needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "postgresql can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 361c40cfa9..4aa86c7690 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -27,4 +27,4 @@ comment "python-psycopg2 needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 comment "python-psycopg2 can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 6f2309dffd..b876f1948e 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -85,7 +85,7 @@ comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL plugin can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 choice
 	prompt "SQLite 3 support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
