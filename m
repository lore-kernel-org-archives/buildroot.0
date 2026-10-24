Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0139606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e78+BqLj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA9F6067A;
	Sat, 24 Oct 2026 14:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKAV-fHCsXoi; Sat, 24 Oct 2026 14:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6AC5360680
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792851019;
	b=tCBD2OnylY5c6osUrofQgK3pXuv9n/YfnFUcEO7I9p97HvQxl8dC0ansYvm6P64EN3tw
	 TBqWKWbdkys9L3llwb7raJQ+ROnw8abWtrhk13xJkaQlDXlz6QawcBINdNmwhy4K9xXwC
	 R9WIcPz9Cr9QiLcYStTP6mveR5En78CN9ijzQKdQt7eyY8aDrA2Qa4pllLb8/l/i80M1R
	 H7FcTCkAVvJbHgCnhGWAgosw3u10Hj9rRFa9ak+RUlpwzpaAwSvfA4BU2ANdaJ7OjtR97
	 2mMNz/IcuOiVQ8jUPYcOQJnSrHSxJUvOtbaNc3MRq/CxGGpGp5ui5WX/yktNvnl5r0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792851019;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CGXkKZB2n5g8moDZYdBjEjH7ZdtFdBnLzW3v5L3ncfw=;
	b=BucZawxDR/bv/nWHOMT7V7aDJWTNcgrHl2JmgNnybuASMAhrWTJva4FvKVyFURqubN4z
	 9243hy+Mq0CTRbNUtnsieSu0IcNbO7xurViNv7yGHl8bD/wjaemnbda1D/QoURqe8Wpfw
	 6j0sR2vP00aYYKhWLvSl8iUqRyGHZn0wvVFThT3+GlPLb6cVsrkqg0s1cAsPBWXHsQs2o
	 qDtuLMg2yykckKhcKV2EMxxnmQLa576NFwJSq1PEvQJG9g6J7zTQaoSCnvv1Kn7M8OBju
	 IzFwLVqq7Olf5IDcrG4dZH8tpZwwIMJNJn17ryepELJp/yrAvtCSUGhLUGDs4lI4kzQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792851019;
	bh=CGXkKZB2n5g8moDZYdBjEjH7ZdtFdBnLzW3v5L3ncfw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e78+BqLjTjY3XNN2I0J9IpF3y74iCHa4vL81UafaLhNcHGV8MTOfdQUlLwFZCbgzk
	 nCy2R2vd+gh+zs7VSpiNzhQ7yQBbqf71kvfN7Xb+3pJ4qarxdSzJi6IbK8jxTQEFeQ
	 dje+FIyJCsCB/RBm8WoiKbrPH+jziFZRFLxSXjfNLW7jXkktNK+oIE5mhLN1msUqZS
	 w45nZRyNIaocwxXimPx9LXsZaVDKOyPa7krD/+OAL4sVGnL2RJLCxVWYugB31U9/E2
	 jYm0BWtOkix4w73xHoFVjafiwmhbJnrR6IcQsUPDY4Fo4bRv/TtI0A9oxx82bSiCXi
	 ADZgjziZzAg+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AC5360680;
	Sat, 24 Oct 2026 14:10:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98325380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E33F815AD
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfHDR9-3EO8q for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:10:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DB99181589
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792851016;
 b=pDyCC89LBCqxNkhSbVGgbDi8bRwxIJcPY248joDpVnmbam7+eoiHgAHTdL7LY5S9AQvp
 HfTZ9mkCz+kJIzLPmz8zLXc+EJM0NafT6okvSCJfIZpC6vyoFBTbcbCkRXBsjF89bBPH2
 8CYMCNt/LOOu0+G6os7M9q5fHQBtNqz4Im/45mmJP++6fue0MoS4NLUyuI76z5f8U1B4w
 hHDKKMQSzKbWDuJP482sbOxbpF1cCJeGIFhb9FPjoRyUDXe22xr2tet6IPsatLhVxxDD1
 J9Sj037yYtnHjE9M0RwpsL3sZG6ydAb3kdTv5YoxnG1FF4iz/GeCKauQxMmixXJHbiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792851016;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=K0vrBrfXqs4oZ8nMg/v5JYxtYN+t+PjVajxHDPkRXo0=;
 b=TmMbxatWW6FWV9CW6blDrlZ5KgxFZOzduK21GAIJvsy+3fv8mWuiJYhqm89PvS2ABE33
 xYkgA5yVAc3q5Dq+R0MNtKtL9EJro64Reg3j0EE5ZT4UAqP0HAwTt8usoEf0pIg6aXCed
 SdMkxfy8wChjIWzf4aFqns+Rrz8NX2R0xTRBodR5IPoqsoYS2yU7Nlcy0DVyu1F8NCSF2
 vp03/l/MS0b4Fn3hkElvMThxcBcRWgDK6ldclqVDfyHlfp5/7FwlNUkNcKPuygNXHdzEn
 R2KHuL/0bkYchNWJuu9kKOlRX1YIr7b/odBd8IN7MhR6c4N1y3Ig6F4f4svtXO9M+lw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 arc=none smtp.remote-ip=209.85.221.42
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.42;
 helo=mail-wr1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB99181589
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:10:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so1110328f8f.2
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792851013; x=1793455813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K0vrBrfXqs4oZ8nMg/v5JYxtYN+t+PjVajxHDPkRXo0=;
 b=aRNtjZbDdb5y5GI+/YTkmCXteyx/lkQAgEJGnaXjCsI17wQQv8OUZcbv3kC4ywP274
 R/i2in9+3mW0p6E+dJ8cg98VzQh1iej9vgoMpRFFTlbt7v8zKWtE7H0u3GGkQkAU2+lR
 LvT65EhjyGzDGLOxyxyNofQ0uiknTTVOECMKzCuX3UtARkvhQBXBDg3VQHfk2KRO46BX
 Ci/rnnoIh36uwrQrFJrW8YJjsAh8LKyXoBZV7silrqkS+cEfYKyqSktV7bnO6GrAfha6
 swbvw0QCSfeqdgZehNbSfkjdS6pOab+lXGFQwEV/6bqgxobx/QZrZHvzJupuo66E3YCR
 BIAw==
