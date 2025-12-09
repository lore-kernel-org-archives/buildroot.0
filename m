Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C54D3B98F
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D5D40820;
	Tue,  9 Dec 2025 18:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzLtsT30JRvU; Tue,  9 Dec 2025 18:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F8940968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304908;
	bh=3iWOqbyqk0mNAiH/7suTAdgqypW8mWfvkDcSWGyo3JQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bQI2/Jk8mwZeYBgYBBIwYhzbrcASGFnDqPTnS1t7pVGV9cG7Z7x/YNHqBuY/5ZAuf
	 aHYwfySIJgO+NfuUUNxTW6irvfuFHuxaJXvzggd9/jSM+OFzbhvG90s9Zapl85MioT
	 aMWHDT75SessQamQOhcYPNV7oWKwsK8GjXV6lz9+ggZfT6s7BHIb6BjvsbH9QuxVXE
	 25R02o8hatSZFJiotOVz2JvQDftVNrvQ40YAGWi7vuObMpHJDJwrYemCgxbdi0nbaZ
	 5lRJ2bwolhw3ydOSs/SLz/rn4N7fqcG1vftbUsX17xRIApOBHjwc/UQ4xWoeLeLmsj
	 EChzHyp3DSYaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1F8940968;
	Tue,  9 Dec 2025 18:28:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D7822C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD630608B8
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2m0GdXyD5m6 for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938BC608A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 938BC608A2
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83C4C86964; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7d5bd5ecc08841b8dc3866af0fd69229fa08215a
X-Git-Newrev: b7134215e31c1507d0635e29c6a872d60c11b61e
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.83C4C86964@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cutelyst: bump version
 to 3.5.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
