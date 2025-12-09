Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F18CD4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B60D80FA2;
	Fri, 12 Dec 2025 07:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhohlDh23ZNP; Fri, 12 Dec 2025 07:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1092D8434A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526341;
	bh=Ad9orJLmmhRPtufOeIdZfLih76pRKXNTBOoiyo3+SRo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pXftIPmFTlEeBSTOBWCuzybqCeHDZvb5m3bH/oNgJfjztkb8pnPm7iS4eQOE5wB5c
	 GEz+J9bvEK/yoVCJXPNer6gDFO/wKJLv9OdkOqie5z7iLv0FZPW6np9UQFoUr8RJV8
	 v3WbHxkEJy9+BM+UqHFrPPStE7wUGgWF4itJ7nq/CfYFMbFPO7oej5rDnqCmr7W345
	 A3VqM6WssE2LmBvC1MIvr7i4fxkjoNeT5mqAhDaCbOKZ4BmOGukgUuQojnj3CvrtCX
	 vVBi/rKysHU8urCg+OPj4MSlBEVnffECi/7OYHgbho7y8QDkaLRi9CiS0/NxAK0gEG
	 MgKDDFPO9VGPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1092D8434A;
	Fri, 12 Dec 2025 07:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D6D72C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B43094112F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHU5QlES8POV for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F114110A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0F114110A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B00D4869E8; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d5bd5ecc08841b8dc3866af0fd69229fa08215a
X-Git-Newrev: b7134215e31c1507d0635e29c6a872d60c11b61e
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.B00D4869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cutelyst: bump version to 3.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7134215e31c1507d0635e29c6a872d60c11b61e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/cutelyst/cutelyst/releases/tag/v3.5.0
"Last release supporting Qt 5.12"

Bump package to the latest version compatible with Qt5, fixes build with
cmake 4.

Removed patch which is included in this release:
https://github.com/cutelyst/cutelyst/commit/da9792f33c553031e639a194117ba70167d62eae

Updated license hash due to relicense as BSD-3-Clause:
https://github.com/cutelyst/cutelyst/commit/47c28edbbc8d0788db329bf87bf975844bef9b36

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...eLists.txt-don-t-override-CMAKE_EXE_LINKE.patch | 31 ----------------------
 package/cutelyst/cutelyst.hash                     |  4 +--
 package/cutelyst/cutelyst.mk                       |  4 +--
 4 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2554347bd7..df1a9258f3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -291,7 +291,6 @@ package/curlftpfs/0001-fix-CURLOPT_INFILESIZE.patch lib_patch.Sob lib_patch.Upst
 package/curlftpfs/0002-free_ftpfs_file-memleak-fix.patch lib_patch.Sob lib_patch.Upstream
 package/curlftpfs/0003-nocache-memleak-fix.patch lib_patch.Sob lib_patch.Upstream
 package/curlftpfs/0004-fix-musl-build-off-t.patch lib_patch.Upstream
-package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch lib_patch.Upstream
 package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch lib_patch.Upstream
 package/cwiid/0002-configure-make-wmgui-build-optional.patch lib_patch.Upstream
 package/dahdi-tools/0001-no-build-docs.patch lib_patch.Upstream
diff --git a/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch b/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch
deleted file mode 100644
index 45b1fcd146..0000000000
--- a/package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c347aeb43775109cbc2824b99cb10b1b3440c191 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 17 May 2021 21:27:11 +0200
-Subject: [PATCH] server/CMakeLists.txt: don't override CMAKE_EXE_LINKER_FLAGS
-
-Don't override CMAKE_EXE_LINKER_FLAGS as this could break the build if
-CMAKE_EXE_LINKER_FLAGS is already set by the user (for example to pass
--latomic)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/cutelyst/cutelyst/pull/312]
----
- wsgi/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/server/CMakeLists.txt b/server/CMakeLists.txt
-index ec5689f7..1ed56859 100644
---- a/wsgi/CMakeLists.txt
-+++ b/wsgi/CMakeLists.txt
-@@ -95,7 +95,7 @@ install(TARGETS Cutelyst${PROJECT_VERSION_MAJOR}Qt${QT_VERSION_MAJOR}Server
-     cxx_generalized_initializers
- )
- if (JEMALLOC_FOUND)
--    set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS} " -Wl,--no-as-needed")
-+    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed")
-     target_link_libraries(cutelyst-wsgi2 PRIVATE ${JEMALLOC_LIBRARIES})
- endif()
- 
--- 
-2.30.2
-
diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
index d35fdcc890..5103f58138 100644
--- a/package/cutelyst/cutelyst.hash
+++ b/package/cutelyst/cutelyst.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  b0e3d658a60d68906f7255b78bad64af1aa07cb3b785fbf61629b7355f089baa  cutelyst-2.11.0.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  351578d495213c438365f988a70bb8f8c14b1d7dcef79ce0f723dd584388aa77  cutelyst-3.5.0.tar.gz
+sha256  ca0c629be86a1691ec413a3f9137a1aa62663d5ec30c5867cf4b283f18eb0bd7  COPYING
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 5313b003ad..9b9e3d4d8a 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-CUTELYST_VERSION = 2.11.0
+CUTELYST_VERSION = 3.5.0
 CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
 CUTELYST_INSTALL_STAGING = YES
 CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
-CUTELYST_LICENSE = LGPL-2.1+
+CUTELYST_LICENSE = BSD-3-Clause
 CUTELYST_LICENSE_FILES = COPYING
 CUTELYST_DEPENDENCIES = qt5base
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
