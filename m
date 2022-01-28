Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1244EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B954040286;
	Fri, 28 Jan 2022 12:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKstBUmEazjS; Fri, 28 Jan 2022 12:46:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D54940AD8;
	Fri, 28 Jan 2022 12:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 978BD1BF332
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 933DC84C68
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9jQjC0KAjUm for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:45:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A155A84C64
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643373940;
 bh=IDZ/dhZniT07Ep1j0N3xubRg/g1B/gbtQomtZqVbuAc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=C7BllsvOs0fySmiDTlXVtxtfGkKC/i6Hb5smrLzQVJJGSPvA++cGw6JG4c57+Huuu
 22ebPMzKmd/EW8QDVp7DlzfzSHOaKdhtX8gwqNV3MkF7nUkVbAGkjpAqmpIf8wb4Xg
 6VoRH3BnDJE7RO4JTWnI6RVWaHXounuvszbOm9zI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.233]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mi2Jn-1mZR2r0ZX7-00e4Ew; Fri, 28 Jan 2022 13:45:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 13:45:37 +0100
Message-Id: <20220128124538.31789-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128124538.31789-1-ps.report@gmx.net>
References: <20220128124538.31789-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jMmsYPYaufg+TzMvGXn2DPo1e3MN91uXi2eBRFjepW49tthQoaZ
 gfpF6BxWxsBDAafxR4xQ/pyTMaF5bbJdiEwCTc9Onmhfh10eBU9uGJaTU9vaenBm+OPUF4/
 BVQjj9J7JMuppNQ+a2Qa8lRtLni/J+fUmakbe46Z4NcopgbLtKgp6pcfiTG7K4j/uOsEcUc
 gxUswJNtJTglNAj0jSMJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7xaoKgqZtMI=:VOu1+7E7ZB8HmP3FWYktyN
 Bgn5gXjP9oFcNXaH4uFfm9bc6uUS8ig2q0zzIkmYXSX/GKzGPNDIyoND6agzU+dfm5yNPRxMs
 A3UJwtEUcE86ROfuaQs0sTOvRDzvaIeuLbAxbGkxXRwdsrpWfwY/gBCF0VF7JmxHNIW2Gn0JN
 oACp3Dk1LOb2+j/6nYylnz2SeTFYQUXpnk33Migge8NNQUGu9/Nx+49DblnTSnqFhhBSD8+ST
 eEQ3WZ5JVUjxEdAYPwscrX+qLM+2qYTvcXyDgcCuLarjAeRcaF5Z4PDblA/Ra5PrcrbyCBNON
 CHUq7HlMFV+xqEoEOO7jvQfJ4o/kGjrgR2ZNyFIGShNeoEz+Ia1bXJo5tauQTBOhFc6EQxWb8
 suuLjKN9CEFCvmsar9jD8RvUweUNbSLHHrSmt0DSDGaaEJKD1/rogUr0n11drEM2I4ltwRjc0
 LZhn7MICodJ2XZbAT/yGCby846/5Q4w7qSDXTVXNREgIthUpr5SNtXS7MsVvSmE1EAE6CaCLS
 e6XvtDEQXXfqeknp23G4uKZumOplPHCFAts1ROMB2AV5n58OU2uZ3VD4IrL7rBfCJj7OV6r4p
 U6q1jIaN39XQFnse6Cjt3sQ5GFl0i2VqFnytBSescmMGfCjzuj65xc/8BxXWO2RkJ3jOsz+M4
 f/WOZFB5tD0mqjxvrsrtxGdHR9o1wce0xuc21ZZ4XEUUvmTEiOdNkxhnA+dzfeC+r/idOMi/t
 CGBbooB1FXpJVDTzBrGQ20rbvEaKmddbVGX7BJZryqc2QVtHPw3UywTXeGvTYbEx9jDY0XvL3
 QVy653nV2BVIUzGc6jAzKkLVdXZk+XcdkWgtOO96mhuGHkut7zhG2GeuW/uCjfpYYKlE7eg3P
 81dutT0WVnAIiK0mnerPim2HlX5/o5fSMsPS/MUKfbHiHwOKwXvxQYb8c+ZtCGf8Ombc42T+G
 vJ/4z7CSjiKNFI0T8Gj3cLpzbnkS3oo2mYDLg0GzfL4STWWV/+noyVLUqRJEyVSNWFm2a2kcY
 dssuwRdtk4ikn9X/+BJGEBKHiks4Q3L9XqHFXGocXN7lfgzk8cPXWtuPyFKblgjcykLD1ikRX
 Q9kW4x1K8xBFWA=
Subject: [Buildroot] [PATCH v1 2/3] package/log4cxx: fix boost-fallback
 (only check for boost if really needed)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add patch 0002-boost-fallback-only-check-for-boost-if-really-needed.patch
  to check for boost if really needed (in case of legacy c++ standard < c++17)

Fixes:

  - http://autobuild.buildroot.net/results/8d49ab7cd9952f6a13bdd330e875012d0601f1d2

  -- Found Boost: .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include (found version "1.78.0") found components: thread chrono missing components: date_time atomic
  CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
    Target "cmTC_aac37" links to target "Boost::date_time" but the target was
    not found.  Perhaps a find_package() call is missing for an IMPORTED
    target, or an ALIAS target is missing?

  CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
    Target "cmTC_aac37" links to target "Boost::atomic" but the target was not
    found.  Perhaps a find_package() call is missing for an IMPORTED target, or
    an ALIAS target is missing?

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...nly-check-for-boost-if-really-needed.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch

diff --git a/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch b/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch
new file mode 100644
index 0000000000..7df29ea120
--- /dev/null
+++ b/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch
@@ -0,0 +1,36 @@
+From 24e7adc8d67b3c8f7d275b4f9a7e70a61b73fcd4 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 28 Jan 2022 13:11:01 +0100
+Subject: [PATCH] boost-fallback: only check for boost if really needed
+
+- only check for boost if really needed (in case of legacy c++ standard < c++17)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/cmake/boost-fallback/boost-fallback.cmake | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/cmake/boost-fallback/boost-fallback.cmake b/src/cmake/boost-fallback/boost-fallback.cmake
+index 8285b0b9..0ecf8c6c 100644
+--- a/src/cmake/boost-fallback/boost-fallback.cmake
++++ b/src/cmake/boost-fallback/boost-fallback.cmake
+@@ -55,6 +55,8 @@ try_compile(STD_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tes
+ try_compile(STD_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+     "${CMAKE_CURRENT_LIST_DIR}/test-stdatomic.cpp")
+ 
++# search for boost only in case needed for legacy c++ standard < c++17
++if(NOT ${STD_THREAD_FOUND} OR NOT ${STD_MUTEX_FOUND} OR NOT ${STD_SHARED_MUTEX_FOUND} OR NOT ${STD_SHARED_PTR_FOUND} OR NOT ${STD_ATOMIC_FOUND})
+ find_package(Boost COMPONENTS thread)
+ if( ${Boost_FOUND} )
+     try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+@@ -67,6 +69,7 @@ if( ${Boost_FOUND} )
+     try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+         "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
+ endif( ${Boost_FOUND} )
++endif()
+ 
+ # Link the target with the appropriate boost libraries(if required)
+ function(boostfallback_link target)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
