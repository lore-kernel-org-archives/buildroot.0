Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB47606A323
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BIpWTPjn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA8260DB2;
	Fri, 30 Oct 2026 14:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI6yprdxg7NI; Fri, 30 Oct 2026 14:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7C10F60DA6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370028;
	b=rQFHThuJKQfJ3ViiDiTJV1abtmd9/bkLlqVnmZ0Ag3nMsOlIjyHGPBcnq5rdAeu/Dfjy
	 5iAwZ+I7ROt07VflKkjgw/VTAmXDuId1p+6Co2/eMBZtLPBgxmIP/qKGrh05e6K+INeHz
	 WbbQvpvJXeY+Tt38+l/iRp+A53OT8LNi/0vWFyJCHtIkD18NA/EhopKv2BBohNGmhknHJ
	 ea8MooVs36bw/K7GzIkofAwFLT2LkxzYLaSEpSkNPnz3LxXma4tscq2llmGGvt1KLDgZC
	 d0idr3sfzRMzOoLenHiZZQiqSrKwKRJbujTwIm9Z0hXM+W5Bbn6t/z2Ihkgs2xifWrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370028;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=OZblifgPlfN6rD2vLJSUzv5UT+zQ54TMyOkMruclkrs=;
	b=QeOY2NJPGd78N0BDZWeDfJ0FNxqXYEtCUP84GChqmR5b4qT1iuh5xz/uHrtwh/e3B0ej
	 siNaOOz93gt6OpHY/B8oMscFQmSt1eoIlqIxB9NakHM2SF/+tN/RP6DLtwEEwKzibF2Iw
	 aPmSdolUWDtBNMISNB32Smbs/w31CO/TInMm1hFVnGWDlbnHfzjZWepPrtpBArPlAuhUJ
	 5Nm4ngAi2pSav7h8PxfE6zVTQ9TyBHUpUDx/LiDD/d+2DDpT1E1v8X8rDukatkC4a/+I5
	 cJd/apq4yBHeVEDgKhuJRRxLU5p+IwHvezfEVq23ciueMn5ZOjdSPoD4X2/4Y1vQVjA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370028;
	bh=OZblifgPlfN6rD2vLJSUzv5UT+zQ54TMyOkMruclkrs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BIpWTPjnkxcmbdnhvvfFhWHxzeRJYwK4swN5bgjOnKUtE3AbcmDJ/ohhjg40zAtgc
	 irn0rZaFRSFabdZst6lwervUY5Ai0avhNWE9k90JAT6FI1rIVLG5Hmfnh3fe2vtt88
	 0Jcutr7x5juDdMBN3eprlT3ieL9wiJfDr/blLrBKfYtuF++5XygYXAMidjbcWIwCbk
	 Pqv696dTu86yLvAp8onhavDojRsS4uVcho0yMkvjiRfXEwb/yOv24/mvx5oZlGE146
	 /TSsNHKEtYgpDTFzYZeGHTT10eYB2YnkibEhAYOc1MD+n25xYdsw833K+oD6lAX6pk
	 FssAwKVriLczA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C10F60DA6;
	Fri, 30 Oct 2026 14:20:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E12EC712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C572F40243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNtw4WJD541G for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0338F400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=B1UvWCzEbERXxh/gPjE0VWkksHgDIEx9ndZq/oGV4OfHTLqcrxKf6xAylTpWU2dI30nX
 /ygy8WvGwIjeySCAzSg4d2NWQ/KmJy3AYY+F4jq360n+G7vm0XadrTL7UWwV5ieXjqoki
 Z7Du/SPOKZdZes9Yh/gbm5u9kS7hKj9VCIEoNOWDLjA9ivVzSWBcQLEagJK0VGA5R2OlW
 R4sYk1e9YNFRDQGCFG+tLMXWWRcCnWZK3Gl219QQZ0k9F8UQvQgob4M2jTPqdvb5F71IQ
 P65Pgnt/jkMmZmV0LL5f0yqjFSEsgoptarwuxCedYr6klP7DR7YKEswtrKfUiTpBeXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZF3yOkhfpFeJtK7mwNNGPMbDQNxdbjVz+Sg2HKJj6q0=;
 b=YloEeU4seQ4ma/yltkncfV1w7oLGMnVOpeg+G+im9azsTcMItMzGlKH2GfTanjr88EqS
 /79n8/95YGmf5/8IqiJJWf7t5AfHEphPIXLqXdkXs7nLTVDseMEm1WM0ZlWgCGMbF1/pH
 2MMqyd1mcW9GIv5c4s4OanZwCLuDfFOfyTxvkRZoQegk3wuvJ6LTlqXyAZM29g32j28o4
 BXwBvxsCaA34GZwVW2Nynxuehxw1vkdAaM2sStBgjsk6v9lPQj7LN+dqmkqMDzkl9TBea
 e/6jIFt18ZTw6noa+ekfRJfWm52hD/kS0CF1N/kJrij6TNqzmFHCmVlAnzGTfR6DsKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0338F400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 213539D389; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4319aba0cd97e64ead38f904c75f470843ac0baa
X-Git-Newrev: 83f2b5b51b11543c4e80f1d22e177473e4bcba39
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.213539D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/kodi: fix build
 errors with uClibc-ng
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
Content-Type: multipart/mixed; boundary="===============6538134032542704368=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6538134032542704368==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83f2b5b51b11543c4e80f1d22e177473e4bcba39
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

uClibc-ng 1.0.58 includes commit
https://github.com/wbx-github/uclibc-ng/commit/487af14988c3c923aa661f204642597cff356a83
which removes "#define PAGE_SIZE" causing build errors detected by the
Gitlab pipelines for all uClibc-ng toolchains:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-powerpc-e500mc-uclibc/build/kodi-21.3-Omega/xbmc/utils/UDMABufferObject.cpp:26:12:
 error: expected unqualified-id before numeric constant

