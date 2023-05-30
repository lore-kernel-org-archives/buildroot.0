Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C071C77B73
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 18:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAED9405F5;
	Tue, 30 May 2023 18:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAED9405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sbmlBr9knSpj; Tue, 30 May 2023 18:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF16C408B6;
	Tue, 30 May 2023 18:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF16C408B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCC0F1BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 18:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6E9A40569
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 18:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6E9A40569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3OybhSkAyvkd for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 18:53:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1547E4058B
 for <buildroot@buildroot.org>; Tue, 30 May 2023 18:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1547E4058B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2FFF86A80; Tue, 30 May 2023 18:53:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 20:51:43 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 73e21bb8a20a0c646e57d8eace7f8ce4515c57e0
X-Git-Newrev: c6452ab1673bb8a965a9cac65928bd95b35267ef
X-Patchwork-Hint: ignore
Message-Id: <20230530185341.E2FFF86A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/znc: fix build
 with swig 4.1.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6452ab1673bb8a965a9cac65928bd95b35267ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Buildroot commit 260924e239627cbe1379cfc752939245d53a06e0
"package/swig: bump to version 4.1.1"
broke the build of znc.

Fixes:
http://autobuild.buildroot.net/results/14c/14c44e94b6b588aa033f24202aa8437882cf8792/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 222d747effc286ac71d643077ab96cf7e2182c6d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...support-SWIG-4.1.0-drop-support-for-4.0.1.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch b/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch
new file mode 100644
index 0000000000..cb0988e631
--- /dev/null
+++ b/package/znc/0004-Add-support-SWIG-4.1.0-drop-support-for-4.0.1.patch
@@ -0,0 +1,53 @@
+From fecdd9895894b3afe903021b0843a422eb4d3308 Mon Sep 17 00:00:00 2001
+From: Alexey Sokolov <alexey+znc@asokolov.org>
+Date: Sat, 5 Nov 2022 12:54:40 +0000
+Subject: [PATCH] Add support SWIG 4.1.0, drop support for < 4.0.1
+
+https://bugs.gentoo.org/878587
+
+Upstream: https://github.com/znc/znc/commit/fecdd9895894b3afe903021b0843a422eb4d3308
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt                   | 2 +-
+ modules/modperl/CMakeLists.txt   | 1 -
+ modules/modpython/CMakeLists.txt | 1 -
+ 3 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9d43578e0e..efab0ee1ee 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -173,7 +173,7 @@ if(WANT_PYTHON AND NOT EXISTS
+ 	endif()
+ endif()
+ if(search_swig)
+-	find_package(SWIG 3.0.0)
++	find_package(SWIG 4.0.1)
+ 	if(NOT SWIG_FOUND)
+ 		message(FATAL_ERROR
+ 			"Can't find SWIG, therefore Perl and Python aren't supported. "
+diff --git a/modules/modperl/CMakeLists.txt b/modules/modperl/CMakeLists.txt
+index e18fe47644..a87f74e478 100644
+--- a/modules/modperl/CMakeLists.txt
++++ b/modules/modperl/CMakeLists.txt
+@@ -53,7 +53,6 @@ if(SWIG_FOUND)
+ 		"-I${PROJECT_SOURCE_DIR}/include"
+ 		"-I${CMAKE_CURRENT_SOURCE_DIR}/.."
+ 		"-I${CMAKE_CURRENT_SOURCE_DIR}/include"
+-		-DZNC_EXPORT_LIB_EXPORT
+ 		-outdir "${CMAKE_CURRENT_BINARY_DIR}"
+ 		-o "${CMAKE_CURRENT_BINARY_DIR}/modperl_biglib.cpp"
+ 		"${CMAKE_CURRENT_SOURCE_DIR}/modperl.i"
+diff --git a/modules/modpython/CMakeLists.txt b/modules/modpython/CMakeLists.txt
+index edbeb41ed5..36a2e649f0 100644
+--- a/modules/modpython/CMakeLists.txt
++++ b/modules/modpython/CMakeLists.txt
+@@ -50,7 +50,6 @@ if(SWIG_FOUND)
+ 		"-I${PROJECT_BINARY_DIR}/include"
+ 		"-I${PROJECT_SOURCE_DIR}/include"
+ 		"-I${CMAKE_CURRENT_SOURCE_DIR}/.."
+-		-DZNC_EXPORT_LIB_EXPORT
+ 		-outdir "${CMAKE_CURRENT_BINARY_DIR}"
+ 		-o "${CMAKE_CURRENT_BINARY_DIR}/modpython_biglib.cpp"
+ 		"${CMAKE_CURRENT_SOURCE_DIR}/modpython.i"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
