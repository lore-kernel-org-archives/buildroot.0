Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SCOBKKwK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23C3E60ABC;
	Fri, 30 Oct 2026 14:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fh9S0p4VFf_H; Fri, 30 Oct 2026 14:07:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0EF5560B23
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369278;
	b=n5My/Csgt2TZOi3rrGNOiAxMySL3/POjS7i0T/ZGxerMf9ZUuMABA/dISon40zPh9Uc/
	 fW+Z8Q5Q1rZQKBs5rd0s/xMkmG4+nqcGcXdLQkqHTHKQrJ087C9eirfJdiTCAVYbad3KV
	 q7IjSjvoniCKncas87Hnct7apnnF3wDuQKrAY4DaaLPUMF/ZDPQTmYa6qCt3jjM6GqZ+t
	 ZfupbsFWKw1xedLdhqJNOvdxIxA/YXCIbqf5o7JbbHecDEs8oRK8B1mQzBJ8s5RELEOmB
	 A2Jr8INncdVlWX5O5pYD8Z7gvb87tb+7ZG/Z09EQHuG4rbNqeIdq5NsUoe5kcGAStOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jDGYD7C3AjE1Pwiz8U1W+lml5ipmpniJR3Iw6GqLYvI=;
	b=MYtIqC1Axjg0HWEYa4MMYKS7Qc2UV6N/r6lCMdrxO79oh4J/aqZQ+lZeu5sf4AL3ZS1V
	 s7HBDHkY05fKBb5PxyXl2dkSpMjo0G3yiS/0Xk+LT0IxKSUefDTMzlAOB0G6cf7Ta5WnL
	 VUhs1J4g1czw+4c75MLajRdZO62vMroHJ24vmo2y2B4J4n+8Brm+YIt1pTLtozsCPRw0j
	 /WZ+VPtZF2g6soBgcbF3J0DtlTV9MmWQAylvzcolAzZb+Kw9PQzr+pZ52/s05f1amgTSX
	 xQjFKnODwZ15CysNbeK5aqj2rA0c7avDeEom0SumPb76Cj0+bKMg4o0QM0o2cDiJ9bg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369278;
	bh=jDGYD7C3AjE1Pwiz8U1W+lml5ipmpniJR3Iw6GqLYvI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SCOBKKwKJ3B2z8eW37JtoO9nOpz9C6XVDucd3H98B9QtIinUubM3KJ/uqjMZI6Mjy
	 bAq1Q2gLRmHQjDW1OY+uSlRdC5fTBWMM5/HdC0gM4KoYrObvuP4LFKlX86d80vU6C4
	 jIY6lO9wfxu5C2sowu7jX9SUrZtmL6SWvN6Q/BjZmKxxMJsWaN7l4MfZnZxpSzEu9k
	 rcMFFFMpcEr4P88twH1++hvTImbzltdoXs79J8B+hxGroTTJfRj11NaN8ziEYONyou
	 WZfwUaqPrcbC+SkyXPDQtJsWFx6byFgQ6w5oRvafQrv9+v1PHLWdfizmtMQpYzBF3S
	 KEC00fv6QrKlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EF5560B23;
	Fri, 30 Oct 2026 14:07:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A211D47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12BE18116F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGZVMe-SqlWD for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E41358119C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=psPaCjwZMYTdwips1vy9GpACH4NVflevsL+uHpfHA9DCGBQLhngFKcelq4c5KdfrtVo5
 nz57Amwil47A1ylXKIxlQ37uYVVjzKps4nO84nlc8M1ci0DtBqJDcLwLRc9en4OIUyH9O
 eojpNULb6/DSY53ALn0quecfb5cP/Q0TBbLx+od3rbBjgq9PGL1Br/rTSBrl3hL4HdsMs
 Cs2gFerjY0SREmm5A36/zOPY49VPYiJeBNEGBRj5eY6rXhtXJk1+HMzIBhyYNL4RbFOx2
 9MsfEK13zxnEzHayluP98p/t1iuFe8yP0mCgHvYRWcrlqs1vUevWnjUUAeWiCrtyt6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9r+lu+IHy42wf0L7mUA27mB8PQjXqvp1UlHW5Xm9IKk=;
 b=d9iYU9TW8tNFvrjtrlB2EwPxMu+n8r16JLsi1o9gNz5KNS2+2pYKFTQqd+YZqX8//Eu4
 E16JQhmpw3IUgTXBDJqLdoFRlnAnB8D5k4O6Rk014w+kgpCyEfDNUu5JLhbcEN+pO1f5k
 eeK/j9iV5gCfUF1MUbpr0aokBsyQSmGxg4bEhEJ9xDSA6B33cS9VBR0kRKLbljbDmKz/f
 e8AmNNOyuqOuxjFFUszgk5LgNGqeaHQKGPLxU1jA4g1CXzWOwJw+BuU9S3ME2kwbcr0b7
 +RLnuqUODR8LKaH1tzL0dclTj6MlV+iJ8/2HS6M0Oo0hi/DBk6/02xSL4gg93O5dMXQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E41358119C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FC139D389; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 30ce2661c530f5834a646dbb30e6f5bc7b595436