Patch 0015 fixes the problem.

Buildroot commit f82f5fe177b7f884d424c7ce22aff670ed13f359 bumped uClibc
to version 1.0.56 which includes gettid() causing a build error. Patch
0016 fixes the problem.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4d91f8d7df30250a92afefda697530ced4d8bc22)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...bject-Use-sysconf-_SC_PAGESIZE-to-retriev.patch | 42 +++++++++++++++++++
 ...ThreadImplLinux-uClibc-ng-provides-gettid.patch | 47 ++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/package/kodi/0015-UDMABufferObject-Use-sysconf-_SC_PAGESIZE-to-retriev.patch b/package/kodi/0015-UDMABufferObject-Use-sysconf-_SC_PAGESIZE-to-retriev.patch
new file mode 100644
index 0000000000..3b7e359844
--- /dev/null
+++ b/package/kodi/0015-UDMABufferObject-Use-sysconf-_SC_PAGESIZE-to-retriev.patch
@@ -0,0 +1,42 @@
+From da89dfce2da4c68ef3a7f89a4fba1cd6f861e363 Mon Sep 17 00:00:00 2001
+From: fossdd <fossdd@pwned.life>
+Date: Sat, 22 Feb 2025 22:52:11 +0100
+Subject: [PATCH] [UDMABufferObject] Use sysconf(_SC_PAGESIZE) to retrieve page
+ size
+
+getpagesize() is deprecated and legacy since POSIX.1-2001 and is not available
+on architectures where PAGESIZE is not defined. Instead query the
+current page size at runtime.
+
+Upstream: https://github.com/xbmc/xbmc/commit/da89dfce2da4c68ef3a7f89a4fba1cd6f861e363
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/utils/UDMABufferObject.cpp | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/xbmc/utils/UDMABufferObject.cpp b/xbmc/utils/UDMABufferObject.cpp
+index 2b8336bcea..f6ba81c18f 100644
+--- a/xbmc/utils/UDMABufferObject.cpp
++++ b/xbmc/utils/UDMABufferObject.cpp
+@@ -23,8 +23,6 @@
+ namespace
+ {
+ 
+-const auto PAGESIZE = getpagesize();
+-
+ int RoundUp(int num, int factor)
+ {
+   return num + factor - 1 - (num - 1) % factor;
+@@ -93,7 +91,7 @@ bool CUDMABufferObject::CreateBufferObject(uint32_t format, uint32_t width, uint
+ bool CUDMABufferObject::CreateBufferObject(uint64_t size)
+ {
+   // Must be rounded to the system page size
+-  m_size = RoundUp(size, PAGESIZE);
++  m_size = RoundUp(size, sysconf(_SC_PAGESIZE));
+ 
+   m_memfd = memfd_create("kodi", MFD_CLOEXEC | MFD_ALLOW_SEALING);
+   if (m_memfd < 0)
+-- 
+2.47.3
+
diff --git a/package/kodi/0016-CThreadImplLinux-uClibc-ng-provides-gettid.patch b/package/kodi/0016-CThreadImplLinux-uClibc-ng-provides-gettid.patch
new file mode 100644
index 0000000000..87c71a525e
--- /dev/null
+++ b/package/kodi/0016-CThreadImplLinux-uClibc-ng-provides-gettid.patch
@@ -0,0 +1,47 @@
+From 6b2fd8c0691426be9e8d36276e5f3a8153fa3262 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 23 Oct 2026 08:03:18 +0200
+Subject: [PATCH] CThreadImplLinux: uClibc-ng provides gettid()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+https://github.com/xbmc/xbmc/commit/b5b2be7121f750b5f27d205e2b11ce0179b388cf
+added gettid() back in 2022 for older glibc and all uClibc versions.
+
+uClibc-ng added gettid() in version 1.0.56:
+https://github.com/wbx-github/uclibc-ng/commit/47c15dbb50f07be1ef5a1ffc9559205584078fbc
+
+causing a build error now:
+
+/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-64-uclibc/build/kodi-22.0rc1-Piers/xbmc/platform/linux/threads/ThreadImplLinux.cpp:
+ In constructor ‘CThreadImplLinux::CThreadImplLinux(std::thread::native_handle_type)’:
+/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-64-uclibc/build/kodi-22.0rc1-Piers/xbmc/platform/linux/threads/ThreadImplLinux.cpp:76:43:
+ error: call of overloaded ‘gettid()’ is ambiguous
+
+To fix the problem the kodi implementation of gettid() should only be
+used for older glibc versions.
+
+Upstream: https://github.com/xbmc/xbmc/pull/30055
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/platform/linux/threads/ThreadImplLinux.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xbmc/platform/linux/threads/ThreadImplLinux.cpp b/xbmc/platform/linux/threads/ThreadImplLinux.cpp
+index 8c7edbb591..ebf4ebe82b 100644
+--- a/xbmc/platform/linux/threads/ThreadImplLinux.cpp
++++ b/xbmc/platform/linux/threads/ThreadImplLinux.cpp
+@@ -52,7 +52,7 @@ constexpr int ThreadPriorityToNativePriority(const ThreadPriority& priority)
+   }
+ }
+ 
+-#if !defined(TARGET_ANDROID) && (defined(__GLIBC__) || defined(__UCLIBC__))
++#if !defined(TARGET_ANDROID) && defined(__GLIBC__) && !defined(__UCLIBC__)
+ #if defined(__UCLIBC__) || !__GLIBC_PREREQ(2, 30)
+ static pid_t gettid()
+ {
+-- 
+2.47.3
+

--===============6538134032542704368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6538134032542704368==--
