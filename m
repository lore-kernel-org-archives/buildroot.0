Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E000AC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 14:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8849C60C1A;
	Sat, 17 May 2025 14:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENXPH9yGPlZ8; Sat, 17 May 2025 14:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9E060874
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE9E060874;
	Sat, 17 May 2025 14:59:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07F4FE4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04FBC60874
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyPG7Wp8T5CD for <buildroot@buildroot.org>;
 Sat, 17 May 2025 14:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40BB660754
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40BB660754
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:59:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 378AB86F50; Sat, 17 May 2025 14:59:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 16:57:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 745aa4d06067ca3f6ac6f90ec995b57c704c536a
X-Git-Newrev: 76a4a6361283b06a41220d26f4a25f644cd88f05
X-Patchwork-Hint: ignore
Message-Id: <20250517145951.378AB86F50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-gmmlib: fix cmake 4
 compatibility
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=76a4a6361283b06a41220d26f4a25f644cd88f05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch fixing cmake 4 compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...e_minimum_required-to-3.5-consisently-acr.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch b/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch
new file mode 100644
index 0000000000..400cdf667f
--- /dev/null
+++ b/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch
@@ -0,0 +1,43 @@
+From c9db6e993d4e440a276f2918f48de0868fe98093 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 04:45:44 +0000
+Subject: [PATCH] Update cmake_minimum_required to 3.5 consisently across
+ CMakeLists
+
+Source/GmmLib/CMakeLists.txt already is requiring CMake 3.5. Update
+remaining files to 3.5. This supports the compilation with cmake-4.0.0
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/intel/gmmlib/pull/130
+---
+ CMakeLists.txt                      | 2 +-
+ Source/GmmLib/os_release_info.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1a3ad36..ca42104 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 3.1 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ if (NOT DEFINED RUN_TEST_SUITE)
+ option (RUN_TEST_SUITE "run test suite after install" ON)
+diff --git a/Source/GmmLib/os_release_info.cmake b/Source/GmmLib/os_release_info.cmake
+index 70c8318..0951a4a 100755
+--- a/Source/GmmLib/os_release_info.cmake
++++ b/Source/GmmLib/os_release_info.cmake
+@@ -28,7 +28,7 @@ if(NOT DEFINED _os_release_info)
+ set(_os_release_info TRUE)
+ 
+ # Set cmake policies for at least this level:
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if(POLICY CMP0054)
+     cmake_policy(SET CMP0054 NEW)
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
