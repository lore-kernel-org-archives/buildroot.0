Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2FEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B9961319;
	Thu, 26 May 2022 08:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5IgmV3M7mT8; Thu, 26 May 2022 08:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1375A613DE;
	Thu, 26 May 2022 08:21:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 381DB1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 793E44255A
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOXsOkipEj-5 for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54E2742551
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BB19E864D7; Thu, 26 May 2022 08:09:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:08:37 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7acaf2e990f82eca9ef4ab16baf728534f24befd
X-Git-Newrev: 4c62bd927cab5e689ccef311d0f700e156db20b5
X-Patchwork-Hint: ignore
Message-Id: <20220526080925.BB19E864D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql: fix
 BR2_OPTIMIZE_FAST comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c62bd927cab5e689ccef311d0f700e156db20b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit e702a05d8998a1f2416225eb62b43b6585738fe9 wrongly added a
dependency on !BR2_OPTIMIZE_FAST instead of BR2_OPTIMIZE_FAST

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4f84945cc10a269810559ee38bb24950cab0cee4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bandwidthd/Config.in      | 2 +-
 package/collectd/Config.in        | 2 +-
 package/lighttpd/Config.in        | 2 +-
 package/php/Config.ext            | 4 ++--
 package/postgresql/Config.in      | 2 +-
 package/python-psycopg2/Config.in | 2 +-
 package/qt5/qt5base/Config.in     | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

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
index e1f213bd67..c28079008e 100644
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
