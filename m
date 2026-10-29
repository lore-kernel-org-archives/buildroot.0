Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DDC606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZM4p/T2V
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6B6740BAC;
	Fri, 30 Oct 2026 14:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoJ5KgxkosvK; Fri, 30 Oct 2026 14:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B56E940C6E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369305;
	b=eobfhDB5yH3OO18Li37qNjskcOCwg0xKjaxC0vVYMNdlEuq8hEzgy/24KM/1ojIsEoYr
	 3adsX7hEXL2/c0YKAgoIsUEH6Y0qC9wvCfIH5uMx2WfS7YJfe5+2BRgnHa8jTE+zS2kbs
	 wDuPbAzj2brrSDZQiGvyQum36NOB+3n2CBrquibjFIku8rJa+hOkZ5IJ/m23lyfkZRwuI
	 Jg+uQjeUTwHVcbUaxH/KjfWLgQIluVw/4uGSV6rgCq6uGJoHl/u8LWEiy2WIMZvtbeleC
	 RAsAOyBz0T57/SrBMICZcVdAz8KwxJMF+xLvGUNIW+OUyPtZisFCCAM/+PhvBrVcr/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dugYht1tknKIzyU+uOvhTWmFsdOL56P3180Y5+a/cJI=;
	b=teFuMNfMr15O7389XqKNGPchRqr3htS4vp3oNYc+9BCrWg1oxYRIZGKAGKgps7IL8DtB
	 MTmg9tAGeVHjAmocDO1pI4EC0TBNZuD5EVBbZMxZudlxzmJr8hD1H8Sm2cxEsGoE1foWy
	 QT5tpzxv7sxnFhBBToacJIc36zi90VSgUzX0FxVrJ5zYfCQHib+v7dm7Su61XV43QNo8o
	 dBBLGrcOYnmeVZDxmrCfEnGEsQKVh10FZrLGuqHXzIGVYh7LCxrTrQQ6YYFbo0PggsaFG
	 OF/keWMtGscumYG0De6WliWM4+AAYbiHY1DpU20L4cAksIB+yzZ+DRk2TGUu9cOf+iw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369305;
	bh=dugYht1tknKIzyU+uOvhTWmFsdOL56P3180Y5+a/cJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZM4p/T2VsT5/oqpKMa6dkUgw0KtfG+1z4Ay4elYluk9ymyWFpRtmkXbSSXrnmBnLX
	 KONRXKfCsnRz9j6NC7fX70KcQs0ei5nJAbD+2BINfcnyAAFCBLunlCSUId3PZNF/nj
	 wpTEYg7GbsJNoD0jZdbINBXfMWsxjyZIVibddpn/i/ahYvmnh1P51G3WsPNbwQWgZQ
	 wsUQzVN/lmA6tFizmhqL/RJDrqxnNJLiCo5Dg96tigFe0Ip/qrZ48UCGdQY/n56SZH
	 kxQZan6Htabv9nvQi4ESTkAredaTg4hPZz1tZRhBQHfyWjhaICQFSk/pmxV3/3T/L4
	 vfX/cPpY3xaWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B56E940C6E;
	Fri, 30 Oct 2026 14:08:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0987D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A39B540B26
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_g7GSFBCINM for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9AEC140B34
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=XyUYmbuuRhyqaj1fAKPeZEhOq6LP+Dmv0mgV/I23YIw+d4fJ/eLk8WQbmDPwVdzGRnnM
 i8uxAPtbeFX4rkd1gWSkovqmreehp2MI743ubHVvbv5+qOUR87ZO0SyXPK7/ciXxgctEZ
 9RYPiF5sGwlABvwKsgcT1LjJzxw5YL7qH3RSozSrVy4At/aHxGb4TVj10TS6h32zhbu3R
 AqWaElOqJIgzwU7NXSctLA4lZUxWaxnRWaTyp2R/YvT+gqYdsyz6Rkz4udky3nlOa96g+
 f74Rkeu19E+OF+Nf6tRFnZdg7eTMys9LL3OJUn8hOF7g+MWHD+vdkf6BtK0ueExdrUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PEldzyuTICwfQUgfB7zMWTsfVl1Hv0hJVg0dbyV40jU=;
 b=T75wQwY7eUUVWP2CgugKXNt6EWb7TFiUug572BjRrodDPnNG3x4FXLN8+eSVLObvSvJg
 1zFVa1NBM5HDJwXEDMCZPkpEHRqXGpTEEUFfweBH9ePISuNvf7wuKd03GMba3K6Y7rxLe
 K77BHt8w3eRnLJeEp8SRfKvQDeTuNNZv7Af4A0pdzIkNsqiBPMyWyOb3hXwh8y13cKqXo
 qJFmAhqFOLVX+IstM+D+PUFdDDJsNVQHytzOHZHitasejjXdOPGHheo96itm2GaHzAoMq
 3NoOR4y9bJV7AzD1/9VcZHR9LW/j7m2Og5ff+KQ5qBy8s3Fk9bdGHnR87Y0NALamvbA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AEC140B34
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB6489D388; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c58f9838f5bad3b8fc7886d7de3a44d7e39819ed
X-Git-Newrev: 9704b4f0fc2e47f0f19ebf597e9447b4e6ceaeec
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.BB6489D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/kodi: fix build
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
Content-Type: multipart/mixed; boundary="===============0315139795119858291=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0315139795119858291==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9704b4f0fc2e47f0f19ebf597e9447b4e6ceaeec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============0315139795119858291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0315139795119858291==--