X-Gm-Message-State: AFq9FYJgL0bs/cqyjfvFqvoKGrnEDKQz9Ziks+w57LqGfgEOlNDwlTmR
 MQYdlfZKS06hKjQb0RAGrM8nXlfDbgLtOuwFIw0t2mkczTxEm6e1ldptiENxtw==
X-Gm-Gg: AYBFou0TEUVbpIm+OQHvtuCQJx/dorPIv3ZqhVjdvBdEC4qEGFO8PhM7sJwhgnfnoRf
 X4AGDHUUQ3wWO4hVmhmd7t0KETBv/NxDOvOw4PJozLOzRgpBVIo0KN4P++NkdHH123EzjZdVVPm
 Sl6Q5ee6HxC6jUmTjZN9M78G3/tr7AipHeL3X9Yt8Bdg6ZOuRuW/6jB8I2Q5uyAiSyq6SKJD2R2
 KWpOTEDIhGcH3SYqVDYnfyv7VSzKSKQyBBzppvwrm+NIDHfVJGpmbzCfIlPeEk7r/5ZLxStcHhy
 HdUZD1UelFxc/c4FXw0TsQy+hRHXnfpL1EUCZ4/tk9Ix81uGnZW888VYVVTQLf6AeFSnbVS+9zL
 CYpf63FNMgYoErC511ja4K8Q0Ms3UA6oWdtAt5OVQ7HDeO5BN8c32GKaEBIauEDZL8OYq2nJ/lB
 fP53fDLu4jbjJ5N2ZUcSypcPctKqp4Tf6cTSTeC5H3kDA7vPUWBg6wxn7Z6z+i3HUMIQSE66n8I
 SevhB0JHTPDzZKdPMHpBKXZgXiJmzVuclIJUB+AE6PYK4F7CP9RU9//N+i//AcnNw1h6NVZ8+bF
 yjCxJXRqFsoxx+hV2SeiTGr8TOdotim8Oprj4LEOizXLW9Byg63W9N6X3CDWvnvpnH5grDRWClf
 R5daigmusbHko0hs=
X-Received: by 2002:a5d:43ce:0:b0:48c:77ad:d52d with SMTP id
 ffacd0b85a97d-48e3eb9fdfcmr2302487f8f.43.1792851013183; 
 Sat, 24 Oct 2026 07:10:13 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb5f:fa00:a625:9f0:b064:c303])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3bdbsm3676517f8f.19.2026.10.24.07.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 07:10:12 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 24 Oct 2026 16:10:08 +0200
Message-ID: <20261024141008.1967095-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/librdkafka: bump to v2.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
---
 ...-allow-compilation-without-C-support.patch |  36 ++--
 ...d-fenv.h-usage-behind-HAVE_FENV-5650.patch | 158 ++++++++++++++++++
 ....c-fix-curl-curl.h-include-when-WITH.patch |  32 ----
 package/librdkafka/librdkafka.hash            |   4 +-
 package/librdkafka/librdkafka.mk              |   2 +-
 5 files changed, 185 insertions(+), 47 deletions(-)
 create mode 100644 package/librdkafka/0002-Guard-fenv.h-usage-behind-HAVE_FENV-5650.patch
 delete mode 100644 package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch

diff --git a/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch b/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
index 9615aef408c..d38d60bdea3 100644
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
index 00000000000..60ef042cd79
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
index dec80d538c9..00000000000
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
index f745e55b819..aea35f7412b 100644
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
index 0cbab11d496..636765b3f5d 100644
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
