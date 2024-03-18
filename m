Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC2BC54E69
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 11:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D2EC408B1;
	Mon, 18 Mar 2024 11:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHMFaPZJUHuB; Mon, 18 Mar 2024 11:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF71740929
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF71740929;
	Mon, 18 Mar 2024 11:45:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13AD61BF366
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 078E8408B1
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHRoGDJGwULy for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 11:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA1E040646
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA1E040646
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 11:45:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CC4A8050F; Mon, 18 Mar 2024 11:45:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 12:38:06 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: be4b55ea525854272bc7eacdacf4a36a82304cac
X-Git-Newrev: 85dba7acde679e1820f3ca3f2f9cf1117383f8a2
X-Patchwork-Hint: ignore
Message-Id: <20240318114504.5CC4A8050F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/poco: bump
 version to 1.12.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=85dba7acde679e1820f3ca3f2f9cf1117383f8a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

For change log, see:
https://github.com/pocoproject/poco/blob/poco-1.12.4-release/CHANGELOG

This commit also drop the package patch, which was included upstream in
version 1.12.3:
https://github.com/pocoproject/poco/commit/3884c734c261231c34f59e56cde7ae02945b4dae

The file .checkpackageignore is also updated to reflect this patch
removal.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 50ef6a6f592a5f9e8eb562aee0fc308ba911836a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...-Fix-optional-JSON-support-for-MySQL-3753.patch | 45 ----------------------
 package/poco/poco.hash                             |  2 +-
 package/poco/poco.mk                               |  2 +-
 4 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1daee0b26c..093422b83b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -139,7 +139,6 @@ package/owfs/S55owserver Shellcheck Variables
 package/owfs/S60owfs Shellcheck Variables
 package/pigpio/S50pigpio Shellcheck Variables
 package/pkgconf/pkg-config.in Shellcheck
-package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch Sob
 package/postgresql/S50postgresql Variables
 package/procps-ng/S02sysctl Variables
 package/proftpd/S50proftpd Indent Shellcheck Variables
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
