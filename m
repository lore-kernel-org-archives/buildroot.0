Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212A7606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=szqjuBRT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2B01605F9;
	Sun, 25 Oct 2026 17:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TR5oSTOh-6sh; Sun, 25 Oct 2026 17:37:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DE1DB60600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949867;
	b=QKmHqtUY4AoCwQgPB+VU/NVf0nXaucLWHoal5X4FAfT4IgyamBttNaK8EzTYMWRUW/97
	 pU2DGPaFwirELEcniRQ2Mt/ervXpHMadacCGgqTpOtbHUe2XBddPK0VHP47qo/uXrwK4C
	 SHymYrswnNV1/8ZZa+2BTzW4U9JCDXDPnrbFcFbIqQ10tECfwgYlHMQgpHm2xjy5kSnj+
	 WXur6zzGx+UaOddLH4pzJg7pcv8V0krxPLLVWIUoMY9j2tr6dwbxZc8XCpBUvcePSpXAA
	 UZNYnS/FJycDH/SY6wF3rAqIqivzl5Uat2SaPq6Hfu8/F9yOUGk8+Ipm4XvfELG0qqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oFlP4n13AAf2X7iEgj6ij+3W0s3hlIT+vgte60u+suI=;
	b=nk6rQoPDNTo9mvtOXkN7/SwtM0LgwqXseKE+PsVA2VGlI/RC5SZsK+dVvgbHJrbVW86h
	 ECCIW9aN7jW47SI78wAj3dyX8dFEQ4FebpgC0//zTjbPFNiuTVk2wfS9eyjTlFfTBb71k
	 NsxqLgQY0SxZOn3h1zrYlc82SHrwmlhlTQYBvrHsmHf8vwWmuyfHyvZsYUPSrgG9ogp8B
	 lLsL/OoWu6CkHSme9kkEC4NOFNq+HO8xny77b9/0vQpjQcz+TpEsDLhRhGFCm/sxvswWg
	 Y+f5LRl8ps1w94DUdZBwyatQHei7roxy3VL6djI6hA7qikjWCoCSyl2PaQ2b0cSuQNw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949867;
	bh=oFlP4n13AAf2X7iEgj6ij+3W0s3hlIT+vgte60u+suI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=szqjuBRTr5QYO3oQNEDy1DqhrUOhMxBg8h2pGc2km1T07KW/Y2IbHLhFgmILR1MeE
	 J4ebQRfsYmm0iabp0fuUCACjcpWBss9XMOOfqdGqLCNL9wl7LrFF/y3l3Dll1pX0jy
	 Mc90g04VJUFKLfXIn8XNqnHXIrzurMRyUimGEj1RVw9lu2X7BnPVKgkDRv2m9WV22K
	 4/9s5osB9KJVMgFipW6wT01ZJu143hLCj+AjuCuAlJdMn26RaGxrhteQpYyGCmx0o7
	 EjA3t//Qx5HqObVOzWkrS1oHZ+ckmDDPMoRFBq6Fnrb+9fTLDtyqXz3txD+tNuzGnI
	 500O8aX5vP+CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE1DB60600;
	Sun, 25 Oct 2026 17:37:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DDDC79F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F412240098
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmNeeVaxPqmD for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:37:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0705940057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949864;
 b=VP7F64nMh7oseDWyG6LuXxGJsS2ZtgV4uuUvJNtFeMSFdYoXdKaey60acnSJ4zWsOiZw
 kNc+rbXnD+jKnKDwnKc8MWfBU75EUxGr7WINKFCpljmbVYs/oe/0PPDAb3Vu0Fdgle/qE
 vQ0wGdC9O7qZ9WW5slXw8aJPOljp/X7ER+BpxYVXPgQsGmBUx7quL5vA/diEnl+nfzRmU
 BxMLhO/UqqfG/6sbf5Xi8IPHw5fCI2hiFX8Fh3HaMg2uqkrk5/l5kwhU3JLYqFjKPrTdr
 nb2Gjo9NY8QufCFHXsy5+yLLXHkl0k0rGq9Y1ScNaEV+8nbKh80yBCZ/oIEHKR2tlTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949864;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HkrAL75aqwvZ/jCoxMx+I5F6TcKb1Enzrub/yBcZr7k=;
 b=DmDYGyF3FmXWz5GC5JIcSkLbqG7OpH4f4yW4K4Zq/kEAJwQva01p4319eZJ1HQy1YWQu
 U9ZoNNzfCH9gCFh/ImeWgzsvq4j7herrX9WZN5ld73coazq7xVuFkVPjZc92KR4I16Dfq
 qFwkxEJxhKWf+WGYvvrW3OAjs5hDfhvWnWITN7hgnstz8DjVRnOMK3YhQv87KKCYO3vko
 qSxYAhO3DGh5YGTn7UB6HUbX4tGbWdmcYP8LXrWwpjExe9P++Uda91ZPKKshcRd69epx7
 t/8eU/li0J5sXn/rCjeXqXYPPtGfbI4El+05uhu7ZznlGVyeDgtByTjifsQTNqPDqXQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0705940057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:37:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BFE599719; Sun, 25 Oct 2026 17:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:34:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58434cefcbadfcc5854de47fe42db0ab68bc118d
