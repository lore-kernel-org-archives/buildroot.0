Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A85606A91C
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jt3ps+xV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55361405E8;
	Mon,  2 Nov 2026 15:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fObroZy_jSQH; Mon,  2 Nov 2026 15:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3D48B40608
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632011;
	b=GheOOzvPc9VGUTbQTtRTNgfAKQAg6BCyGwMd22IYITfu3jGLcrz918aaKBQiADBneR1i
	 HAiU9HqzFxNe/Wce8+pU5GS9JRgooDHbir62ty7tAKHfEWGQb1rg1uOwXmrcWnTqM85Zx
	 JniVMIhOP4Ho5UOL/B7RGOfegCtqJnjoGHtMLmygxqJQkpNjiR0PFB8hUuAo578vBJjvy
	 McKyq9o5Ge2AZeKtQY5hynHeWiOT5Mi/5rzpvEYO0akrdjFGa0YMjBjguR0Q5+feV8LNG
	 EXsa/Kqd44Ph6Jivks5YJjyRQTKPCL3BvsOJV1FJ6Pymb6ZT/TuAUThiPyEtDlGH+6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632011;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hK3vQGe+xJIBLM56oSwyzxc/dVPC8KZFXRckp1vomzs=;
	b=qgnB1Fql/av040RVDKMQLvbrs7PMgACDqH3xs2ND75GRkxxKrhU8m4fl9phf0ITWG9Wj
	 czTWwy4dFeu0s8VGT/XtKYnS7Saacri3VGcOpFgSnGe7dycXo1fTe2osJ6H8LvciA5qZJ
	 egM+uuvogqZeZv4bGImJmswvFMnj80BJNBSOO16bji310Fo8e+KxRv4kYSkOP49aZ7WLD
	 KQzDcS8h2mRgl4FCDTcP4+VyPYmDnBf8e7xYKLcMhgOiLkSg5OIZtyxlzmOIo0ZyCe/ir
	 sGxR0jC+Ft03TqOXq10ADr0mW5Tmyx1/1YBYW+5rE/z37Q8EBFexSP9VpGbWHQ2VsXw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632011;
	bh=hK3vQGe+xJIBLM56oSwyzxc/dVPC8KZFXRckp1vomzs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=jt3ps+xVjtCcax4Nw8ribwruZis8lRuLayVNYOmQGHcNnRWkXh8EY8LeROHqc/QJl
	 heBPkBlhnp5oSwrmeF7ZwFxY3HkUDSFUDVFYmeySiYuGkwCworo4VH2ZQ980V9uxKa
	 V07r3oNpkLGqtNzgqkyyZ3phttD+PbJn4axEmVea95EmJByLEdqet9+3NTRQdLLOUM
	 o6vfaOrNP66etgiECP0r0ILA6vci/G30Z/IYTjzXEjCMkVsWc9S7c6Vimd3cwLEoYH
	 3TycmqkCuLh8ehXgC3yo6kgECJcuMPi7hKRWxTcLXW8S+0TfzXiQlI9fdopIzphzrm
	 XYB16rVf1rDAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D48B40608;
	Mon,  2 Nov 2026 15:06:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C11D3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07E2240608
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnSXGAX4XKWu for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:06:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA859405E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632008;
 b=HGY036c7oTrUVYxTf/sKAW6BjaIqTANiVaG1giyvEqO8jq65w6gcAavHThZBtI7ObMPY
 Y+KDFFiPoSmfDcdXITHRFOXptRxtEhHf4/WSd3mnKTn0vX3PGwBfvNEgJ0FXQdFEWhjfo
 rLHWEyjjwLphTlnpvX2Mv+LAjt941kfVX/SGm1h1LgHnj7E5XuyRjDCEx7VTlUYrQYBr5
 oilq/G0EeqiWV4uzeKluR/2KBgREMUpeb5Drd2Hmj1s8fzWkgqrZULtw5SqZWVd4QTybn
 7dtNT4DD/Q12I7qGDeEIyv7j9J3i6ZxFLrDGHHBFSsh9AwGdXvFNisApz9lEBiNKVLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632008;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=nj9vvsMT4aZxrgx4hRCnhZLtwRTNp/6fqmbaW/g51mA=;
 b=Ty10drwzKESWnQ/NRgE1RzV7yDb8eG6IS3Y2DeuIQXB2gl8VZ2csFXpNT/IjugePxDdb
 FrbN+K/v2VR6QAVZAukG82tycCZMgT3BkCoThvyuASn5wiiVlmty7JxTminizKJ5Rz0zV
 phjbXD9RD+GiYkzzwhrhHM0kYqAwwq5B4ZNMtl0X5rY7UOdyDZe0OuhFt73FnlpTBx/y1
 1bSUQUPb3m8W0Dh6EinalowXZd8I04Od9k0lubuj+mbPnsQnib69KD1obZTCDX6daxbHp
 eoLkvCvEqQCSjoWtl/CQi7WQVlEM9Gz9EAbHCHNqA3G3A7krhy6nk4hvqlgKuEBPCng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=fTZe+9JS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA859405E8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:06:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c4ceaee6770so16422566b.0
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 07:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793632005; x=1794236805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nj9vvsMT4aZxrgx4hRCnhZLtwRTNp/6fqmbaW/g51mA=;
 b=jNxxG+E1O6mEF4ve6JpIMtDiUKOWsIVSczaF18mNsIStdiktCLOI7BIQEuhlwHrslZ
 DWa/4BkkkNLVTL2tVlvBtl0QqFl31aq0G8KBywj2tEeoo1OiCdw265t7yDL8Wot1KjnA
 c9TM5nHVyNrogcAiZSDlB8XUthx9sJOgg2FOEXhCAUXnRpmkflNslBbbeU3qew6Xejbt
 acG7jIdWto5R1ovx0Yz6wjHgmeR7NYvul7w7slofqqRuB+yaHfiFHcDnlLhHvzANFd2x
 Ht212xkbUdQJpxMNdTOA/k6n7GKPBU5ZUz9aDf3sfm07yy14PaoJs7LggW0s3I2oCjGx
 XkuQ==
