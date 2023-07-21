Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070A0C0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 20:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A43741870;
	Fri, 21 Jul 2023 20:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A43741870
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7FiynZVAV_C; Fri, 21 Jul 2023 20:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FDF541BD4;
	Fri, 21 Jul 2023 20:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FDF541BD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39D151BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1397182AED
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1397182AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIthe1YsLI4t for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 20:12:11 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E40DD81325
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40DD81325
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8ECC1A4C024D
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 22:11:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39454)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMwTi-0000l7-15
 for buildroot@buildroot.org; Fri, 21 Jul 2023 22:11:54 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 22:11:53 +0200
Message-Id: <20230721201154.847161-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689970314;
 bh=rR9T4A9Rrzd9Lx+0oSrVLr9Y/QmDoxKWxtm1zJVAsxk=;
 h=From:To:Subject:Date:From;
 b=RE2xNbuLDNIq9RpS4ZywDjgOLmwR23nfjDZ3t8k2MT8Tw5Uti0TopvTcp+t04n5oB
 FKkFfYbv71/LPpV3yjcrN19FkItT6aiQjwU8XjZuc/sbP6zihDVCObT5+JtKJIBFZe
 wpwrHXG7p2wpk2U/7pyxVH2EFMW7OsyB3bL7QXwtK+S6tzjBVQz207+J/ObKwCoMcX
 yaaL+e6bTZwC5iLIUcBq2sbXu1c+nNjLKmkbURmnYp2MIYFKBqzvCdKCdtK5fp/HZY
 HLDN71AofJCkvQ+4W79YvsNGxVnBnC2S9pQq3VQyvL6ZE6FpHFI5UKBKuu+uYZiq4a
 9LqT7VnpgQnVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RE2xNbuL
Subject: [Buildroot] [PATCH 1/2] package/mariadb: needs fmt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added fmt as dependency with commit
https://github.com/MariaDB/server/commit/e214e60201216b2e6330f86a84fec8ae14aa2887

Fixes:
http://autobuild.buildroot.net/results/ce1/ce140a3923bc2f85b176fafcc38c6f68b177d33a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mariadb/mariadb.mk | 4 ++++
 package/mysql/Config.in    | 8 ++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index a743d020c0..a9cd9c9516 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -18,12 +18,16 @@ MARIADB_CONFIG_SCRIPTS = mysql_config
 
 MARIADB_DEPENDENCIES = \
 	host-mariadb \
+	fmt \
 	ncurses \
 	openssl \
 	zlib \
 	libaio \
 	libxml2
 
+MARIADB_CONF_OPTS += \
+	-DWITH_FMT=system
+
 # use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
 MARIADB_CONF_OPTS += -DWITH_READLINE=ON
 
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index ef4a9531a7..8212d0fd3f 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -16,10 +16,13 @@ choice
 
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
+	depends on BR2_INSTALL_LIBSTDCPP # fmt
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_HAS_MYSQL
@@ -30,8 +33,9 @@ config BR2_PACKAGE_MARIADB
 
 	  http://www.mariadb.org/
 
-comment "mariadb needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "mariadb needs a toolchain w/ dynamic library, C++, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 
 config BR2_PACKAGE_ORACLE_MYSQL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
