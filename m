Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C67AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:13:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 216F56103C
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 216F56103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB4C6090C;
	Tue, 26 Oct 2021 12:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkwotB2VdoKh; Tue, 26 Oct 2021 12:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3774560632;
	Tue, 26 Oct 2021 12:13:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A82AF1BF38D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95C90401DF
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlfQ62SMSsDr for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:12:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C24740227
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:12:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD53F88CEC; Tue, 26 Oct 2021 12:09:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 13:56:05 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 18d5bff30a99c4e70c6368f2256f4c991f41500b
X-Git-Newrev: 9666c3f942265665ffee3ee0a16c061900f14721
X-Patchwork-Hint: ignore
Message-Id: <20211026120923.CD53F88CEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/gtest: fix
 gtest.pc/gmock.pc library names for the debug build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9666c3f942265665ffee3ee0a16c061900f14721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes:

   - http://autobuild.buildroot.org/results/e1bb8aa1de310f3d27b74ec7d8748d170ad444e2

  >>> libcamera 40f5fddca7f774944a53f58eeaebc4db79c373d8 Building
  [...]
  [114/123] Linking target src/lc-compliance/lc-compliance
  FAILED: src/lc-compliance/lc-compliance
  [...]
  .../host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lgtest

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1afea0b11b140a6d50aff726f2570702cc984a6e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-gtest.pc-gmock.pc-library-names-for-t.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch b/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
new file mode 100644
index 0000000000..c47e8fc8f8
--- /dev/null
+++ b/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
@@ -0,0 +1,62 @@
+From cf5a3177159ca832470e7f876cab0a1923fa666f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 22 Oct 2021 20:17:36 +0200
+Subject: [PATCH] pkg-config: fix gtest.pc/gmock.pc library names for the debug
+ build
+
+In case CMAKE_BUILD_TYPE is set to Debug the gtest library is
+name libgtestd.a but the link command returned from gtest.pc is
+'-lgtest' (without the debug d) and so the linking of dependent
+packages fails (see [1] for a buildroot failure example).
+
+Enhance the gtest.pc ang gmock.pc generation to honour the debug 'd'.
+
+[1] http://lists.busybox.net/pipermail/buildroot/2021-October/626382.html
+
+[Upstream: https://github.com/google/googletest/pull/3625]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ googlemock/cmake/gmock.pc.in          | 2 +-
+ googletest/cmake/gtest.pc.in          | 2 +-
+ googletest/cmake/internal_utils.cmake | 3 +++
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/googlemock/cmake/gmock.pc.in b/googlemock/cmake/gmock.pc.in
+index 23c67b5c..0f469857 100644
+--- a/googlemock/cmake/gmock.pc.in
++++ b/googlemock/cmake/gmock.pc.in
+@@ -6,5 +6,5 @@ Description: GoogleMock (without main() function)
+ Version: @PROJECT_VERSION@
+ URL: https://github.com/google/googletest
+ Requires: gtest = @PROJECT_VERSION@
+-Libs: -L${libdir} -lgmock @CMAKE_THREAD_LIBS_INIT@
++Libs: -L${libdir} -lgmock@DEBUG_POSTFIX@ @CMAKE_THREAD_LIBS_INIT@
+ Cflags: -I${includedir} @GTEST_HAS_PTHREAD_MACRO@
+diff --git a/googletest/cmake/gtest.pc.in b/googletest/cmake/gtest.pc.in
+index b4148fae..225bba81 100644
+--- a/googletest/cmake/gtest.pc.in
++++ b/googletest/cmake/gtest.pc.in
+@@ -5,5 +5,5 @@ Name: gtest
+ Description: GoogleTest (without main() function)
+ Version: @PROJECT_VERSION@
+ URL: https://github.com/google/googletest
+-Libs: -L${libdir} -lgtest @CMAKE_THREAD_LIBS_INIT@
++Libs: -L${libdir} -lgtest@DEBUG_POSTFIX@ @CMAKE_THREAD_LIBS_INIT@
+ Cflags: -I${includedir} @GTEST_HAS_PTHREAD_MACRO@
+diff --git a/googletest/cmake/internal_utils.cmake b/googletest/cmake/internal_utils.cmake
+index 58fc9bfb..fd81b825 100644
+--- a/googletest/cmake/internal_utils.cmake
++++ b/googletest/cmake/internal_utils.cmake
+@@ -335,6 +335,9 @@ function(install_project)
+     # Configure and install pkgconfig files.
+     foreach(t ${ARGN})
+       set(configured_pc "${generated_dir}/${t}.pc")
++      if(CMAKE_BUILD_TYPE MATCHES Debug)
++        set(DEBUG_POSTFIX "d")
++      endif()
+       configure_file("${PROJECT_SOURCE_DIR}/cmake/${t}.pc.in"
+         "${configured_pc}" @ONLY)
+       install(FILES "${configured_pc}"
+-- 
+2.33.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
