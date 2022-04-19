Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E0CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 19:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D7F360BDC;
	Tue, 19 Apr 2022 19:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68HUTAjvybfp; Tue, 19 Apr 2022 19:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F58460A72;
	Tue, 19 Apr 2022 19:36:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6D01BF867
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B73B417CE
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fu1k50CARbnp for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 19:36:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80EA4417CD
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 19:36:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so2208707wms.0
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 12:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+sQpyUR3bVdq30qLswCqvyEI1cQghq0FMdBlLTWuM4M=;
 b=XAQYyYqQl7eqLJiij2MyW0CJYN/SHRsMiDT6hY/OYiJHBtxAbW7mDhUiYT9Xtu0++C
 +FGEYxm0D0ScBXuKX1AOVGEFcskrlzEnCzDJB/yd14XbqoH0nHK5tj0nyMnA8P+GjDrU
 6cK9Vdf3sBBuH4fk4b6zPTB3+3iDDyhR+NkMADyjlO+4N+gByCIwz+IK5MWgutgwD8hU
 ACN7y3fFRm4bOJTCVgsZtiaxGtPgKMySShB8j3taJdA4N64TpwFOZkO34za4xR4mUPVI
 FSjsmw/LEj1ouKDV9bf+1MfsR//oPTeKWEjj1uyuklXQEh6DtTB7e4/hMp2ubV2Ax5WQ
 V5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+sQpyUR3bVdq30qLswCqvyEI1cQghq0FMdBlLTWuM4M=;
 b=WfHuTycbN0jsyL3Lc/rEAsL+4/HXXTj2tVp33TStzTkxP3jn+d7dE8RLgGwOgajMdy
 WI5ljO/BC3ydDlweqQCSUPDzHE7rtiA0gi9mtO0+bw7G69qUjvmgcVtmwFJWTiMAM6gY
 xMdx0hfxgqJK8rf0gGAJzhYKphEDU84qE+G3B67+VRSrG/mflpctL/vNve1aeNlVZ1jB
 Wg/5Pdxg0VIo38XnZ9a5Ie5w1/BdogW8fHdICkS5Ae9XMGXyr11NqrGIwGoz/0YHrgxz
 dK8yDCN08iXAXHWT96vzHYrFUCd/ZLI3v7nmPnbDQ0c4GynvQ7h/TkSzwb6D31gRNE/w
 r1GQ==
X-Gm-Message-State: AOAM531ATCjPbPK5eOnyCp9U7PTQEPCjoA7ujW5teO01QhuUB9cVL/q4
 cCXjbBRHjaMdbA4jBaGVBi3hl0zMHbs=
X-Google-Smtp-Source: ABdhPJyfFsY2yW4cdzNVn3yQ9WAC+UZZM8Z9nkazSCtlBQ4LR0rJVyCU7P8+QAptDi/5y0hrXXvXjQ==
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id
 n16-20020a7bc5d0000000b00389fe853d79mr132316wmk.77.1650396984533; 
 Tue, 19 Apr 2022 12:36:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a1ca301000000b003929c4bf250sm5061659wme.13.2022.04.19.12.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 12:36:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 21:32:15 +0200
Message-Id: <20220419193215.4089204-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/postgresql: can't be built with
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Alexey Lukyanchuk <skif@skif-web.ru>,
 Asaf Kahlon <asafka7@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

postgresql can't be built with BR2_OPTIMIZE_FAST:

configure: error: do not put -ffast-math in CFLAGS

Fixes:
 - http://autobuild.buildroot.org/results/106bb61bcff5d03e44d3e2e9149c76e6705606a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
