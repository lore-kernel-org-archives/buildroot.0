Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C138A606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xkzo5NT0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E13E608EB;
	Fri,  6 Nov 2026 16:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nq0WqPfYhNkl; Fri,  6 Nov 2026 16:08:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9557D608DA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981312;
	b=knltOZgRKgCc2e0+trw0haaDcxbY1uQOZnHpPCimuH/Okx3in5CaCbUJs5G62TN7s0OP
	 y6XXScF4hcbZd3e2MZZzPUyKryCq+AUvMSozrUxV4qcLeGkmyflmusq2cKv8Mvzg8SiUf
	 Grsjg0kggXJyBp3cngZQ2r5YDLiQ7pcA6nfcnN4gqh4XKuWFWFMDaDlHfQ/dsBDIq1EkL
	 tyxPTZJz4YZnbWhAfYPwtHtl0PZPgdi5W4AivtKkqtXZIJn/8LZgKzsLILeKXbjAYa5Zz
	 C6EHPMGRdz6JYe6Pr8LeeUfJH3vEG2fg9oswPsIlGu9tBJCJoqp9O7A6MBywFaXVIdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981312;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Cj2pki77YDkiPz/14kBItE4qOa5RgipdHbvg7w4t/FU=;
	b=UMPdeJa/JCxfMBhSakVSgy7yzCgUcjl6VwpypwQiLkvY53IH7hk3EIbtAPWGlP7Mnv+s
	 U0ZM4FXK3FeknEX2xmMDzvRHZGrUrm9JMpBIIoHw1SklU0ptEfXXWEXnpDwc6I0PTWeKL
	 vVlBrDnhn6bB9eKTC76stvhhwu17E6XHjHfxQ1DnrHbYo/WZC1q0//LZ3MYJUkntYywri
	 jGUa+Vhq+zMBQBw6tcPH6BmCDiSsuI7XCD/YoQUj/t1IjqYmYK8Q5sUnaChLB/bhTvQ6r
	 H9RqbU4Vr3DdccPU81XjIygfWlRkIXkgg/ybxFM3LZlBxaA6v3sbTGX9XORUMHrVY1g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981312;
	bh=Cj2pki77YDkiPz/14kBItE4qOa5RgipdHbvg7w4t/FU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xkzo5NT0+Qr16yQ+DXbGNtkdURoRCE5PEwVWkDVm9quIv01iBdlxwu8BjhVw7Z8wj
	 Sgf2I585zYR1A+XDsmyCJF386A67xGEgh5HcMzVlwBMzFX8WVOabj+SdDWwKcQZMb8
	 oVROzMl2JCFYZQanvaVv7X8yf5oZ3OUokzNgelbzmHlierZnIuauJwh7xkhymBN/J1
	 ZB42guMtqwY/MCY8E5I45kpkv+dE/cxz864jwDIK5IMSNOt1TnwIVxDYS/hXT7FC6b
	 uTbsygMEKlqg1IsMYS56wD5rRWkeYwS2zoF16rW13zSkvr9tXpp4Rp6a3A58woxjN2
	 Ydu8e9sSYhZ2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9557D608DA;
	Fri,  6 Nov 2026 16:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5854B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C418E6061F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giTi83UXAAuo for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E4F22605A7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4F22605A7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27CD79E0B1; Fri,  6 Nov 2026 16:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 93f36d8d94136a24faebc0cb98c1d0d030817a12
X-Git-Newrev: 46bb9d19dcf1112b89a32f967d52b40d38550576
X-Patchwork-Hint: ignore
Message-Id: <20261106160645.27CD79E0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libwebsockets:
 fix OpenSSL detection without libatomic
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2839873496658737865=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2839873496658737865==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46bb9d19dcf1112b89a32f967d52b40d38550576
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since version 4.5.3, libwebsockets adds -latomic to the libraries used
by its OpenSSL API probes whenever 64-bit atomics don't work out of the
box, without checking that libatomic is available. Buildroot toolchains
without thread support don't provide libatomic, so on a CPU without
native 64-bit atomics (e.g. ARMv5) all probes fail to link:

  ld: cannot find -latomic: No such file or directory

libwebsockets then assumes a pre-1.1 OpenSSL and fails to build:

-- Performing Test HAVE_WORKING_ATOMIC_64 - Failed
[...]
-- Looking for HMAC_CTX_new - not found
[...]
include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
   93 |         HMAC_CTX ctx;
      |                  ^~~

Add a patch, sent upstream, to only use libatomic if linking against it
makes the 64-bit atomics test pass.

This issue has been present since commit 20c3eb6eb684
("package/libwebsockets: bump version to 4.5.7"), which bumped
libwebsockets from 4.4.1 to 4.5.7, the atomic check having been added
in 4.5.3. It therefore affects 2026.05 and later.

Fixes:
https://autobuild.buildroot.org/results/863c30265623973e15a25c2d38c0e1631a39b7e8

Fixes: 20c3eb6eb68432c37d5db69963be266b7f2d23f7 ("package/libwebsockets: bump version to 4.5.7")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f39c490c44cae0496c3ea4732d26af66f384fdc2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...sl-only-link-libatomic-if-it-is-available.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch b/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
new file mode 100644
index 0000000000..84724f9c50
--- /dev/null
+++ b/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
@@ -0,0 +1,61 @@
+From e0480a47e95a0d74c826926ae6bfef14fc8d988f Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 27 Oct 2026 08:47:29 +0100
+Subject: [PATCH] cmake: openssl: only link libatomic if it is available
+
+Commit 09aade8c9 ("cmake: openssl: Added check for atomic library")
+adds -latomic to CMAKE_REQUIRED_LIBRARIES whenever 64-bit atomics
+don't work out of the box, without checking that libatomic exists.
+
+Some toolchains don't provide libatomic at all, e.g. GCC toolchains
+built without thread support, as libatomic relies on pthreads. On such
+a toolchain for a CPU without native 64-bit atomics (e.g. ARMv5), every
+OpenSSL API probe then fails to link:
+
+  ld: cannot find -latomic: No such file or directory
+
+so lws believes it deals with a pre-1.1 OpenSSL and the build fails:
+
+  include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
+     93 |         HMAC_CTX ctx;
+        |                  ^~~
+
+Only use libatomic if linking against it makes the 64-bit atomics
+test pass.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: sent to Andy Green <andy@warmcat.com> on 2026-10-27
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ lib/tls/CMakeLists.txt | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
+index d91c3dab6..9060d32fe 100644
+--- a/lib/tls/CMakeLists.txt
++++ b/lib/tls/CMakeLists.txt
+@@ -564,10 +564,17 @@ if (DEFINED LIB_LIST)
+ endif()
+ if(UNIX AND (CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID MATCHES "Clang"))
+   check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64)
+-  if(HAVE_WORKING_ATOMIC_64)
+-    set(LWS_ATOMIC_LIB "")
+-  else()
+-    set(LWS_ATOMIC_LIB atomic)
++  set(LWS_ATOMIC_LIB "")
++  if(NOT HAVE_WORKING_ATOMIC_64)
++    # libatomic is not always available (eg, toolchains without threads),
++    # only use it if it actually provides the 64-bit atomics
++    set(CMAKE_REQUIRED_LIBRARIES_SAVE ${CMAKE_REQUIRED_LIBRARIES})
++    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} atomic)
++    check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
++    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES_SAVE})
++    if(HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
++      set(LWS_ATOMIC_LIB atomic)
++    endif()
+   endif()
+ endif()
+ if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
+-- 
+2.34.1
+

--===============2839873496658737865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2839873496658737865==--