X-Gm-Message-State: APuU4Z8PyL+C5k+YKI4It1olAePS88LMD4YbksGQwJV+k7+YfS6GfYCE
 QP6Qn45wBIfG38RXn+DPshaFXtS5nj7nIuOBeSSHy2Q+VdNqNnpoeDeR9fooYw==
X-Gm-Gg: AYBFou1OPrcGJluUwX2pchvEojtx7iO2GFpQb2D8XGC4dO1sP+lZYAvKmGQhw1QfX15
 ObipNxtYT1N9xocClyQhyLTWtTpzMSOJ1lGlZRn4LiFf11PbKj6OR0jc9MCxzlXYlHUB5juLKiL
 hnT2qKHXfKi7wHcT+vsuuPxCUKNWJwtfkgKabnBTXS5E4T83Wbpixcxr5cOEK7qCXBBQMOActdz
 KBRLMe7SkszbXxGznzQ0fVI759+BHznFXfmohMfLaTf2rM6/TGsNLwue1j5ePhr4MsDo/e0p72k
 TdM+FAGbgav+D43R645OBTTX+DQRMhFRX2XQS8b8lDVFzT6nc+EnI+Pvm368P7Ye96g+LXwdeaC
 I3SXtm8JaZ3LmgjU/NHXJr5tCUUnoEqjvt4WA4CtJbUWCCIQyR07oGNv3nF/AjVgjT8veY+P1pW
 wWfD7Pn7g2C66tC0hCCGb+CLNpDFFfbtbouzZQ6AZUZJnQUKeAFPkVIVZ3e+moxbCtNzhLqyTOS
 HS0kPsCZeZnrSibR0hx4QmgeN/vSN0MUKH7xWBTz8EVAygBH+Y6cyEWK2vbYvAj4q0RWbAMxhAu
 wq5zDqdQAvIxIAkJuBmx0ZidN0PCRDauYZD/HaGMbCrBJVnEzYIN4Y0kht6raJr5aGIGXOEIh7x
 BH81ZW5mA
X-Received: by 2002:a17:906:99cd:b0:c46:50c6:f737 with SMTP id
 a640c23a62f3a-c4ca7a8459cmr882328766b.31.1793632004906; 
 Mon, 02 Nov 2026 07:06:44 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cebefcdfasm393366b.36.2026.11.02.07.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 07:06:42 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 16:06:40 +0100
Message-Id: <20261102150640.3120874-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libwebsockets: bump to version 5.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There are no release notes for the 5.x series; the git history is at
https://github.com/warmcat/libwebsockets/compare/v4.5.8...v5.1.0

Version 5.0.0 added mbedtls 4 support, and 5.1.0 brings the mbedtls 4
fixes on top of it, so libwebsockets now builds and works with
mbedtls 4.1.

