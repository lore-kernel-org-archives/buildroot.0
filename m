Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1AFECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 08:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FBEA826BB;
	Sun, 28 Aug 2022 08:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FBEA826BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoZMx1zeI7Zo; Sun, 28 Aug 2022 08:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0732F818BE;
	Sun, 28 Aug 2022 08:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0732F818BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1E8A1BF330
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 08:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8407260B06
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 08:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8407260B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6fy1Xcl19Vn for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 08:40:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E90D60A9E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E90D60A9E
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 08:40:47 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.235.193])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D392F19F73B;
 Sun, 28 Aug 2022 10:40:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 10:40:32 +0200
Message-Id: <20220828084033.13660-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661676045;
 bh=DMxLpxSUv/lIXlZsYqE05jQ/fCeRz0OaRbehWBZgnk0=;
 h=From:To:Cc:Subject:Date:From;
 b=NeQ49bu/ymxj5EGqjcyF9rnHz8n5T6zGoe+C9Eujf4pkIauE2nnT/pdDFKEi2Mk+T
 1QEkPUszf3smGWvdWKJrrdoGGODqXSNIPE3AfMcmwg+OFEPDb4B3YSE0nAt5Mei3FI
 QM69VFGpCb7NqnIIt+Fb9PsAon1YepI3qLFRbDc42yanXfOteJ0IcRTE9+DdyX88sk
 n0UE63jDO7xaE0vf1yAMs15XHoG/VUzRNDMYn2lOz82RUs/G3I9DcQUXcXG6MzuwOp
 3RdUGServN7xLKK+0kzZqTqZQklCLp77D1GAKTTzi9or11bGaTbKzH0lZgDNB9jd7G
 hwERocirfJwiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NeQ49bu/
Subject: [Buildroot] [next 1/2] package/poco: bump version to 1.12.2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

poco 1.12.0 updated its pcre depencency to pcre2, see:
https://github.com/pocoproject/poco/blob/poco-1.12.2-release/CHANGELOG#L37
The Kconfig selection and dependencies are updated accordingly. This
commit also reorder those Kconfig options alphabetically.

This commit adds an upstream patch to fix compilation failure with
oracle-mysql. See:
https://github.com/pocoproject/poco/commit/3884c734c261231c34f59e56cde7ae02945b4dae

This commit also adds "-latomic" to ldflags at configuration time, if
the toolchain has it. This is required for some architecture: without
this, compilation with bootlin-riscv64-glibc toolchain (for example)
fails at link time with undefined reference to '__atomic_exchange_1'.
The --ldflags option was introduced in 1.12.0 (Thanks Fabrice). See:
https://github.com/pocoproject/poco/pull/3545

For the full Poco change log since 1.11.12, see:
https://github.com/pocoproject/poco/blob/poco-1.12.2-release/CHANGELOG

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Checked on BR commit 6c7061f with command:

    make check-package
    ...
    0 warnings generated
---
 ...optional-JSON-support-for-MySQL-3753.patch | 45 +++++++++++++++++++
 package/poco/Config.in                        |  2 +-
 package/poco/poco.hash                        |  2 +-
 package/poco/poco.mk                          | 10 ++++-
 4 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch

diff --git a/package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch b/package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch
new file mode 100644
index 0000000000..ba2f073a59
--- /dev/null
+++ b/package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch
@@ -0,0 +1,45 @@
+From 3884c734c261231c34f59e56cde7ae02945b4dae Mon Sep 17 00:00:00 2001
+From: Hernan Martinez <hernan.c.martinez@gmail.com>
+Date: Tue, 16 Aug 2022 23:07:25 -0500
+Subject: [PATCH] Fix optional JSON support for MySQL (#3753)
+
+* Fix optional JSON support for MySQL
+
+* Fix optional JSON support for MySQLTest
+---
+ Data/MySQL/src/ResultMetadata.cpp      | 2 ++
+ Data/MySQL/testsuite/src/MySQLTest.cpp | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/Data/MySQL/src/ResultMetadata.cpp b/Data/MySQL/src/ResultMetadata.cpp
+index 61b49dd54..adb5dae84 100644
+--- a/Data/MySQL/src/ResultMetadata.cpp
++++ b/Data/MySQL/src/ResultMetadata.cpp
+@@ -133,8 +133,10 @@ namespace
+ 		case MYSQL_TYPE_LONG_BLOB:
+ 		case MYSQL_TYPE_BLOB:
+ 			return Poco::Data::MetaColumn::FDT_BLOB;
++#ifdef POCO_MYSQL_JSON
+ 		case MYSQL_TYPE_JSON:
+ 			return Poco::Data::MetaColumn::FDT_JSON;
++#endif
+ 		default:
+ 			return Poco::Data::MetaColumn::FDT_UNKNOWN;
+ 		}
+diff --git a/Data/MySQL/testsuite/src/MySQLTest.cpp b/Data/MySQL/testsuite/src/MySQLTest.cpp
+index 80a3683b1..2a286d35e 100644
+--- a/Data/MySQL/testsuite/src/MySQLTest.cpp
++++ b/Data/MySQL/testsuite/src/MySQLTest.cpp
+@@ -976,7 +976,9 @@ CppUnit::Test* MySQLTest::suite()
+ 	CppUnit_addTest(pSuite, MySQLTest, testBLOBStmt);
+ 	CppUnit_addTest(pSuite, MySQLTest, testLongBLOB);
+ 	CppUnit_addTest(pSuite, MySQLTest, testLongTEXT);
++#ifdef POCO_MYSQL_JSON
+ 	CppUnit_addTest(pSuite, MySQLTest, testJSON);
++#endif
+ 	CppUnit_addTest(pSuite, MySQLTest, testUnsignedInts);
+ 	CppUnit_addTest(pSuite, MySQLTest, testFloat);
+ 	CppUnit_addTest(pSuite, MySQLTest, testDouble);
+-- 
+2.37.2
+
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 95f9a46e6e..cb447960f1 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -17,8 +17,8 @@ config BR2_PACKAGE_POCO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_PCRE
 	help
 	  The C++ Portable Components Libraries
 
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 4bf20f3f6b..eea3e2494a 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9774651a02e4cfa79fc43b7db617e45d353ede00b7be8afd0e74e6afb23d3793  poco-1.11.2.tar.gz
+sha256  30442ccb097a0074133f699213a59d6f8c77db5b2c98a7c1ad9c5eeb3a2b06f3  poco-1.12.2.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index c06e55210e..3bcc42c455 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.11.2
+POCO_VERSION = 1.12.2
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
-POCO_DEPENDENCIES = pcre zlib \
+POCO_DEPENDENCIES = pcre2 zlib \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
@@ -60,11 +60,17 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 POCO_MAKE_TARGET = all_release
 endif
 
+POCO_LDFLAGS=$(TARGET_LDFLAGS)
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+POCO_LDFLAGS += -latomic
+endif
+
 define POCO_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
 		--config=Linux \
 		--prefix=/usr \
 		--cflags=-std=c++14 \
+		--ldflags="$(POCO_LDFLAGS)" \
 		--omit="$(POCO_OMIT)" \
 		$(POCO_CONF_OPTS) \
 		--unbundled \
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