X-Git-Newrev: 339a4809172efd1fe5a0f6e28d69c0bb9d4eb90a
X-Patchwork-Hint: ignore
Message-Id: <20261025173618.6BFE599719@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: declare wcsdup() for
 POSIX.1-2008
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/339a4809172efd1fe5a0f6e28d69c0bb9d4eb90a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

hidapi fails to build with uClibc-ng and GCC >= 14:

  hid.c: In function 'utf8_to_wchar_t':
  hid.c:116:32: error: implicit declaration of function 'wcsdup'; did you mean 'wcscmp'? [-Wimplicit-function-declaration]
    116 |                         return wcsdup(L"");
  hid.c:116:32: error: returning 'int' from a function with return type 'wchar_t *' {aka 'long int *'} makes pointer from integer without a cast [-Wint-conversion]

wcsdup() is part of POSIX.1-2008 and glibc declares it under
__USE_XOPEN2K8, but uClibc-ng only declares it under __USE_GNU. hidapi's
Linux hidraw backend doesn't define _GNU_SOURCE, so wcsdup() is
implicitly declared, which GCC 14 turned into an error. With older
compilers, the returned pointer was silently truncated to int on 64-bit
targets.

Backport the upstream commit moving the wcsdup() declaration under
__USE_XOPEN2K8, which is enabled by default (_DEFAULT_SOURCE) and by
_GNU_SOURCE. This fixes the issue for any package relying on the POSIX
declaration, not only hidapi.

This issue has been present since commit 5eb0203cb05c ("package/gcc: add
version 14.x"), as GCC 14 made implicit function declarations an error
while uClibc-ng has always hidden wcsdup() behind _GNU_SOURCE. It
therefore affects 2024.05 and later, including all maintained branches
(2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x).

Fixes:
https://autobuild.buildroot.org/results/eba842f15d96e483e0d16b12028da2ce10dcdeb0

Fixes: 5eb0203cb05c0a65bdb7f89a2644eef7cff2dd27 ("package/gcc: add version 14.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...7-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch b/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
new file mode 100644
index 0000000000..9cdbbaf2e8
--- /dev/null
+++ b/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
@@ -0,0 +1,41 @@
+From 936a08b682e761afba98ef3800265add951201fc Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 22 Oct 2026 13:55:32 +0200
+Subject: [PATCH] wchar.h: declare wcsdup() for POSIX.1-2008
+
+wcsdup() is part of POSIX.1-2008, and glibc declares it under
+__USE_XOPEN2K8, but uClibc-ng only declares it under __USE_GNU.
+
+As a consequence, code that doesn't define _GNU_SOURCE (for example
+hidapi's Linux hidraw backend) gets an implicit declaration of wcsdup().
+With GCC >= 14 this is an error:
+
+  hid.c:116:32: error: implicit declaration of function 'wcsdup'; did you mean 'wcscmp'? [-Wimplicit-function-declaration]
+
+and with older compilers the returned pointer is silently truncated to
+int on 64-bit targets.
+
+Move the declaration under __USE_XOPEN2K8, which is also enabled by
+default (_DEFAULT_SOURCE) and by _GNU_SOURCE.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://github.com/wbx-github/uclibc-ng/commit/936a08b682e761afba98ef3800265add951201fc
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ include/wchar.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/wchar.h b/include/wchar.h
+index 2e6ff77c0..0056f93da 100644
+--- a/include/wchar.h
++++ b/include/wchar.h
+@@ -210,7 +210,9 @@ extern size_t wcsxfrm_l (wchar_t *__s1, const wchar_t *__s2,
+ libc_hidden_proto(wcsxfrm_l)
+ 
+ #endif /* __UCLIBC_HAS_XLOCALE__ */
++#endif
+ 
++#ifdef __USE_XOPEN2K8
+ /* Duplicate S, returning an identical malloc'd string.  */
+ extern wchar_t *wcsdup (const wchar_t *__s) __THROW __attribute_malloc__;
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
