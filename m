Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812ED606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qc8gIo/C
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED9A80AFE;
	Tue, 27 Oct 2026 16:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSucUFVuJzAp; Tue, 27 Oct 2026 16:09:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 46B1F80BD2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117343;
	b=X4Z1PclCQODNLkrv2brMPo+9WSwkJWC7P8b7xX0YQiQ/mI4kh0IQiU1HFk7qAY4a4sLb
	 K39fLo9nW+MzJfdo1CWx9o/FG3thjcIfbic09LSjGjexfNi3M5ukMVvTJ7V6buJ0yvmVs
	 KmAizHuf1R1PWhviMSB8nUCDrnTQ7YlG0QKKIB/AdH43m6QXMxLVnJ7HUSu8X54lBoY6/
	 talSVtJduFjw2mEiLob04t2gX6GZ782cgmAcyf7/HrMHbdRK6IzGzkwObilhz+X2+XKd2
	 mId1iuZfeibn1x98gdBx63KoB7q/6Z/Xu+RmA3wYBKYo6iogmfTrwR/ZNaZdoT3YsZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117343;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jd3qM8SmcWQ8rKWQ1BVpH6k/n/f+RA5yxi0siCKTCsk=;
	b=F9AXXQwEDJIA3fAqcC3mqa7p67ILZfa3jiLZ1xJCJJfi3XzIIT1Rpzssxsm+EVC38LMC
	 MhnucmF9CbfRAg+K5vB21K7CdUgTXzPrmV7gvcIFkbRQtGZ6bKfJFy8cErZQouvtJxj1f
	 yONRKbVKvJA7EZKiexA2pCD2MalhiV/aOwZabDD13in6PgergEUuenlFOFZzmej3IyTJM
	 o/5GRMavWTKRjkbdLznpW8Y6JKnyL0nHrg5UfnQPBgNbtq9kt5tTJ1nLnyYErTTi0EQ2a
	 jtFpd4SfFkxa7J4Q+U5RJG61QrJ4/vP9/N9G8yojZSFWMZpLFRnpcc9tz2F0OR2/3HQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117343;
	bh=jd3qM8SmcWQ8rKWQ1BVpH6k/n/f+RA5yxi0siCKTCsk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qc8gIo/CmL/xJYfuSaDdawzT5QAfedcj2hWjLCqGJCzmGPqW9GYqyyFaBj9hoXJhr
	 nL/917lQQrHGdCx5L6JTi+zqJX5ktP7IFc/Q5u4u45ZQMGmDXXTD1PWeTbfxa9+Y4q
	 aSE+rIT2r5Gp6A7ObXlpbg4hoTBtDVZsF6b5oZBZPjvrTlDl33xYv6gSBlTMcl6GdV
	 NMpJYIz7iMKpQMM3ir0tMv1v2+jJrgssB7y/Mbi6ZCkB7+AKN7Iuq+55knQ+76eKId
	 yq8dQ1T97pQonyFPaCY2fF4d88eG4gAniY4VTlUatOHN4ZgHCjCU5aJA+XUtfudG/9
	 bLhHt2c0cc+wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46B1F80BD2;
	Tue, 27 Oct 2026 16:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C0082F5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECCE880BD2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnwBpco72tTx for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:08:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B73680BCD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117339;
 b=ZFrrribf8XRhnui+q8gSR0TcUbnMX+nv/mhvNfX7PDrgq2UQ/f4uUwk9r/papuxEoFQ4
 tqApzjD2tys4TUdmSqnkRbjyzLZowmDMwu3AN0CDkb6c/2tRxr0/nNMa5Mf81E4oXwva6
 2MSJ0t2uPCnhRyia2KvuKG2SMzLxbDwuhiqFd9CGpBHXlLzPcPTaH9RZbckc7vVOuBVeS
 ukRRYshUrKCrMweWI02iQ9U9CKhGDcbaWr4J2mhbfsWw/ZVpDEFi+oURoNBgavrUCkPev
 DD7bc/KvXg7/9/QstfavXdwTHSanpqa+ldCtXO9NLvYrqVsCtk6loX4J8Bop5P7wivA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117339;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Y28sC1jNo8Bsbvni++CJWnpOsjI2uQK9F0mfuAtVEck=;
 b=esmyXMkhakmbVDHrvATxQftG5YODQY6m8yBR6s9/eOGx1AkE7pSwx3kADVkxRMv74uZ5
 P6tCe+nngIi4pRgpE7J7TPKeOEWiVYo4KisBJ4PSGRecucJgJ6dmb6Ym2CK9yGKHGLfwn
 luAWo7IhvPC5ynYd9X5pgdiq3sZIqJzPbc2UqVEL06NmqvhjBrv0u6TPtVJ94LCYklSPg
 keA5df/He/Be0dRX9mnH5Qg/2lYjvGnnpc5v/f+q+6lkuwyK9PZm2Fg8YClX/t8u8CXhH
 qBjlIKIKmrMaEcXt2CmZQBEc9GC1qhFRtq2cGsZKMz28Ph8aPIqfVg3H8HJdQCSCrgA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B73680BCD
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:08:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A26439D0BC; Tue, 27 Oct 2026 16:07:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:08:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 750d353e3bb295b051ad50dfbd62a7cdff4a6857
X-Git-Newrev: f39c490c44cae0496c3ea4732d26af66f384fdc2
X-Patchwork-Hint: ignore
Message-Id: <20261027160732.A26439D0BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: fix OpenSSL
 detection without libatomic
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f39c490c44cae0496c3ea4732d26af66f384fdc2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