Drop patch 0001, which was applied upstream in a reworked form as
commit 8a0dbfba1 ("cmake: only use libatomic if it provides the 64-bit
atomics").

HTTP/3 (QUIC) is now enabled by default. With OpenSSL, it forces the
new GnuTLS backend on, and with mbedtls it requires an mbedtls carrying
the libwebsockets QUIC patches, so the configure step fails either way:

  LWS_ROLE_QUIC (HTTP/3) requires mbedtls to be patched with QUIC
  support.

Disable HTTP/3 and QUIC, which version 4.5.8 did not have either.

LWS_PRE, the headroom required before buffers passed to lws_write(),
grew on 64-bit builds, and the soname changed from
libwebsockets.so.21 to libwebsockets.so.23.

The LICENSE file lists two more files that are already MIT licensed
(lib/misc/dht and lib/misc/qrcodegen.c), hence the hash change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ly-link-libatomic-if-it-is-available.patch | 61 -------------------
 package/libwebsockets/libwebsockets.hash      |  4 +-
 package/libwebsockets/libwebsockets.mk        |  6 +-
 3 files changed, 7 insertions(+), 64 deletions(-)
 delete mode 100644 package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch

diff --git a/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch b/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
deleted file mode 100644
index 84724f9c50..0000000000
--- a/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From e0480a47e95a0d74c826926ae6bfef14fc8d988f Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 27 Oct 2026 08:47:29 +0100
-Subject: [PATCH] cmake: openssl: only link libatomic if it is available
-
-Commit 09aade8c9 ("cmake: openssl: Added check for atomic library")
-adds -latomic to CMAKE_REQUIRED_LIBRARIES whenever 64-bit atomics
-don't work out of the box, without checking that libatomic exists.
-
-Some toolchains don't provide libatomic at all, e.g. GCC toolchains
-built without thread support, as libatomic relies on pthreads. On such
-a toolchain for a CPU without native 64-bit atomics (e.g. ARMv5), every
-OpenSSL API probe then fails to link:
-
-  ld: cannot find -latomic: No such file or directory
-
-so lws believes it deals with a pre-1.1 OpenSSL and the build fails:
-
-  include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
-     93 |         HMAC_CTX ctx;
-        |                  ^~~
-
-Only use libatomic if linking against it makes the 64-bit atomics
-test pass.
-
-Assisted-by: Claude:claude-opus-5-5
-Upstream: sent to Andy Green <andy@warmcat.com> on 2026-10-27
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- lib/tls/CMakeLists.txt | 15 +++++++++++----
- 1 file changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
-index d91c3dab6..9060d32fe 100644
---- a/lib/tls/CMakeLists.txt
-+++ b/lib/tls/CMakeLists.txt
-@@ -564,10 +564,17 @@ if (DEFINED LIB_LIST)
- endif()
- if(UNIX AND (CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID MATCHES "Clang"))
-   check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64)
--  if(HAVE_WORKING_ATOMIC_64)
--    set(LWS_ATOMIC_LIB "")
--  else()
--    set(LWS_ATOMIC_LIB atomic)
-+  set(LWS_ATOMIC_LIB "")
-+  if(NOT HAVE_WORKING_ATOMIC_64)
-+    # libatomic is not always available (eg, toolchains without threads),
-+    # only use it if it actually provides the 64-bit atomics
-+    set(CMAKE_REQUIRED_LIBRARIES_SAVE ${CMAKE_REQUIRED_LIBRARIES})
-+    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} atomic)
-+    check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
-+    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES_SAVE})
-+    if(HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
-+      set(LWS_ATOMIC_LIB atomic)
-+    endif()
-   endif()
- endif()
- if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
--- 
-2.34.1
-
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 654d3007e6..fe5c7b06ce 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b6ade658f4af3a823d0dc806ae5ef0623f0f4f5e2aeb895a0f77c4783840c30e  libwebsockets-4.5.8.tar.gz
-sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
+sha256  9acbba00aaa9e6178ae09c6f920d95449b527c1417e81d2cdd4103bc6d64d13f  libwebsockets-5.1.0.tar.gz
+sha256  e98c88a3de53b32c75d8130e29f5f3c4cdd89fb0c002091748e7d2d626dcb914  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 51f3df80f1..513b09ded2 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.5.8
+LIBWEBSOCKETS_VERSION = 5.1.0
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
+# HTTP/3 (QUIC) is enabled by default, but needs GnuTLS when OpenSSL
+# is used, and an mbedtls with the libwebsockets QUIC patches.
 LIBWEBSOCKETS_CONF_OPTS = \
 	-DDISABLE_WERROR=ON \
+	-DLWS_WITH_HTTP3=OFF \
+	-DLWS_ROLE_QUIC=OFF \
 	-DLWS_WITHOUT_TESTAPPS=ON \
 	-DLWS_IPV6=ON \
 	-DLWS_UNIX_SOCK=ON \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
