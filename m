Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83400C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2553F40A4B;
	Sun, 17 Jul 2022 13:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2553F40A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjNuZw0h9u8w; Sun, 17 Jul 2022 13:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E595B40A60;
	Sun, 17 Jul 2022 13:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E595B40A60
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6CD1BF97C
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A5341779
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A5341779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFxTApRJtjsJ for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED30641775
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED30641775
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B52F083BD0; Sun, 17 Jul 2022 13:06:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:15:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86ddd028c42918cf327f6cafec4620c0a9d36f45
X-Git-Newrev: b35ee9bace28892238e92d04922fb5e7bba8e9f6
X-Patchwork-Hint: ignore
Message-Id: <20220717130654.B52F083BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip: bump to version 3.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b35ee9bace28892238e92d04922fb5e7bba8e9f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 41 ----------------------
 package/minizip/minizip.hash                       |  2 +-
 package/minizip/minizip.mk                         |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index b0cb6a6c1e..0000000000
--- a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4e7899f3d0533f83b7230ffa787087b65ddd45c0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 5 Apr 2022 18:20:14 +0200
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Fix the following build failure without a working C++ compiler raised
-since version 2.0.0 and
-https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:
-
-CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
-  The C++ compiler
-
-    "/usr/bin/c++"
-
-  is not able to compile a simple test program.
-
-Fixes:
- - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zlib-ng/minizip-ng/pull/621]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fef46c3..83adaf3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -661,7 +661,7 @@ endif()
- list(APPEND MINIZIP_INC ${CMAKE_CURRENT_SOURCE_DIR})
- 
- # Create minizip library
--project(minizip${MZ_PROJECT_SUFFIX} VERSION ${VERSION})
-+project(minizip${MZ_PROJECT_SUFFIX} LANGUAGES C VERSION ${VERSION})
- 
- if(NOT ${MZ_PROJECT_SUFFIX} STREQUAL "")
-     message(STATUS "Project configured as ${PROJECT_NAME}")
--- 
-2.35.1
-
diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index e73637670c..0c6e218488 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a248c378fdf4ef6c517024bb65577603d5146cffaebe81900bec9c0a5035d4d  minizip-3.0.5.tar.gz
+sha256  383fa1bdc28c482828a8a8db53f758dbd44291b641182724fda5df5b59cce543  minizip-3.0.6.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index b9259f0c54..61936e0568 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.5
+MINIZIP_VERSION = 3.0.6
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
