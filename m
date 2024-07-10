Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D25C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F1181F83;
	Wed, 10 Jul 2024 08:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6estEBURaGce; Wed, 10 Jul 2024 08:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFA0981F7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA0981F7E;
	Wed, 10 Jul 2024 08:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4543B1BF5AD
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 319B041347
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1VF9xwvuMss for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F064409F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F064409F4
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52EC08458C; Wed, 10 Jul 2024 08:45:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 10:45:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e24c913a109b2a1055bc01ac5523c577629af11
X-Git-Newrev: e74059b39ce2f8511bc57c3f829681bf919b4e55
X-Patchwork-Hint: ignore
Message-Id: <20240710084547.52EC08458C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlitecpp: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e74059b39ce2f8511bc57c3f829681bf919b4e55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SQLiteC++ (SQLiteCpp) is a lean and easy to use C++ SQLite3 wrapper.

http://srombauts.github.io/SQLiteCpp/

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/sqlitecpp/Config.in      | 13 +++++++++++++
 package/sqlitecpp/sqlitecpp.hash |  3 +++
 package/sqlitecpp/sqlitecpp.mk   | 19 +++++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f817776474..c00fab70ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2283,6 +2283,7 @@ F:	package/networkd-dispatcher/
 F:	package/protobuf/
 F:	package/re2/
 F:	package/spdlog/
+F:	package/sqlitecpp/
 
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
diff --git a/package/Config.in b/package/Config.in
index faf8dd7d7e..dc3806388c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1613,6 +1613,7 @@ endif
 	source "package/rocksdb/Config.in"
 	source "package/sqlcipher/Config.in"
 	source "package/sqlite/Config.in"
+	source "package/sqlitecpp/Config.in"
 	source "package/timescaledb/Config.in"
 	source "package/unixodbc/Config.in"
 endmenu
diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
new file mode 100644
index 0000000000..36ee4b73f9
--- /dev/null
+++ b/package/sqlitecpp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SQLITECPP
+	bool "sqlitecpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
+	help
+	  SQLiteC++ (SQLiteCpp) is a lean and easy to use
+	  C++ SQLite3 wrapper.
+
+	  https://github.com/SRombauts/SQLiteCpp
+
+comment "sqlitecpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sqlitecpp/sqlitecpp.hash b/package/sqlitecpp/sqlitecpp.hash
new file mode 100644
index 0000000000..1269abf61f
--- /dev/null
+++ b/package/sqlitecpp/sqlitecpp.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  71f990f9fb4b004533b6859ce40729af823b87fe691dd99ca084a7fd40db54b9  sqlitecpp-3.3.1.tar.gz
+sha256  635de1440f6064c6ca9ca325c163d4d0771e783c6d77783d9470eaf56e346c67  LICENSE.txt
diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
new file mode 100644
index 0000000000..5571d325c3
--- /dev/null
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# SQLiteC++
+#
+################################################################################
+
+SQLITECPP_VERSION = 3.3.1
+SQLITECPP_SITE = $(call github,SRombauts,SQLiteCpp,$(SQLITECPP_VERSION))
+SQLITECPP_LICENSE = MIT
+SQLITECPP_LICENSE_FILES = LICENSE.txt
+SQLITECPP_DEPENDENCIES = sqlite
+SQLITECPP_INSTALL_STAGING = YES
+
+SQLITECPP_CONF_OPTS = \
+	-DSQLITECPP_INTERNAL_SQLITE=OFF \
+	-DSQLITECPP_RUN_CPPLINT=OFF \
+	-DSQLITECPP_RUN_CPPCHECK=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
