Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED40ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E44A84177;
	Sun, 11 Sep 2022 09:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E44A84177
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HW9edjcRHSpD; Sun, 11 Sep 2022 09:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55FA983F4C;
	Sun, 11 Sep 2022 09:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55FA983F4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15E4E1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D24E827A8
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D24E827A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mn8b26dBvta for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A60813A9
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A60813A9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 136EB835E4; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 12:12:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 836f49e7f9c6a536e6ddb96fff541b4373eabb02
X-Git-Newrev: 8fe5de96f700bc93b64c61e6e4075555f025fa1f
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.136EB835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: bump version to 1.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fe5de96f700bc93b64c61e6e4075555f025fa1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-Fix-optional-JSON-support-for-MySQL-3753.patch | 45 ++++++++++++++++++++++
 package/poco/Config.in                             |  2 +-
 package/poco/poco.hash                             |  2 +-
 package/poco/poco.mk                               | 10 ++++-
 4 files changed, 55 insertions(+), 4 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
