Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44DFEB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 20:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A4C68138E;
	Mon, 24 Jul 2023 20:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4C68138E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnDBzwlCoOSD; Mon, 24 Jul 2023 20:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED928140A;
	Mon, 24 Jul 2023 20:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED928140A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C38951BF5B4
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 20:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D0A86080A
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 20:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0A86080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jw2xbyLzr01B for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 20:48:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 342A6606C6
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 20:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 342A6606C6
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C5E4013F89D;
 Mon, 24 Jul 2023 22:48:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 22:48:35 +0200
Message-ID: <20230724204835.385678-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690231725;
 bh=coqehi7phGXoDBOtY/iy11CGz0gddu8UAXnlcHU9Iro=;
 h=From:To:Cc:Subject:Date:From;
 b=p8YKFYJSDSnAVu1gu9EZrS9jZ+4TNN/SvZmeBJjJpk82zJRK0juz8/LLKwWHYlwHC
 OFhPTAdXYk5seaKeXhHfjzeXaAbFmNPEYEdaylXZhQO0Y6nXbBBJxVg3DMlbrAMocU
 qXUIWj5pNCbq0C2hniP7iGklbgCEVQwkpp67VhIGifqKDJJRfHhWvHcgUwKm03c7M1
 LL4+6cjyFr+9gk79Y7nS+ZLyVP1k+dyKuR+bivRnRCHRojoigP4WycbHFY7yXw1uIi
 pvc2n2tdRzvFNwXppPzfKr+qwkZhe26yvLWJ0WMaTl6127X5fPwYNLMZkdEVxmbmC/
 xgiXuKxRTXF0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p8YKFYJS
Subject: [Buildroot] [PATCH 1/1] package/poco: bump version to 1.12.4
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

For change log, see:
https://github.com/pocoproject/poco/blob/poco-1.12.4-release/CHANGELOG

This commit also drop the package patch, which was included upstream in
version 1.12.3:
https://github.com/pocoproject/poco/commit/3884c734c261231c34f59e56cde7ae02945b4dae

The file .checkpackageignore is also updated to reflect this patch
removal.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on master branch at commit f359791 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -p poco
    ...
    6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 .checkpackageignore                           |  1 -
 ...optional-JSON-support-for-MySQL-3753.patch | 45 -------------------
 package/poco/poco.hash                        |  2 +-
 package/poco/poco.mk                          |  2 +-
 4 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b9265ae2e4..e95465f58f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1178,7 +1178,6 @@ package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_na
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch Upstream
 package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch Upstream
 package/pkgconf/pkg-config.in Shellcheck
-package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch Sob Upstream
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch Upstream
 package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch Upstream
diff --git a/package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch b/package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch
deleted file mode 100644
index ba2f073a59..0000000000
--- a/package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 3884c734c261231c34f59e56cde7ae02945b4dae Mon Sep 17 00:00:00 2001
-From: Hernan Martinez <hernan.c.martinez@gmail.com>
-Date: Tue, 16 Aug 2022 23:07:25 -0500
-Subject: [PATCH] Fix optional JSON support for MySQL (#3753)
-
-* Fix optional JSON support for MySQL
-
-* Fix optional JSON support for MySQLTest
----
- Data/MySQL/src/ResultMetadata.cpp      | 2 ++
- Data/MySQL/testsuite/src/MySQLTest.cpp | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/Data/MySQL/src/ResultMetadata.cpp b/Data/MySQL/src/ResultMetadata.cpp
-index 61b49dd54..adb5dae84 100644
---- a/Data/MySQL/src/ResultMetadata.cpp
-+++ b/Data/MySQL/src/ResultMetadata.cpp
-@@ -133,8 +133,10 @@ namespace
- 		case MYSQL_TYPE_LONG_BLOB:
- 		case MYSQL_TYPE_BLOB:
- 			return Poco::Data::MetaColumn::FDT_BLOB;
-+#ifdef POCO_MYSQL_JSON
- 		case MYSQL_TYPE_JSON:
- 			return Poco::Data::MetaColumn::FDT_JSON;
-+#endif
- 		default:
- 			return Poco::Data::MetaColumn::FDT_UNKNOWN;
- 		}
-diff --git a/Data/MySQL/testsuite/src/MySQLTest.cpp b/Data/MySQL/testsuite/src/MySQLTest.cpp
-index 80a3683b1..2a286d35e 100644
---- a/Data/MySQL/testsuite/src/MySQLTest.cpp
-+++ b/Data/MySQL/testsuite/src/MySQLTest.cpp
-@@ -976,7 +976,9 @@ CppUnit::Test* MySQLTest::suite()
- 	CppUnit_addTest(pSuite, MySQLTest, testBLOBStmt);
- 	CppUnit_addTest(pSuite, MySQLTest, testLongBLOB);
- 	CppUnit_addTest(pSuite, MySQLTest, testLongTEXT);
-+#ifdef POCO_MYSQL_JSON
- 	CppUnit_addTest(pSuite, MySQLTest, testJSON);
-+#endif
- 	CppUnit_addTest(pSuite, MySQLTest, testUnsignedInts);
- 	CppUnit_addTest(pSuite, MySQLTest, testFloat);
- 	CppUnit_addTest(pSuite, MySQLTest, testDouble);
--- 
-2.37.2
-
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index eea3e2494a..9a7981171a 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30442ccb097a0074133f699213a59d6f8c77db5b2c98a7c1ad9c5eeb3a2b06f3  poco-1.12.2.tar.gz
+sha256  71ef96c35fced367d6da74da294510ad2c912563f12cd716ab02b6ed10a733ef  poco-1.12.4.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index d078faa8e5..2d0233a8ce 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.12.2
+POCO_VERSION = 1.12.4
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
