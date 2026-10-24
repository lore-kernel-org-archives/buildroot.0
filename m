Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD02606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kPbvkjPs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E3C381179;
	Sat, 24 Oct 2026 21:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPu1bsrr3bFZ; Sat, 24 Oct 2026 21:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4EA66810F3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877423;
	b=KVLTo5WIWHBNbn9QShjXatXGyyE35yaS12e2Pvg7fkqMHNVsr07dxKeozvFuX8JoqNX8
	 U+h6P9HUoiNKWCPxBXsiDuuh/mQf5+RV27Uc7vKpVfHPQ8mPqSWZf7wtDuXDYIiPH/Pi3
	 fhkicVswKUTRmYBLSwoEPT0HedVYLDslCqaAu3pESla3sRMrdYHCSIZISuGy6/J9QhJCJ
	 kV/vHBiEz508JEgXS9oMdxkqdk6SZ9txeXczo6+xTFNO4/qf2Uwrd/8qH57lbe9G9OcNm
	 Wu9wlpS2X4YHYtOWLyGiPqjU9OsWpDJwF9X+ygwcpM4RqN/HGZUC+z46N4wDV5aM+6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QGh+//Q/ihpz+SWZ8CBwTQSEADpCak0GAylGs9GXCZ8=;
	b=ePA3ugbahASi3iGsgV5wqD8VOtMKyEQL7k8j1s54rG0sOUlSOJ5PfP9lwP1uwVjWZPhk
	 EdBjrvkxRABoi3pscwHfdryWQtywTO24zXe+rQiMxYnsjk4j12swOcyp28Rh+tPSoWP/C
	 XV7UNsZsX1i8wjqUAtI1azgn0HQTeVrY0h2Nkry1Fs0OTWTcYT96YKolTQCHMYz/fZHHM
	 xYXCz2m0CWIAAW0nvf9/Xrg3xtksAcPcy5u4rMgP7bWGmuzBeOA6Br2DNQu6wLxCUMABz
	 raFSqfgZPFtJR4/nbCSMKx4CUfSz4FTrI7iH/4bSIUUsLUnfHexA7YV1A0v+1aVS65g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877423;
	bh=QGh+//Q/ihpz+SWZ8CBwTQSEADpCak0GAylGs9GXCZ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kPbvkjPs5UxZ+VnsYBZxmgBfBKoT8u80186MrzKHCGnSSnkx27jNaOVVqv+IRNpag
	 R+MjYNCjItIwyLw+F6x3vGmB3ULjcRkCzsHrDvMh8ZNvNupl/+MybFoNMBOzkbEFZH
	 uEgmwF3mUiQW3/WnQz/QKnuErffMNcWaxvQE4rfdyPLF+kreTxuNT7EPga4LaUi7pz
	 OZ/Hw+nHvSvnB1uaKV8npXkNSCmMec2x97oo8KqeOJ1dUHtRRlmR9am9oF5+kjkDHG
	 UzDv65zkQaoMIf65fs/SFWVa/Ihim7J4h1KjSYaIS1urrRm9rCg7lXbiDmFDcqEwEt
	 0B1bJq8g/rz8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA66810F3;
	Sat, 24 Oct 2026 21:30:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B62003D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C6326061C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TD2tdxPvx6mq for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:30:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6482060615
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877419;
 b=GEg3IfWa59HlQ9KCIb6I/xfFG+I/b7ciWp7sYNGUejNH51WtMvnt1pQVz6iOANVp8ryL
 N+zPbcRcgKW8R3ECWsKRVm1TlVFPqNv3oDEr7HdlLSD01vOu6yQTLhNI12/r6DWKRopBM
 WMzKEg6gsyiRWUekFwnUGn97J2do+J/AyMjQ5DOZwBm7EZB0EidBwf3jflURp37N2x7D+
 z5vM+ZcDJlkIoWarU0RVi2TNSHAWjKDyP3bEKJikV+6BsZHQ5ZlPu6jsw/iFZvfH7QVGX
 Q1O1KQBeymVDW6m17Qd3w9r1FH4PvNhpLj0/SRV9qyOmKAPOgp0rqxHNQOqwKPutnaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877419;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sMioCq5iIpFdzP/+dLX98FVVxz63oLxYBaVgP6ae/Ls=;
 b=Lbc/uh4KLyWSI2AbFYQYg2UQH9yFZLfj52KgwKBiiLQT5rQHChM7o5u3uFXihSh3RExE
 ipFQ7Q/BjbwidOh+zAEBNuytY6d3DulMFp90X1XhoYt6PK+S5jQFXSNzoz5Ex4E1Ju2yj
 2mihwvLg3MAa/miggnLIfZP+OhYhep/4k34HxL6ucSD8EDQzxiWVrfqO1jNpWlcE3RpyM
 6gYAk3VCHzRiHGPTdFomtiOIvrfC1zrmbs10tH8QIWQDtCQUp7JjoKLNmQL5qgwVrGhNu
 5ojUu1zhzhYMuA/HstPvQDOICgJnUJqZJB9Q8Vhi1GjKiaYcUQCW0sxT+qzmsgE+l9A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6482060615
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 451B69CDDB; Sat, 24 Oct 2026 21:28:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:27:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3019b599f8bef0a9a1cb2bf056b16c7e1000fb40
X-Git-Newrev: 662e06def985c76a79210f7f739536d4dbdef970
X-Patchwork-Hint: ignore
Message-Id: <20261024212854.451B69CDDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librdkafka: bump to v2.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/662e06def985c76a79210f7f739536d4dbdef970
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

