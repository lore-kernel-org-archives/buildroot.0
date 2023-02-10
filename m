Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11C6C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C57F60B4C;
	Fri, 10 Feb 2023 22:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C57F60B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ygUBlw2bgaGG; Fri, 10 Feb 2023 22:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FCE06077D;
	Fri, 10 Feb 2023 22:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FCE06077D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17B7F1BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E650840AF7
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E650840AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhkwlGiNvhME for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09D64401B2
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D64401B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA62A85015; Fri, 10 Feb 2023 22:27:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:26:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f868e97f6b42ccaa0844880775f86002656227d
X-Git-Newrev: f661c00342befb21c0032e593c758dfb2d336007
X-Patchwork-Hint: ignore
Message-Id: <20230210222713.EA62A85015@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: drop patch adding debug 'd'
 to library names in pkg-config files
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

commit: https://git.buildroot.net/buildroot/commit/?id=f661c00342befb21c0032e593c758dfb2d336007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- drop patch adding debug 'd' to gmock/gtest library names in pkg-config files
  (not longer needed since gtest version bump to 1.22 ([1]) and upstream
  commit 'FIX #2174 -- remove `DEBUG_POSTFIX`' ([2]).

Fixes:

  http://autobuild.buildroot.net/results/5ea8f180e4909f8157565238b25f567fcf1f3beb

  .../host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/7.3.1/../../../../aarch64-linux-gnu/bin/ld: cannot find -lgtestd

[1] https://git.buildroot.net/buildroot/commit/?id=a336b731af5979a25213b33c5840de6d1ed88bdc
[2] https://github.com/google/googletest/commit/ca3ffd90f2726f6c0c6e790f05c7c88491a16466

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fix-gtest.pc-gmock.pc-library-names-for-t.patch | 62 ----------------------
 1 file changed, 62 deletions(-)

diff --git a/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch b/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
deleted file mode 100644
index c47e8fc8f8..0000000000
--- a/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From cf5a3177159ca832470e7f876cab0a1923fa666f Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 22 Oct 2021 20:17:36 +0200
-Subject: [PATCH] pkg-config: fix gtest.pc/gmock.pc library names for the debug
- build
-
-In case CMAKE_BUILD_TYPE is set to Debug the gtest library is
-name libgtestd.a but the link command returned from gtest.pc is
-'-lgtest' (without the debug d) and so the linking of dependent
-packages fails (see [1] for a buildroot failure example).
-
-Enhance the gtest.pc ang gmock.pc generation to honour the debug 'd'.
-
-[1] http://lists.busybox.net/pipermail/buildroot/2021-October/626382.html
-
-[Upstream: https://github.com/google/googletest/pull/3625]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- googlemock/cmake/gmock.pc.in          | 2 +-
- googletest/cmake/gtest.pc.in          | 2 +-
- googletest/cmake/internal_utils.cmake | 3 +++
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/googlemock/cmake/gmock.pc.in b/googlemock/cmake/gmock.pc.in
-index 23c67b5c..0f469857 100644
---- a/googlemock/cmake/gmock.pc.in
-+++ b/googlemock/cmake/gmock.pc.in
-@@ -6,5 +6,5 @@ Description: GoogleMock (without main() function)
- Version: @PROJECT_VERSION@
- URL: https://github.com/google/googletest
- Requires: gtest = @PROJECT_VERSION@
--Libs: -L${libdir} -lgmock @CMAKE_THREAD_LIBS_INIT@
-+Libs: -L${libdir} -lgmock@DEBUG_POSTFIX@ @CMAKE_THREAD_LIBS_INIT@
- Cflags: -I${includedir} @GTEST_HAS_PTHREAD_MACRO@
-diff --git a/googletest/cmake/gtest.pc.in b/googletest/cmake/gtest.pc.in
-index b4148fae..225bba81 100644
---- a/googletest/cmake/gtest.pc.in
-+++ b/googletest/cmake/gtest.pc.in
-@@ -5,5 +5,5 @@ Name: gtest
- Description: GoogleTest (without main() function)
- Version: @PROJECT_VERSION@
- URL: https://github.com/google/googletest
--Libs: -L${libdir} -lgtest @CMAKE_THREAD_LIBS_INIT@
-+Libs: -L${libdir} -lgtest@DEBUG_POSTFIX@ @CMAKE_THREAD_LIBS_INIT@
- Cflags: -I${includedir} @GTEST_HAS_PTHREAD_MACRO@
-diff --git a/googletest/cmake/internal_utils.cmake b/googletest/cmake/internal_utils.cmake
-index 58fc9bfb..fd81b825 100644
---- a/googletest/cmake/internal_utils.cmake
-+++ b/googletest/cmake/internal_utils.cmake
-@@ -335,6 +335,9 @@ function(install_project)
-     # Configure and install pkgconfig files.
-     foreach(t ${ARGN})
-       set(configured_pc "${generated_dir}/${t}.pc")
-+      if(CMAKE_BUILD_TYPE MATCHES Debug)
-+        set(DEBUG_POSTFIX "d")
-+      endif()
-       configure_file("${PROJECT_SOURCE_DIR}/cmake/${t}.pc.in"
-         "${configured_pc}" @ONLY)
-       install(FILES "${configured_pc}"
--- 
-2.33.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
