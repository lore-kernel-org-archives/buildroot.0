Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F085CD3B990
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB02C8463F;
	Tue,  9 Dec 2025 18:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLx7IbJfpaep; Tue,  9 Dec 2025 18:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDC4B845C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304913;
	bh=SoH5a8/zYr5cm4vQAJJB7rv2JNogz4VPZPbH94mEdCM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g5tXJcjgJ5KX13km4SNQ7jC4uwzAonLVVhu5gOO6Ia2Z5o9uab0xr7LVvg0Li8Lr7
	 7hmCUE+ReI5pWGDVWEExcaV7pU25SOPiPmB2cRBxtjhPj9aNA/kZT99eLDBldVt16A
	 c+PBoi0vqjxbtEmbhymvhOc6jMb4NKui9gnjRPsMrX04nKXv4HgTvpkpJXoPo1JdqA
	 SXxjs5Elf5CgSICh1YF/ip3dLXlxjqWvKPzInWYlXOs0hTxwg5yu7CWRQq7HHWWpWB
	 uX18HsDcNQCzdwUNp7Bvh4c+lFgfRFawR95fh9nTdroWI8vocfI+5S8PbyKSv+lXUb
	 FX5d0qQrmyhtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC4B845C6;
	Tue,  9 Dec 2025 18:28:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E686E2C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC76B4081F
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSzueZcPL1gG for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B029C407F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B029C407F9
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E39986969; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ef8d613d7412c54375bdb5c5a683ffbe8a3f85b
X-Git-Newrev: ca21d87300ea54217b262e06f295b816fb38eecb
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.9E39986969@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/graphite2: bump
 version to git 1.3.14-121-g142e1bda3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca21d87300ea54217b262e06f295b816fb38eecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Last release dates back to 2020 with > 120 commits since then, including
fixes for cmake 4 compatibility.

Instead of backporting several patches we bump the package to the latest
commit which allows to remove patch 0001.

Updated license hash due to upstream commit
https://github.com/silnrsi/graphite/commit/f9dad5a35edb0c3f1031f5627623fb9e7f9bc24c

For list of changes, see:
https://github.com/silnrsi/graphite/commits/142e1bda3439d2bd376bcac9c2b247c9532bacde

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - add link to change list
 - change _VERSION to use "git describe --abbrev=40" format
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...nstall-a-libtool-file-with-static-library.patch | 67 ----------------------
 package/graphite2/graphite2.hash                   |  5 +-
 package/graphite2/graphite2.mk                     |  6 +-
 4 files changed, 4 insertions(+), 75 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index df1a9258f3..5d3d63d71f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -445,7 +445,6 @@ package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
 package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
-package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
 package/grpc/0003-disable-unconditionally-downloading-api-repos.patch lib_patch.Upstream
 package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch lib_patch.Upstream
 package/guile/0001-calculate-csqrt_manually.patch lib_patch.Upstream
diff --git a/package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch b/package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch
deleted file mode 100644
index ac150622d5..0000000000
--- a/package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 3edb88b55c0870989778c670d555aa159a2c3abc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 31 Aug 2020 20:56:43 +0200
-Subject: [PATCH] don't install a libtool file with static library
-
-Static library is supported since version 1.3.11 and
-https://github.com/silnrsi/graphite/commit/2f143c04da5caa43ddf4dba437b2f2bc26bf4238
-
-However, graphite2 is still installing libgraphite2.la which contains
-incorrect information (i.e. dlname set to libgraphite2.so and
-old_library set to ''):
-
-dlname='libgraphite2.so'
-
-library_names='libgraphite2.so.3.2.1 libgraphite2.so.3 libgraphite2.so'
-
-old_library=''
-
-dependency_libs=''
-
-This will result in the following build failure with any applications
-using this file such as harfbuzz:
-
-arm-linux-g++.br_real: error: /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgraphite2.so: No such file or directory
-make[5]: *** [main] Error 1
-
-Instead of trying to fix this libtool file, just disable it when
-building a static library as it is not needed
-
-Fixes:
- - http://autobuild.buildroot.org/results/9ebe1d11e80755d59190ef2aae82bbba5cc45e44
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/silnrsi/graphite/pull/65]
----
- src/CMakeLists.txt | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index b6ac26bf..a7ace040 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -131,7 +131,9 @@ if  (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
-         nolib_test(stdc++ $<TARGET_SONAME_FILE:graphite2>)
-     endif ()
-     set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "")
--    CREATE_LIBTOOL_FILE(graphite2 "/lib${LIB_SUFFIX}")
-+    if (BUILD_SHARED_LIBS)
-+        CREATE_LIBTOOL_FILE(graphite2 "/lib${LIB_SUFFIX}")
-+    endif()
- endif()
- 
- if  (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
-@@ -146,7 +148,9 @@ if  (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
-     include(Graphite)
-     nolib_test(stdc++ $<TARGET_SONAME_FILE:graphite2>)
-     set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "")
--    CREATE_LIBTOOL_FILE(graphite2 "/lib${LIB_SUFFIX}")
-+    if (BUILD_SHARED_LIBS)
-+        CREATE_LIBTOOL_FILE(graphite2 "/lib${LIB_SUFFIX}")
-+    endif()
- endif()
- 
- if  (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
--- 
-2.28.0
-
diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index e005375f8a..b788112b5d 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -1,4 +1,3 @@
-# From https://github.com/silnrsi/graphite/releases/download/1.3.14/graphite2-1.3.14.sha256sum
-sha256  f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d  graphite2-1.3.14.tgz
 # Locally computed
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
+sha256  b5e919f4b5788f8ed5a2d9d0ce17a23d1c0f625979e53c5e7336fc2ba0b7a7d6  graphite2-1.3.14-121-g142e1bda3439d2bd376bcac9c2b247c9532bacde.tar.gz
+sha256  cab46cd45adbfea4b1d0f14b033c70062c73074fa0b56532c2f351576ddf455e  LICENSE
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 7f9e3c516e..9686492c20 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-GRAPHITE2_VERSION = 1.3.14
-GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
-GRAPHITE2_SITE = \
-	https://github.com/silnrsi/graphite/releases/download/$(GRAPHITE2_VERSION)
+GRAPHITE2_VERSION = 1.3.14-121-g142e1bda3439d2bd376bcac9c2b247c9532bacde
+GRAPHITE2_SITE = $(call github,silnrsi,graphite,$(GRAPHITE2_VERSION))
 GRAPHITE2_INSTALL_STAGING = YES
 GRAPHITE2_LICENSE = LGPL-2.1+
 GRAPHITE2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
