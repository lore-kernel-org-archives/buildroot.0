Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6953FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1569240445;
	Sat, 12 Feb 2022 13:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jInrMJicg_cm; Sat, 12 Feb 2022 13:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CBE34031F;
	Sat, 12 Feb 2022 13:14:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 176311BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 117CA40272
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id geeluy_rFT4l for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0425D4039D
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0A83382AD1; Sat, 12 Feb 2022 13:06:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 14:11:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdbe856675dafc43838f628ce4838ee8dc8d3080
X-Git-Newrev: 89ac26c3043b02b60c24c3793c834ba053d91fde
X-Patchwork-Hint: ignore
Message-Id: <20220212130603.0A83382AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protozero: bump version to 1.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=89ac26c3043b02b60c24c3793c834ba053d91fde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.
Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.7.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0001-CMakeLists.txt-respect-BUILD_TESTING.patch | 47 ----------------------
 package/protozero/protozero.hash                   |  2 +-
 package/protozero/protozero.mk                     |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch b/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
deleted file mode 100644
index d0267e3283..0000000000
--- a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 03daae49c8fa94513b508bd12f1597e8e5e086f2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 17 Apr 2021 13:06:44 +0200
-Subject: [PATCH] CMakeLists.txt: respect BUILD_TESTING
-
-Don't build tests if the standard cmake BUILD_TESTING variable is set to
-OFF.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mapbox/protozero/pull/105]
----
- CMakeLists.txt | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f9702d6..7a40212 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -23,6 +23,7 @@ set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
- 
- #-----------------------------------------------------------------------------
- 
-+option(BUILD_TESTING "Build tests" ON)
- option(WERROR "Add -Werror flag to build (turns warnings into errors)" ON)
- 
- if(MSVC)
-@@ -134,13 +135,13 @@ install(DIRECTORY include/protozero DESTINATION include)
- 
- #-----------------------------------------------------------------------------
- 
--enable_testing()
--
- add_subdirectory(doc)
- 
- add_subdirectory(tools)
- 
--add_subdirectory(test)
--
-+if(BUILD_TESTING)
-+    enable_testing()
-+    add_subdirectory(test)
-+endif()
- 
- #-----------------------------------------------------------------------------
--- 
-2.30.2
-
diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index 5453e01ecf..f0b8e39009 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  beffbdfab060854fd770178a8db9c028b5b6ee4a059a2fed82c46390a85f3f31  protozero-1.7.0.tar.gz
+sha256  27e0017d5b3ba06d646a3ec6391d5ccc8500db821be480aefd2e4ddc3de5ff99  protozero-1.7.1.tar.gz
 sha256  1f4d477e3c2d74d8706c8f05437bd86804abe46853b1f233ce1549a4de76fa49  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index 80d16192e3..a46e37d69b 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.7.0
+PROTOZERO_VERSION = 1.7.1
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
