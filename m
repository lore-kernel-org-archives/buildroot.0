Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854CDC38150
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1248080BF2;
	Wed, 10 Jul 2024 08:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LPUUr6-agSQ; Wed, 10 Jul 2024 08:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C14680EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C14680EC7;
	Wed, 10 Jul 2024 08:14:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B35D1BF982
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2805980BF2
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJkR28gP0nHP for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADE2581DFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADE2581DFD
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADE2581DFD
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:14:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D10261814B9; Wed, 10 Jul 2024 10:14:17 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 10:13:47 +0200
Message-Id: <20240710081348.60978-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1720599258; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=D7jgrny/PTuVs7hCwUJKJmWOXWx1iYhBiLRs0cSJ74k=;
 b=jXWwH6Ed7zt2bFheO3HKrS79Rh46vYKa8bOS/pl4RsGHA8WERe/5YAj3Zzg0vbymRmZdbT
 z0/5oKwkTWBRx/ifz9XE6B0LUhv2pWQlAWshD58mw/I1Mlslj7ipDJQTNKts2Y5jIlKIT4
 UTHPINDCMtHt4TwADCyVhf1RzpickMY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=jXWwH6Ed
Subject: [Buildroot] [PATCH] package/sqlitecpp: new package
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SQLiteC++ (SQLiteCpp) is a lean and easy to use C++ SQLite3 wrapper.

http://srombauts.github.io/SQLiteCpp/

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/sqlitecpp/Config.in      |  9 +++++++++
 package/sqlitecpp/sqlitecpp.hash |  3 +++
 package/sqlitecpp/sqlitecpp.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/sqlitecpp/Config.in
 create mode 100644 package/sqlitecpp/sqlitecpp.hash
 create mode 100644 package/sqlitecpp/sqlitecpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 90d1a111ab..dca815cdee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2277,6 +2277,7 @@ F:	package/networkd-dispatcher/
 F:	package/protobuf/
 F:	package/re2/
 F:	package/spdlog/
+F:	package/sqlitecpp/
 
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
diff --git a/package/Config.in b/package/Config.in
index 48ef1a6fdc..27710d18f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1611,6 +1611,7 @@ endif
 	source "package/rocksdb/Config.in"
 	source "package/sqlcipher/Config.in"
 	source "package/sqlite/Config.in"
+	source "package/sqlitecpp/Config.in"
 	source "package/timescaledb/Config.in"
 	source "package/unixodbc/Config.in"
 endmenu
diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
new file mode 100644
index 0000000000..02b2d8989c
--- /dev/null
+++ b/package/sqlitecpp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SQLITECPP
+	bool "SQLiteC++"
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
+	help
+	  SQLiteC++ (SQLiteCpp) is a lean and easy to use
+	  C++ SQLite3 wrapper.
+
+	  https://github.com/SRombauts/SQLiteCpp
diff --git a/package/sqlitecpp/sqlitecpp.hash b/package/sqlitecpp/sqlitecpp.hash
new file mode 100644
index 0000000000..7b42d38280
--- /dev/null
+++ b/package/sqlitecpp/sqlitecpp.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  71f990f9fb4b004533b6859ce40729af823b87fe691dd99ca084a7fd40db54b9  3.3.1.tar.gz
+sha256  635de1440f6064c6ca9ca325c163d4d0771e783c6d77783d9470eaf56e346c67  LICENSE.txt
diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
new file mode 100644
index 0000000000..bb1caa0f39
--- /dev/null
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# SQLiteC++
+#
+################################################################################
+
+SQLITECPP_VERSION = 3.3.1
+SQLITECPP_SOURCE = $(SQLITECPP_VERSION).tar.gz
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