News: https://github.com/confluentinc/librdkafka/releases#release-v2.16.0

Dropped 0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch,
fix merged in https://github.com/confluentinc/librdkafka/pull/5136.

Refreshed 0001-CMakeLists.txt-allow-compilation-without-C-support.patch
(upstream: https://github.com/confluentinc/librdkafka/pull/5311).

Added 0002-Guard-fenv.h-usage-behind-HAVE_FENV-5650.patch, as fenv.h is
not available on uClibc toolchains without FENV support, which broke the
build since v2.16.0:
  fatal error: fenv.h: No such file or directory
Reported in https://github.com/confluentinc/librdkafka/issues/5650,
fix proposed in https://github.com/confluentinc/librdkafka/pull/5651.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s.txt-allow-compilation-without-C-support.patch |  36 +++--
 ...-Guard-fenv.h-usage-behind-HAVE_FENV-5650.patch | 158 +++++++++++++++++++++
 ..._conf.c-fix-curl-curl.h-include-when-WITH.patch |  32 -----
 package/librdkafka/librdkafka.hash                 |   4 +-
 package/librdkafka/librdkafka.mk                   |   2 +-
 5 files changed, 185 insertions(+), 47 deletions(-)

diff --git a/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch b/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
index 9615aef408..d38d60bdea 100644
--- a/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
+++ b/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
@@ -1,19 +1,25 @@
-From 4584734fc039e06dea71c94045283f3108c7fae8 Mon Sep 17 00:00:00 2001
+From 184ab88b6911e128319ae5ee75b6a7444af2982e Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas@devoogdt.com>
 Date: Sun, 15 Feb 2026 20:41:10 +0100
 Subject: [PATCH] CMakeLists.txt: allow compilation without C++ support
 
-$ CXX=/bin/false cmake . && make
+Only require a C compiler by default, and enable C++ only when a C++
+compiler is found (check_language). When it is missing, skip src-cpp,
+the C++ examples and the tests (which need C++), and default
+RDKAFKA_BUILD_TESTS to OFF. Explicitly enabling the tests without a C++
+compiler is a configure error.
+
+Verified with: CXX=/bin/false cmake . && make
 
 Upstream: https://github.com/confluentinc/librdkafka/pull/5311
 Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 ---
- CMakeLists.txt          | 25 ++++++++++++++++++++-----
+ CMakeLists.txt          | 30 +++++++++++++++++++++++++-----
  examples/CMakeLists.txt | 30 ++++++++++++++++++++----------
- 2 files changed, 40 insertions(+), 15 deletions(-)
+ 2 files changed, 45 insertions(+), 15 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f3d05bad..7676f897 100644
+index 1e3c4450..c9c65c2e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -3,7 +3,15 @@ cmake_minimum_required(VERSION 3.5)
@@ -33,16 +39,21 @@ index f3d05bad..7676f897 100644
  
  set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packaging/cmake/Modules/")
  
-@@ -181,7 +189,7 @@ endif()
+@@ -181,7 +189,12 @@ endif()
  
  option(RDKAFKA_BUILD_STATIC "Build static rdkafka library" OFF)
  option(RDKAFKA_BUILD_EXAMPLES "Build examples" ON)
 -option(RDKAFKA_BUILD_TESTS "Build tests" ON)
-+option(RDKAFKA_BUILD_TESTS "Build tests" CMAKE_CXX_COMPILER)
++if(CMAKE_CXX_COMPILER)
++  set(build_tests_default ON)
++else()
++  set(build_tests_default OFF)
++endif()
++option(RDKAFKA_BUILD_TESTS "Build tests" ${build_tests_default})
  if(WIN32)
      option(WITHOUT_WIN32_CONFIG "Avoid including win32_config.h on cmake builds" ON)
  endif(WIN32)
-@@ -279,13 +287,20 @@ install(
+@@ -279,13 +292,20 @@ install(
  )
  
  add_subdirectory(src)
@@ -63,11 +74,11 @@ index f3d05bad..7676f897 100644
 +    enable_testing()
 +    add_subdirectory(tests)
 +  else()
-+    message(FATAL_ERROR "Building tests needs C++ suport")
++    message(FATAL_ERROR "Building tests needs C++ support")
 +  endif()
  endif()
 diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 91851d2c..28ce6e79 100644
+index d9ce7ac2..a71cd136 100644
 --- a/examples/CMakeLists.txt
 +++ b/examples/CMakeLists.txt
 @@ -5,8 +5,10 @@ endif(WIN32)
@@ -110,7 +121,7 @@ index 91851d2c..28ce6e79 100644
  
  add_executable(misc misc.c ${win32_sources})
  target_link_libraries(misc PUBLIC rdkafka)
-@@ -73,7 +81,9 @@ if(NOT WIN32)
+@@ -73,8 +81,10 @@ if(NOT WIN32)
      add_executable(rdkafka_complex_consumer_example rdkafka_complex_consumer_example.c)
      target_link_libraries(rdkafka_complex_consumer_example PUBLIC rdkafka)
  
@@ -121,7 +132,8 @@ index 91851d2c..28ce6e79 100644
 +        target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
 +    endif(CMAKE_CXX_COMPILER)
  
- endif(NOT WIN32)
+     add_executable(share_consumer share_consumer.c)
+     target_link_libraries(share_consumer PUBLIC rdkafka)
 -- 
 2.43.0
 
diff --git a/package/librdkafka/0002-Guard-fenv.h-usage-behind-HAVE_FENV-5650.patch b/package/librdkafka/0002-Guard-fenv.h-usage-behind-HAVE_FENV-5650.patch
new file mode 100644
index 0000000000..60ef042cd7
--- /dev/null
+++ b/package/librdkafka/0002-Guard-fenv.h-usage-behind-HAVE_FENV-5650.patch
@@ -0,0 +1,158 @@
+From 476e962d5da476093f98a76b2c605e852fbc41cb Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sat, 24 Oct 2026 15:22:59 +0200
+Subject: [PATCH] Guard fenv.h usage behind HAVE_FENV (#5650)
+
+fenv.h is not available on some toolchains (e.g. uClibc without FENV
+support), which broke the build since the FPE check was added to the
+histogram unit test.
+
+Detect fenv.h at configure time (configure.self and CMake) and only use
+it when available.
+
+Upstream: https://github.com/confluentinc/librdkafka/pull/5651
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ CHANGELOG.md                                    |  4 ++++
+ CMakeLists.txt                                  |  2 ++
+ configure.self                                  |  8 ++++++++
+ packaging/cmake/config.h.in                     |  1 +
+ packaging/cmake/try_compile/fenv_test.c         |  6 ++++++
+ packaging/cmake/try_compile/rdkafka_setup.cmake | 11 +++++++++++
+ src/rdhdrhistogram.c                            |  6 ++++++
+ 7 files changed, 38 insertions(+)
+ create mode 100644 packaging/cmake/try_compile/fenv_test.c
+
+diff --git a/CHANGELOG.md b/CHANGELOG.md
+index bf450191..eff77118 100644
+--- a/CHANGELOG.md
++++ b/CHANGELOG.md
+@@ -57,6 +57,10 @@ callers retry them instead of treating them as a hard failure.
+ 
+ ### General fixes
+ 
++* Issues: #5650.
++  Fix build failure on platforms without `fenv.h` (e.g., uClibc toolchains without FENV support).
++  `fenv.h` is now detected at configure time (`HAVE_FENV`) and only used by the histogram unit test when available.
++  Happening since 2.16.0.
+ * Issues: #5600.
+   Fix re-bootstrap cases that never reached a bootstrap broker while the learned brokers were still connected, or kept an already connected bootstrap broker.
+   The client kept asking the very brokers that reported its metadata as stale. Learned and bootstrap brokers are now decommissioned when a re-bootstrap sequence starts, so the bootstrap servers are re-created and connected again, re-resolving their addresses, and only they are used until a Metadata response rebuilds the broker list. The transaction coordinator is reset too when its broker is decommissioned, so the coordinator connection is re-established and its address re-resolved, as already done for the group coordinator. Queued messages are handed back to their partitions and re-sent once new leaders are known. Admin requests in flight on a decommissioned broker now fail with `RD_KAFKA_RESP_ERR__TRANSPORT` (previously
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1e3c4450..393c4242 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -195,6 +195,7 @@ endif(WIN32)
+ # * HAVE_ATOMICS_64_SYNC
+ # * HAVE_REGEX
+ # * HAVE_STRNDUP
++# * HAVE_FENV
+ # * HAVE_PTHREAD_SETNAME_GNU
+ # * HAVE_PTHREAD_SETNAME_DARWIN
+ # * HAVE_PTHREAD_SETNAME_FREEBSD
+@@ -224,6 +225,7 @@ set(GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
+ # * WITH_SASL
+ # * HAVE_REGEX
+ # * HAVE_STRNDUP
++# * HAVE_FENV
+ # * HAVE_PTHREAD_SETNAME_GNU
+ # * HAVE_PTHREAD_SETNAME_DARWIN
+ # * HAVE_PTHREAD_SETNAME_FREEBSD
+diff --git a/configure.self b/configure.self
+index 13a2c284..a2c4bf4f 100644
+--- a/configure.self
++++ b/configure.self
+@@ -226,6 +226,14 @@ int foo (void) {
+    return getentropy((void *)seed, sizeof(seed));
+ }"
+ 
++    # Check if fenv.h is available (isn't on uClibc without FENV support)
++    mkl_compile_check "fenv" "HAVE_FENV" disable CC "" \
++"#include <fenv.h>
++int foo (void) {
++   feclearexcept(FE_DIVBYZERO | FE_INVALID);
++   return fetestexcept(FE_DIVBYZERO | FE_INVALID);
++}"
++
+     # Check if strndup() is available (isn't on Solaris 10)
+     mkl_compile_check "strndup" "HAVE_STRNDUP" disable CC "" \
+ "#include <string.h>
+diff --git a/packaging/cmake/config.h.in b/packaging/cmake/config.h.in
+index d09a56f9..8ae6cec2 100644
+--- a/packaging/cmake/config.h.in
++++ b/packaging/cmake/config.h.in
+@@ -46,6 +46,7 @@
+ #cmakedefine01 HAVE_STRNDUP
+ #cmakedefine01 HAVE_RAND_R
+ #cmakedefine01 HAVE_GETENTROPY
++#cmakedefine01 HAVE_FENV
+ #cmakedefine01 HAVE_PTHREAD_SETNAME_GNU
+ #cmakedefine01 HAVE_PTHREAD_SETNAME_DARWIN
+ #cmakedefine01 HAVE_PTHREAD_SETNAME_FREEBSD
+diff --git a/packaging/cmake/try_compile/fenv_test.c b/packaging/cmake/try_compile/fenv_test.c
+new file mode 100644
+index 00000000..b6f2be2d
+--- /dev/null
++++ b/packaging/cmake/try_compile/fenv_test.c
+@@ -0,0 +1,6 @@
++#include <fenv.h>
++
++int main() {
++        feclearexcept(FE_DIVBYZERO | FE_INVALID);
++        return fetestexcept(FE_DIVBYZERO | FE_INVALID);
++}
+diff --git a/packaging/cmake/try_compile/rdkafka_setup.cmake b/packaging/cmake/try_compile/rdkafka_setup.cmake
+index ca9bc93e..9352dcae 100644
+--- a/packaging/cmake/try_compile/rdkafka_setup.cmake
++++ b/packaging/cmake/try_compile/rdkafka_setup.cmake
+@@ -22,6 +22,17 @@ try_compile(
+     "${TRYCOMPILE_SRC_DIR}/getentropy_test.c"
+ )
+ 
++set(_fenv_link_libs "")
++if(NOT WIN32)
++    set(_fenv_link_libs "-lm")
++endif()
++try_compile(
++    HAVE_FENV
++    "${CMAKE_CURRENT_BINARY_DIR}/try_compile"
++    "${TRYCOMPILE_SRC_DIR}/fenv_test.c"
++    LINK_LIBRARIES ${_fenv_link_libs}
++)
++
+ try_compile(
+     HAVE_PTHREAD_SETNAME_GNU
+     "${CMAKE_CURRENT_BINARY_DIR}/try_compile"
+diff --git a/src/rdhdrhistogram.c b/src/rdhdrhistogram.c
+index 2466b098..3fa319a6 100644
+--- a/src/rdhdrhistogram.c
++++ b/src/rdhdrhistogram.c
+@@ -73,7 +73,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <math.h>
++#if HAVE_FENV
+ #include <fenv.h>
++#endif
+ 
+ #include "rdhdrhistogram.h"
+ #include "rdunittest.h"
+@@ -662,11 +664,15 @@ static int ut_unitmagnitude_overflow(void) {
+         rd_hdr_histogram_t *hdr;
+         int r;
+ 
++#if HAVE_FENV
+         feclearexcept(FE_DIVBYZERO | FE_INVALID);
++#endif
+         hdr = rd_hdr_histogram_new(0, 200, 4);
++#if HAVE_FENV
+         RD_UT_ASSERT(
+             !fetestexcept(FE_DIVBYZERO | FE_INVALID),
+             "rd_hdr_histogram_new(0,...) raised an FP exception (#4949)");
++#endif
+ 
+         r = rd_hdr_histogram_record(hdr, 11);
+         RD_UT_ASSERT(r, "record(11) failed\n");
+-- 
+2.43.0
+
diff --git a/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch b/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch
deleted file mode 100644
index dec80d538c..0000000000
--- a/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5061a5b33dce11ada740e2a34137dce6934b731a Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sun, 15 Feb 2026 18:37:16 +0100
-Subject: [PATCH] src/rdkafka_conf.c: fix curl/curl.h include when
- WITH_CURL=OFF
-
-Change #ifdef to #if for WITH_OAUTHBEARER_OIDC preprocessor check.
-When using CMake's cmakedefine01, the macro is always defined (as 0 or 1),
-so #ifdef always evaluates to true. Using #if correctly checks the value.
-
-Upstream: https://github.com/confluentinc/librdkafka/pull/5309
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- src/rdkafka_conf.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rdkafka_conf.c b/src/rdkafka_conf.c
-index 0e346e74..f8f0d0ca 100644
---- a/src/rdkafka_conf.c
-+++ b/src/rdkafka_conf.c
-@@ -56,7 +56,7 @@
- #include <windows.h>
- #endif
- 
--#ifdef WITH_OAUTHBEARER_OIDC
-+#if WITH_OAUTHBEARER_OIDC
- #include <curl/curl.h>
- #endif
- 
--- 
-2.43.0
-
diff --git a/package/librdkafka/librdkafka.hash b/package/librdkafka/librdkafka.hash
index f745e55b81..aea35f7412 100644
--- a/package/librdkafka/librdkafka.hash
+++ b/package/librdkafka/librdkafka.hash
@@ -1,4 +1,4 @@
-# From https://github.com/confluentinc/librdkafka/releases/tag/v2.13.2
-sha256  14972092e4115f6e99f798a7cb420cbf6daa0c73502b3c52ae42fb5b418eea8f  librdkafka-2.13.2.tar.gz
+# From https://github.com/confluentinc/librdkafka/releases/tag/v2.16.0
+sha256  e6b61de61d3282879a88e4ee3d9f634a8b05bf78a9198dfc25c4820c0c9ed231  librdkafka-2.16.0.tar.gz
 # Locally computed
 sha256  b9e4616bb9dd0c9ce3fa52e81c7bfc596e60b8855a1df5dce5fa50732b1ccdec  LICENSES.txt
diff --git a/package/librdkafka/librdkafka.mk b/package/librdkafka/librdkafka.mk
index 0cbab11d49..636765b3f5 100644
--- a/package/librdkafka/librdkafka.mk
+++ b/package/librdkafka/librdkafka.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRDKAFKA_VERSION = 2.13.2
+LIBRDKAFKA_VERSION = 2.16.0
 LIBRDKAFKA_SITE = $(call github,confluentinc,librdkafka,v$(LIBRDKAFKA_VERSION))
 LIBRDKAFKA_LICENSE = BSD-2-Clause
 LIBRDKAFKA_LICENSE_FILES = LICENSES.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
