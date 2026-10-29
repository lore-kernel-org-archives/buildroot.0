Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD82606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H/Gf9y+S
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DC78169B;
	Fri, 30 Oct 2026 14:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVoz6HPdhamE; Fri, 30 Oct 2026 14:19:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2FDC8816D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369996;
	b=qklSMP84UAf/UtRpv/tFscL/DcQ7svc7LJy4dPs7lhb7xIi7zDNE5zC625OuylZhp47N
	 PM8p/8tF5Rtxiw15/Jhdc71U3TOYSGfTw9cN4V/L5H/qsEChow8suNriih8iAljJm3zpy
	 tzWgLSY/p+5NN5AYrEiBPU6FIuiJ7l6hPvuQmmDNiH2z0YArrm/ZLkRChsf5tCy5nRc0x
	 swAxQIogpI/cSLdYwCEwFvg4YNV4f8wE1jQ9mrQRvDYq1fLQj17vFWuSPOEugweGMX4f4
	 IxCbiBoQq9zWKyFMnndYxUpp9mC0McOKfpuiFE7be+Iydg4sK9jwFvLz0LBUn/6qmDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ocvVFgP+aC5Kgh9VDPdcba7VSxHHT8moTw4nVwCn3Bs=;
	b=DdGr5Hgg+m0St7/cOX8Yr+exj+/nbTV6UH08nM5ySCJpGpUj+ePiX/00PHLhu4oyaMkm
	 rSJ4TdB5f0RaObOx+AjjYL2Ej4B/DAiaAULE59cZo6F7Bkn27jC+D9APW3GbIfB/h5CZo
	 GUbSvkyz9V8BfJSg9Q1W+FNe9uYSy74RlYtFN6cMVUYb4htFtQzQH24sQ2x99bcrsVHSf
	 DMFFQ5sw9GJpvATsP0aQLoPYOdqedMriKFFBQF/TRuseNJxOjBZNMrpIOClz1aLhBPREz
	 Wg/wuz9/xA/jb5J6VFLr2oeJ4QDGAtu+F+YBPvor9hwDN4tHWQwyV9+5GUh7fisoKNQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369996;
	bh=ocvVFgP+aC5Kgh9VDPdcba7VSxHHT8moTw4nVwCn3Bs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H/Gf9y+SuaGIKhw6uIaotxysXhsBz63xZaM8pF3ZwJ0CrlVvIW23U0ffViarf209d
	 e072HGYGuilKKyKOLBH712xXREE30S/9n1raDKLRiusoCtnAy5Yqjn3Jc7iSS0RXO1
	 NGOzXBOGkZOXKYS2kgiD8ddo3FwP9bIpV4BvtJNLKLCDKhm6gUEULV3AzUUHyzyC85
	 GQRBBKKMrNTVy0T+tZ9cP/Ed+6tMVKKPlWg7gkUuAUYhb4Wz1U71Ay67d/3hb6cExk
	 Aw5Txw9sn3NY2wvkD14FI8fM/ZzbJ1FSg4+gnizXHetVi21iS64Lf8ihFwppCWiBeG
	 C8lxVgsJj4uDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FDC8816D4;
	Fri, 30 Oct 2026 14:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11DE1362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03D44400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTbiEORTqUTB for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 23FC740530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=Ye+MGVXWBGmImPzApU+JvuE27pKNRSm0afB+AI3mXUhroRt4rBa/h6EGJJ22u6z3CDT0
 KLnD8MWgNjlxTUYDp3Hp79bEfPtiCfhoH8pKHm7k/xBz16T2CcLI2zZuCvwTF4UbX/NEC
 p+PRJnNI/yGd34bpi5pK4EU/QM9kYCqg9xFuhQWMYn5RTVxyZxlgLBBbdrn+aU3++EZ7p
 xm9E3msUdrCRXb0tN6tr4OAyvV0EYpEP/1Hi9TLnv66eCpMpc6FwLwbRC0cgmZYEfcXM4
 I3lA1ludhRGVxBeMLCicQcU1A4DeBZhWWeMGyQeGfY8z3O0jnN8hqCnx9u6eKidxD/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dvGg3FNRb5AVM8A2rLVhDHNNSzOwW8QXzs2+N+USFr4=;
 b=OMHG+nEhS3wlwO/lcJK50p58y2rv1pOe9RRhLA9cogBRxDNZTHqih/I7mP3EU9Npxca0
 raNEJ5XMkDiuHem5cWmwjBNGPGfWC5bXNn9hsONnKUFQUCEjTLsRlUejAvVw8RYDAoMK2
 7VYHLEpUF4Y9rEP+41+ho5mk/rLmtkSBVL/wvd7MsKflKaoLbPszRy91Q2jaHthFhiLra
 8bZrlO+ZVaDWeqKwVzrQd6hf4rwp4Xg85HMecbv70KIebjK0StgGqIBTrkhn4MEcoyLvL
 sNEcDjzFl0t/hFF0f047DTaKosul98SOxUK/8aYHW4J8r1ME6PeBmRgl5HB1iesfvDQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23FC740530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42AB99D389; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b7e08d6de2511b2913b04c9d6f6ca6547bdc9dfa
