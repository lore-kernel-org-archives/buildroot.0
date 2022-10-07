Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1628C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 15:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A16C405A7;
	Fri,  7 Oct 2022 15:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A16C405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLYGhhsMCI4T; Fri,  7 Oct 2022 15:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 921D44059E;
	Fri,  7 Oct 2022 15:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 921D44059E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50C901C2748
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CD7761189
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD7761189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W98poP1OfzKu for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 15:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC11C60B44
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 15:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC11C60B44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D82F986B8E; Fri,  7 Oct 2022 15:42:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Oct 2022 17:39:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd9f138b5a9419c5a251411e2abbdc4bbf3a43f7
X-Git-Newrev: 7d843d9cc0064d6690cfc000e579f575e2c0cc4d
X-Patchwork-Hint: ignore
Message-Id: <20221007154207.D82F986B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: bump to version 5.2.5
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
Content-Type: multipart/mixed; boundary="===============4734577864882206119=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4734577864882206119==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7d843d9cc0064d6690cfc000e579f575e2c0cc4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace disable -Werror patch with new cmake option:
-DASSIMP_WARNINGS_AS_ERRORS=OFF

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/0001-code-disable-Werror.patch | 39 ---------------------------
 package/assimp/assimp.hash                    |  2 +-
 package/assimp/assimp.mk                      |  3 ++-
 3 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/package/assimp/0001-code-disable-Werror.patch b/package/assimp/0001-code-disable-Werror.patch
deleted file mode 100644
index 33867e61c3..0000000000
--- a/package/assimp/0001-code-disable-Werror.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5146e1c4d58174e302dbdcf2a85c2023be1cffc6 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 10 Dec 2021 15:15:30 +0100
-Subject: [PATCH] code: disable -Werror
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  .../build/assimp-5.1.3/code/PostProcessing/TriangulateProcess.cpp:285:50: error: argument 1 value ‘4294967294’ exceeds maximum object size 2147483647 [-Werror=alloc-size-larger-than=]
-    285 |     std::unique_ptr<bool[]> done(new bool[max_out]);
-        |                                                  ^
-  [...]
-  .../host/opt/ext-toolchain/powerpc-buildroot-linux-uclibc/include/c++/9.3.0/new:127:26: note: in a call to allocation function ‘void* operator new [](std::size_t)’ declared here
-    127 | _GLIBCXX_NODISCARD void* operator new[](std::size_t) _GLIBCXX_THROW (std::bad_alloc)
-        |                          ^~~~~~~~
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- code/CMakeLists.txt | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/code/CMakeLists.txt b/code/CMakeLists.txt
-index e45bf8a2a..f71b6583d 100644
---- a/code/CMakeLists.txt
-+++ b/code/CMakeLists.txt
-@@ -1167,8 +1167,6 @@ TARGET_USE_COMMON_OUTPUT_DIRECTORY(assimp)
- # enable warnings as errors ########################################
- IF (MSVC)
-   TARGET_COMPILE_OPTIONS(assimp PRIVATE /WX)
--ELSE()
--  TARGET_COMPILE_OPTIONS(assimp PRIVATE -Werror)
- ENDIF()
- 
- # adds C_FLAGS required to compile zip.c on old GCC 4.x compiler
--- 
-2.34.1
-
diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index a778b79132..86a90927ed 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c9cbbc8589639cd8c13f65e94a90422a70454e8fa150cf899b6038ba86e9ecff  assimp-5.2.1.tar.gz
+sha256  b5219e63ae31d895d60d98001ee5bb809fb2c7b2de1e7f78ceeb600063641e1a  assimp-5.2.5.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 79865673ac..0b6034fb8e 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.2.1
+ASSIMP_VERSION = 5.2.5
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
@@ -39,6 +39,7 @@ ASSIMP_CXXFLAGS += -O0
 endif
 
 ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
+	-DASSIMP_WARNINGS_AS_ERRORS=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
 
 $(eval $(cmake-package))

--===============4734577864882206119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4734577864882206119==--
