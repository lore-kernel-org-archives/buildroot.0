Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8680C61DB3
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 21:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3495A60E2D;
	Fri,  6 Jan 2023 21:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3495A60E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANbCFs0j4sEj; Fri,  6 Jan 2023 21:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65A1B61191;
	Fri,  6 Jan 2023 21:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65A1B61191
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D63E1BF5EA
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 175C441C6A
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175C441C6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGUHcEDx1wv0 for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 21:01:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8E941C26
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B8E941C26
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 21:01:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.160]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N5G9t-1ooq6N1zOf-011DHu for <buildroot@buildroot.org>; Fri, 06 Jan 2023
 22:01:34 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 22:01:33 +0100
Message-Id: <20230106210133.28803-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:fFK6gyG83KlqJNjuHVqTNBMo0xSY/bpegir2Fx/mnX+/2ykCfsL
 lpeV08c6iUq7SG0NECHT4UB1wq5FAIgqczmU8QhR5KKbtSP6ni9dDuDQ98LOozEXLj45gyJ
 DDAl4aAOiTXq0qV/7mkgxA1SLLeJPc4PM67tShyrTAnqQs/ntXE/zclVVXspT5uQfr0W6R5
 EUKnTTxUF7jPNNyRnWbbw==
UI-OutboundReport: notjunk:1;M01:P0:rvXR/l2jR4I=;lkJhsEpW6ndXCiNefyFrl1ZvB28
 PeLy9/XGZuTB2HregkDbvNVORLz+OVCuL9k0XTprRUxwi1fw49dIjt1M4QagRnXl1ytYVVknG
 8BaBR8XPeb5zND2kCEobx4MeAplDrX9vN0UtpySI3fSjYPCBi47go87MQEKB8wPoxMvUKyyEq
 dOK+m8mseHgvDSQ/JQDxAArzhrWHT91ov5DUvDPVZlDZHyWqLV5lAXDjaIVk9O2nevc8cbxwr
 14tRriYHPQSeP2lYb28W6WisDHii08d7WhVVxrILYJLWyIadKCJG8mz6Y3HL/ACw+6nqHVhmQ
 BNlArcI+pEJowevPacslPNaal76/aM0tm3bYSocy2kkdgOQIgavbkMDozhgRwLKuaZh4Lg6Vq
 BHFdKPNlLLKT9b5ON6EDwTrBu9rL/pkL9AAqKqndq5OO7yWPnDO/eAlO6uFbLWVaG7QIU+KWi
 kz9yrrajZuQSvtZLdswbU7JkbPQN+rAUYfctrkaRVYbpGT3SflqLxlswY3sn5CEZMTQL4Ihbg
 DGNyNIM09ZiRNmSVrPa9zLpOBUKzwlc97F/SFN5IhXWC95NjDCnld52VGbL1DuGQdHhimvSSu
 D+8KSRssEzLR8FskPQMXZejIVbxJuTV0a0nTWaMSuNKLxCDiPlNt9TzyuhQL5hh762e5/5+Vu
 v/rnBmin4KO+Gye6MSf8UXz/nuBhGFyCU3DHini6VT8sTrAQPnNhkUdvfwrQq+Q8qNiQiopz3
 ezB9WScye3sajpDXw19eYvfRnCguVhEFSTfdlqIkHqcln7XAw9+OpqaLP70uWDfI26gW29CvR
 U3BEucz6cFNx2AG38rdH3sv8IjtLe0R76oeijVcvAK1n6vSXhppPNo2crogA031+ZDRCNZenh
 499EqRKL+ZY6Ic6WG3+Tfj29DXUmpfJVgofC6g0jRKDklIZNoG6oMnm7TvRisTN+Ily3R3yQa
 B5Tgdw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1673038894; bh=M6+08WnYB/b/u7g2LQ7/q8NQvnfWWgl7JkVQwPMIB0A=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=aXcje4KOrSFYp5R7ByvwPCB+UOYlp9HCIx5C8QFUR05O28XCek9/SYGIEgtpdU0Ab
 PFzhq6Cl30UvTqgil3E7dRSl6QBtayo92KjQZ1M6JwoLnhmTEPry4kwYPHN93+Hl1k
 JTmym3lW9Hv6bO7owiWA/Nb1Dy34v6yskJzcU2UCVPnyyEu0bc70O9BtPoP7nXRgw4
 3mGOb5iOB2fC/hIBMkClMZwit+QRgARR+DwNwq6Rjm9ggvNSZDJpOtRmQmNXy6HH50
 0zEW2nhWU/Mks3RPts9mLEwf0H1OvWqaIm9mgaYxprdFVs+eiBJ5Q8aIoOdudfeMqU
 mb0zPNRWIQEbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=aXcje4KO
Subject: [Buildroot] [PATCH v1] package/gtest: drop patch adding debug 'd'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- drop patch adding debug 'd' to gmock/gtest library names in pkg-config files
  (not longer needed since gtest version bump to 1.22 ([1]) and upstream
  commit 'FIX #2174 -- remove `DEBUG_POSTFIX`' ([2]).

Fixes:

  http://autobuild.buildroot.net/results/5ea8f180e4909f8157565238b25f567fcf1f3beb

  .../host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/7.3.1/../../../../aarch64-linux-gnu/bin/ld: cannot find -lgtestd

[1] https://git.buildroot.net/buildroot/commit/?id=a336b731af5979a25213b33c5840de6d1ed88bdc
[2] https://github.com/google/googletest/commit/ca3ffd90f2726f6c0c6e790f05c7c88491a16466

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...test.pc-gmock.pc-library-names-for-t.patch | 62 -------------------
 1 file changed, 62 deletions(-)
 delete mode 100644 package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch

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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
