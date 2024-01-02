Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ECAC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EE5840A5C;
	Tue,  2 Jan 2024 20:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE5840A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wec-TkviwISJ; Tue,  2 Jan 2024 20:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1454540A5D;
	Tue,  2 Jan 2024 20:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1454540A5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5331BF302
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 030E040A5C
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 030E040A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwR074k-Q34h for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8525840A5B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8525840A5B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6534D83CC0; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:05:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01ad11343172ea698e4dcc1c64cb02ce26671e49
X-Git-Newrev: 92040c4bf762d4a5e836cb04bc457839fb57f7f9
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.6534D83CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gli: bump to latest commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=92040c4bf762d4a5e836cb04bc457839fb57f7f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of manual.md (update in year:
  https://github.com/g-truc/gli/commit/53106f0b8a3adc4fc6417024c1c90de69753361f)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                            |  1 -
 package/gli/0001-Optional-building-tests.patch | 45 --------------------------
 package/gli/gli.hash                           |  4 +--
 package/gli/gli.mk                             |  2 +-
 4 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index aa8a6abc4f..8337c80c11 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -491,7 +491,6 @@ package/gerbera/S99gerbera Indent
 package/giblib/0001-fix-imlib2-detection.patch Upstream
 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
-package/gli/0001-Optional-building-tests.patch Upstream
 package/glog/0001-added-emscripten-support.patch Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
diff --git a/package/gli/0001-Optional-building-tests.patch b/package/gli/0001-Optional-building-tests.patch
deleted file mode 100644
index c085e5060b..0000000000
--- a/package/gli/0001-Optional-building-tests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 629fc81ce73114a5925484937df796467adbe8c7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jo=C3=A3o=20Pereira?= <pereira.john94@gmail.com>
-Date: Fri, 22 Mar 2019 22:58:17 +0000
-Subject: [PATCH] Optional building tests
-
-[Retrieved from:
-https://github.com/g-truc/gli/commit/629fc81ce73114a5925484937df796467adbe8c7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt      | 1 +
- test/CMakeLists.txt | 8 +++++---
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6eb1a68b..bcff7ef0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -13,6 +13,7 @@ include(GNUInstallDirs)
- include(CMakePackageConfigHelpers)
- 
- enable_testing()
-+option(GLI_TEST_ENABLE "Build unit tests" ON)
- 
- add_definitions(-D_CRT_SECURE_NO_WARNINGS)
- add_definitions(-DSOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")
-diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
-index 6b1d4826..e51a3181 100644
---- a/test/CMakeLists.txt
-+++ b/test/CMakeLists.txt
-@@ -19,10 +19,12 @@ function(glmCreateTestGTC NAME)
- 	set(SAMPLE_NAME test-${NAME})
- 	add_executable(${SAMPLE_NAME} ${NAME}.cpp)
- 	target_link_libraries(${SAMPLE_NAME} gli)
--	add_test( 
-+	add_test(
- 		NAME ${SAMPLE_NAME}
- 		COMMAND $<TARGET_FILE:${SAMPLE_NAME}> )
- endfunction()
- 
--add_subdirectory(bug)
--add_subdirectory(core)
-+if(GLI_TEST_ENABLE)
-+	add_subdirectory(bug)
-+	add_subdirectory(core)
-+endif()
diff --git a/package/gli/gli.hash b/package/gli/gli.hash
index deef901af9..b6f9317f94 100644
--- a/package/gli/gli.hash
+++ b/package/gli/gli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9374f3cf6441dac0154f7e5ae9ad9ae99f4c4a36f8eb6de23f54a1996b9f2769  gli-559cbe1ec38878e182507d331e0780fbae5baf15.tar.gz
-sha256  e26459f62353e631d18379668c82b85f9fd2fd993f2818277e4fce21e957f87a  manual.md
+sha256  2f4f67ac4d1673216f03ff37e406bb403689b39a2df3d2efad501448705bbb3f  gli-779b99ac6656e4d30c3b24e96e0136a59649a869.tar.gz
+sha256  474c5f04064507cf5ac991fc3d4b990e5e34b15705d38d2062f8844c102113cf  manual.md
diff --git a/package/gli/gli.mk b/package/gli/gli.mk
index 9b9990910a..a789209452 100644
--- a/package/gli/gli.mk
+++ b/package/gli/gli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLI_VERSION = 559cbe1ec38878e182507d331e0780fbae5baf15
+GLI_VERSION = 779b99ac6656e4d30c3b24e96e0136a59649a869
 GLI_SITE = $(call github,g-truc,gli,$(GLI_VERSION))
 GLI_LICENSE = MIT
 GLI_LICENSE_FILES = manual.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