X-Git-Newrev: 2b27a0c217aa15a112ddccd2c9329ee8550fd199
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.0FC139D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: fix build
 failure on big endian architectures
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
Content-Type: multipart/mixed; boundary="===============1579321141973321814=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1579321141973321814==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b27a0c217aa15a112ddccd2c9329ee8550fd199
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add local patch pending upstream to fix build failure due to missing gcm
stubs.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit d0f43c052ca0cbeaa3f68710dcd794c2e93bc5e6)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-Fix-build-failure-due-to-missing-gcm-stu.patch | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
new file mode 100644
index 0000000000..1ddfc61576
--- /dev/null
+++ b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
@@ -0,0 +1,114 @@
+From 974469740e6fa9b7ad15f6d9b3945370dc11fa1e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 30 Mar 2026 17:06:14 +0200
+Subject: [PATCH] Bug 2027768 - Fix build failure due to missing gcm stubs if
+ on big endian
+
+Building gcm on Big Endian architectures lead to linking failure due to
+missing gcm stubs. This is because those stubs are guarded by
+DHAVE_PLATFORM_GHASH that at the moment is defined for every architecture
+that provides acceleration. But at the moment we can also build without
+acceleration but DHAVE_PLATFORM_GHASH is defined in any case.
+So let's add to coreconf/Linux.mk a runtime test to find out which
+endianness toolchain is by setting the new introduced LITTLE_ENDIAN
+variable. And later on, in lib/freebl/Makefile let's guard
+DHAVE_PLATFORM_GHASH definition depending on LITTLE_ENDIAN VARIABLE.
+
+Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=2027768
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/coreconf/Linux.mk   |  8 ++++++++
+ nss/lib/freebl/Makefile | 28 ++++++++++++++++++++++------
+ 2 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/coreconf/Linux.mk b/coreconf/Linux.mk
+index dcb432415f..cf1f62378d 100644
+--- a/nss/coreconf/Linux.mk
++++ b/nss/coreconf/Linux.mk
+@@ -188,6 +188,14 @@ endif
+ endif
+ endif
+ 
++# Test toolchain for endianness and set LITTLE_ENDIAN variable accordingly
++ENDIANNESS := $(shell echo | $(CC) -dM -E - | grep __BYTE_ORDER__)
++ifeq ($(findstring __ORDER_LITTLE_ENDIAN__,$(ENDIANNESS)),__ORDER_LITTLE_ENDIAN__)
++    LITTLE_ENDIAN := 1
++else
++    LITTLE_ENDIAN := 0
++endif
++
+ USE_SYSTEM_ZLIB = 1
+ ZLIB_LIBS = -lz
+ 
+diff --git a/lib/freebl/Makefile b/lib/freebl/Makefile
+index 4ee9d61f50..39ef28ec8c 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -112,7 +112,10 @@ endif
+ # NSS_X64 means the target is a 64-bits 64 CPU architecture
+ # NSS_X86_OR_X64 means the target is either x86 or x64
+ ifeq (,$(filter-out i386 x386 x86 x86_64,$(CPU_ARCH)))
+-        DEFINES += -DNSS_X86_OR_X64 -DHAVE_PLATFORM_GHASH
++        DEFINES += -DNSS_X86_OR_X64
++        ifeq ($(LITTLE_ENDIAN),1)
++            DEFINES += -DHAVE_PLATFORM_GHASH
++        endif
+         EXTRA_SRCS += ghash-x86.c aes-x86.c
+ $(OBJDIR)/ghash-x86.o: CFLAGS += -mpclmul -maes
+ $(OBJDIR)/aes-x86.o: CFLAGS += -mpclmul -maes
+@@ -138,7 +141,10 @@ endif
+ endif
+ ifeq ($(CPU_ARCH),aarch64)
+     ifdef CC_IS_CLANG
+-        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
++        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
++        ifeq ($(LITTLE_ENDIAN),1)
++            DEFINES += -DHAVE_PLATFORM_GHASH
++        endif
+         EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
+     else ifeq (1,$(CC_IS_GCC))
+         # GCC versions older than 4.9 don't support ARM AES. The check
+@@ -146,18 +152,26 @@ ifeq ($(CPU_ARCH),aarch64)
+         # and then rejects any major versions prior to 5. Note that
+         # there has been no GCC 4.10, as it was renamed to GCC 5.
+         ifneq (,$(filter 4.9,$(word 1,$(GCC_VERSION)).$(word 2,$(GCC_VERSION))))
+-            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
++            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
++            ifeq ($(LITTLE_ENDIAN),1)
++                DEFINES += -DHAVE_PLATFORM_GHASH
++            endif
+             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
+         endif
+         ifeq (,$(filter 0 1 2 3 4,$(word 1,$(GCC_VERSION))))
+-            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
++            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
++            ifeq ($(LITTLE_ENDIAN),1)
++                DEFINES += -DHAVE_PLATFORM_GHASH
++            endif
+             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
+         endif
+     endif
+ endif
+ ifeq ($(CPU_ARCH),arm)
+ ifndef NSS_DISABLE_ARM32_NEON
+-    DEFINES += -DHAVE_PLATFORM_GHASH
++    ifeq ($(LITTLE_ENDIAN),1)
++        DEFINES += -DHAVE_PLATFORM_GHASH
++    endif
+     EXTRA_SRCS += ghash-arm32-neon.c
+ endif
+     ifdef CC_IS_CLANG
+@@ -290,7 +304,9 @@ ifeq ($(CPU_ARCH),arm)
+     MPI_SRCS += mpi_arm.c
+ endif
+ ifeq ($(CPU_ARCH),ppc)
+-    DEFINES += -DHAVE_PLATFORM_GHASH
++    ifeq ($(LITTLE_ENDIAN),1)
++        DEFINES += -DHAVE_PLATFORM_GHASH
++    endif
+     EXTRA_SRCS += ghash-ppc.c
+ ifdef USE_64
+     DEFINES += -DNSS_NO_INIT_SUPPORT
+-- 
+2.47.3
+

--===============1579321141973321814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1579321141973321814==--