X-Git-Newrev: 193d45d26627be3597e25096a4525aefb010dbea
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.42AB99D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libnss: bump
 version to 3.129
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
Content-Type: multipart/mixed; boundary="===============9078698309563926095=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9078698309563926095==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/193d45d26627be3597e25096a4525aefb010dbea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Drop local patch that has been upstreamed.

For release notes since 3.127, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_128_RTM/doc/src/releases/nss_3_128.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_129_RTM/doc/src/releases/nss_3_129.md

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add link to 3.128 release notes in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dc1f1818d9e603b67164c20ae8dfe423e14abc4f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-Fix-build-failure-due-to-missing-gcm-stu.patch | 116 ---------------------
 package/libnss/libnss.hash                         |   4 +-
 package/libnss/libnss.mk                           |   2 +-
 3 files changed, 3 insertions(+), 119 deletions(-)

diff --git a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
deleted file mode 100644
index f2c48c8fee..0000000000
--- a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 897ebeb9c38d4dc4844f5f414db5aaa17c261eee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 30 Mar 2026 17:06:14 +0200
-Subject: [PATCH] Bug 2027768 - Fix build failure due to missing gcm stubs if
- on big endian
-
-Building gcm on Big Endian architectures lead to linking failure due to
-missing gcm stubs. This is because those stubs are guarded by
-DHAVE_PLATFORM_GHASH that at the moment is defined for every architecture
-that provides acceleration. But at the moment we can also build without
-acceleration but DHAVE_PLATFORM_GHASH is defined in any case.
-So let's add to coreconf/Linux.mk a runtime test to find out which
-endianness toolchain is by setting the new introduced LITTLE_ENDIAN
-variable. And later on, in lib/freebl/Makefile let's guard
-DHAVE_PLATFORM_GHASH definition depending on LITTLE_ENDIAN VARIABLE.
-
-Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=2027768
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: rebased to version 3.127]
----
- nss/coreconf/Linux.mk   |  8 ++++++++
- nss/lib/freebl/Makefile | 28 ++++++++++++++++++++++------
- 2 files changed, 30 insertions(+), 6 deletions(-)
-
-diff --git a/coreconf/Linux.mk b/coreconf/Linux.mk
-index dcb432415f..cf1f62378d 100644
---- a/nss/coreconf/Linux.mk
-+++ b/nss/coreconf/Linux.mk
-@@ -188,6 +188,14 @@ endif
- endif
- endif
- 
-+# Test toolchain for endianness and set LITTLE_ENDIAN variable accordingly
-+ENDIANNESS := $(shell echo | $(CC) -dM -E - | grep __BYTE_ORDER__)
-+ifeq ($(findstring __ORDER_LITTLE_ENDIAN__,$(ENDIANNESS)),__ORDER_LITTLE_ENDIAN__)
-+    LITTLE_ENDIAN := 1
-+else
-+    LITTLE_ENDIAN := 0
-+endif
-+
- USE_SYSTEM_ZLIB = 1
- ZLIB_LIBS = -lz
- 
-diff --git a/lib/freebl/Makefile b/lib/freebl/Makefile
-index 0ab50b093a..21c3cf62d8 100644
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -112,7 +112,10 @@ endif
- # NSS_X64 means the target is a 64-bits 64 CPU architecture
- # NSS_X86_OR_X64 means the target is either x86 or x64
- ifeq (,$(filter-out i386 x386 x86 x86_64,$(CPU_ARCH)))
--        DEFINES += -DNSS_X86_OR_X64 -DHAVE_PLATFORM_GHASH
-+        DEFINES += -DNSS_X86_OR_X64
-+        ifeq ($(LITTLE_ENDIAN),1)
-+            DEFINES += -DHAVE_PLATFORM_GHASH
-+        endif
-         EXTRA_SRCS += ghash-x86.c aes-x86.c
- $(OBJDIR)/ghash-x86.o: CFLAGS += -mpclmul -maes
- $(OBJDIR)/aes-x86.o: CFLAGS += -mpclmul -maes
-@@ -138,7 +141,10 @@ endif
- endif
- ifeq ($(CPU_ARCH),aarch64)
-     ifdef CC_IS_CLANG
--        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+        ifeq ($(LITTLE_ENDIAN),1)
-+            DEFINES += -DHAVE_PLATFORM_GHASH
-+        endif
-         EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-     else ifeq (1,$(CC_IS_GCC))
-         # GCC versions older than 4.9 don't support ARM AES. The check
-@@ -146,11 +152,17 @@ ifeq ($(CPU_ARCH),aarch64)
-         # and then rejects any major versions prior to 5. Note that
-         # there has been no GCC 4.10, as it was renamed to GCC 5.
-         ifneq (,$(filter 4.9,$(word 1,$(GCC_VERSION)).$(word 2,$(GCC_VERSION))))
--            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+            ifeq ($(LITTLE_ENDIAN),1)
-+                DEFINES += -DHAVE_PLATFORM_GHASH
-+            endif
-             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-         endif
-         ifeq (,$(filter 0 1 2 3 4,$(word 1,$(GCC_VERSION))))
--            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+            ifeq ($(LITTLE_ENDIAN),1)
-+                DEFINES += -DHAVE_PLATFORM_GHASH
-+            endif
-             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-         endif
-     endif
-@@ -183,7 +195,9 @@ ifeq ($(CPU_ARCH),aarch64)
- endif
- ifeq ($(CPU_ARCH),arm)
- ifndef NSS_DISABLE_ARM32_NEON
--    DEFINES += -DHAVE_PLATFORM_GHASH
-+    ifeq ($(LITTLE_ENDIAN),1)
-+        DEFINES += -DHAVE_PLATFORM_GHASH
-+    endif
-     EXTRA_SRCS += ghash-arm32-neon.c
- endif
-     ifdef CC_IS_CLANG
-@@ -316,7 +330,9 @@ ifeq ($(CPU_ARCH),arm)
-     MPI_SRCS += mpi_arm.c
- endif
- ifeq ($(CPU_ARCH),ppc)
--    DEFINES += -DHAVE_PLATFORM_GHASH
-+    ifeq ($(LITTLE_ENDIAN),1)
-+        DEFINES += -DHAVE_PLATFORM_GHASH
-+    endif
-     EXTRA_SRCS += ghash-ppc.c
- ifdef USE_64
-     DEFINES += -DNSS_NO_INIT_SUPPORT
--- 
-2.47.3
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index b87c3376b4..1851b1e5fd 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_127_RTM/src/SHA256SUMS
-sha256  5a899cad21ae2c9d3c5132de79726eda8df3b7fdf18eeb239fc544d43b87338b  nss-3.127.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_129_RTM/src/SHA256SUMS
+sha256  38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785  nss-3.129.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 734376f61b..42021503f7 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.127
+LIBNSS_VERSION = 3.129
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============9078698309563926095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9078698309563926095==--
