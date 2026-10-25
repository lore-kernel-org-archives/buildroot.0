Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B5606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bRo4YrZs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00CA6060D;
	Sun, 25 Oct 2026 17:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1R9sRl2SOJl; Sun, 25 Oct 2026 17:28:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A786605FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949293;
	b=OH66GSF/9Y06AU6J+0XqoM1IxxplunyY4zy+0eL1eaC48XRmHJ6LLlldzos/ZaqaiKmS
	 MdJu/0APMuhPAHdWopPfRNFdLHzHqIQqCnX95yUB44ARAcc99slnnblKB9G1hmffZgAuC
	 L4hGtGEpI99W7YY3j1EeLwjCPYR8ZYjbHqIknyw6eZIoB08+NOP+2E/6+qVfz7RC1U8dM
	 xBAaJ5Gn+Ec3JpTuXm3Jx9ymycC13q4pF/r7bzpO+XjVhaxTFpkSHX+tHcvHTKOeyZkfX
	 wAPbPYxfERa30781zvcFMZGQUzW0r9bz5dSsEOz4jXgrTnc9IPIdwCQ+lz0lEXcJI1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=mOpqFnZAkS62uatGRR6DruNabFCAOvWsqO5PwcPG82g=;
	b=R2iTswjnaRhCXkK++Oox1pSUR/Z23kpe/zuDYw1DKDjS+vSBxv/t2OckhMYUh2yyYUTq
	 RDFYm9B65paNnRkMeBWMI1c82gGTfkri1JSGIE4DUM3MgEmjj7XY8yM4s4CU/p824dCnl
	 Ojv/2ltRZovwFGdKR74x+vxmqQY8j2OwJuWtxyZlGnnjv3O4RbycZASD4UIeVTehH00hA
	 tDHcMhC5rR/Q7M0WEXW8VDsZmz7HN25BQH5SzyiPSKK+SK+YTxZdVyfYqWsJceAe9kuTE
	 DErM8jKv9C4WUC6l662Fu93ojjkYe3x8BECa2R410y0BzXA46qeTogMTAqIdkvV2G8w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949293;
	bh=mOpqFnZAkS62uatGRR6DruNabFCAOvWsqO5PwcPG82g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bRo4YrZsMUa2Oelq1hvN4KC7woc61CO5DiecyhT7bGxqewYTEPsnSRUEjP3y0O//n
	 Yobe2Iv2XZg10KQnKUzPK65oHCZ4itBqEhybGqoyTglRKCoj7LlCPJy01uHEjZcQG9
	 oq6zs+F0rFjp67HUxrVeqZ+phliDTluAvS2lSuc3LlDvpLWdNl1IiuGx4AYsIkldnB
	 fr64opH/LyLiZSiXQU4vUQxPpmjmo8jxujkYTw7U56cklv8cGxHNc0pqQDoSDL+ulV
	 M6ixnXx6WJOrEIvHBuc9ZlV9yDdTVsU/e1P1oIOG2556Z+bYhAGSmxNDlZ6juvH4GA
	 IctizoSh7J2mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A786605FD;
	Sun, 25 Oct 2026 17:28:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68AEF79F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A41F80D97
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hZNZclq6WIu for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99F7580D96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949291;
 b=XApNLM2tqThK5yYxsYlfit4MrEfKzfSuSI8izhCV+0Fj8KDZWvuEj7ZxpwSlx2zbfoOU
 T+YiDU83AdRXg1TcIYiCHKMGhAgrCaLnZCJ4Cc/TTaxhL7+fq2MVPZZeosjJfZmFsMGxo
 KPa0/Dqpexvb5h27MdC4RdqCHcftoR4NC0ho2GDDOur/ZqUm+GFlvIKlSYhKKFhNgiHJR
 rtWL4ellDIn1YISxQytj3ERtSrSTr0bOMnofpA9jrf1LY7p+BVH3Nxr9n1ejO7+cdBQXN
 VWyOIEpU5veQFomVMB9q4sRZEgiNkbG0bnouOOfojRZ8EVEFov+IRCR+9UpSehooxvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949291;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QgEuT9TCBdIc7ve08PvyAdRn2R4Q02MTcN43TYgWSn0=;
 b=LD6xjFhS59pMXbYaVvlJq8vIb83OOYxMJZGDGDRosAemhIjdsSfJyY8Qv3+LMbbrkfOe
 WsFnwCd33cbT9BPsqPTlDBjB4nVqu3pdaUAX5/v02KH+XIhwtiSnhP3ugtDJcAVcHcZj7
 WrPghbOQ4ZrPM2ZLMzIbb0V7OnglyjpY1zsPKzVoBCQCOl4aVFNLv5aIZuUnplbOWXFGj
 Ic+kA5Wn91peIJV35sGtTIEBNxYw3qnwXH42T/weCT+WxGpByK9T0XpqUxn3XFbTFxREl
 NOyow+0bLV/4ExWNyUGvnBrIPq0Qq8hthnBe5Gd1/gYqcZX1aP8YGH8NUqCttbx+q7Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F7580D96
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:28:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E2439876F; Sun, 25 Oct 2026 17:26:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:27:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1db2000b18ab08c801a426628dffb2f93a6c70c
X-Git-Newrev: 4d91f8d7df30250a92afefda697530ced4d8bc22
X-Patchwork-Hint: ignore
Message-Id: <20261025172646.0E2439876F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix build errors with
 uClibc-ng
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
Content-Type: multipart/mixed; boundary="===============2094216714758475139=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2094216714758475139==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d91f8d7df30250a92afefda697530ced4d8bc22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============2094216714758475139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2094216714758475139==--
