Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17994606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tD2YktcB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E85C740E21;
	Fri, 30 Oct 2026 14:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 068rHpdMTOv6; Fri, 30 Oct 2026 14:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D98A440DD5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370030;
	b=KR8Ybujrf+eepi/xOEKN/WzGMUZGBR4d4k8IPw+HAJS56UivhGzyo+y9CDdtzt8pUe17
	 XYbIOCVfwLl0WftdfpNNMbWpiDBKUg5/OH+0ZdjxmoXdGCugqkbrPGfQCc1ojB9T40ynN
	 vcXoDAdnr5eyJmHOjMdSh7x7/V2HVmZzAHS7/oDs52u7r/rOYsQopPmEW9WzmbNbyNdXO
	 VEzQOxPzxB/EvRS9Ycm8Hf/+PmpelKJn7iOgsOWMx26V3dTUv8r+1k8hAxAltwrlbgmWX
	 Uq2LjXb2TqsIXmjrjr+AHO0AIzCkZwnzvGgURultUms21ltCXVZI9U2D2xrxZx+F8AQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370030;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+xeAi7f8t1j0QZec7zfPzh9M4fIPKZUUxYJCY2IVrdE=;
	b=qp5vssSj8cypgfea6zPTghW0M7cKlrfvGbzMnQRp7B4J+H5oYK+BOQxfzAX4D1qAJSux
	 nxEreBZoypFearNf6ss7kJskDI0PXTvwN/6/IXMtFElayYgsf400gH6uGPuCuxUaO7qYY
	 FYSyf34HSXkTBIIWUJwXksWox/kSepZnWPvgwOwaAgOd8j3Rki1zgMimg9xTPd3851sry
	 rJ6riBxt+GXoIWyysrsQH1HwDCQB1XIQruCQzthmTZV0oICrzZKHdA2Bux8NNOzp8RaYo
	 4mKBID9/dOlJECK0tJX3g/If3yeoZULd8daGTRLexwWz6XoLbJho0keRKTEkZ05Fq+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370029;
	bh=+xeAi7f8t1j0QZec7zfPzh9M4fIPKZUUxYJCY2IVrdE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tD2YktcBQ+DaEBetesWkj6kAWtAsLIj0YACLxJHekd2voDgEH72o/mTojvY4LEWV9
	 /gBsTUOImmYG0hVnnNkHCMhdd+nlr2eAmh0WWseWw6NgMWptV4H4oMfCiVcxj0EpQi
	 /B8yZyTQwrRpX3cf7D/kgN7iFgiNQC79v0Gr66MKC1JPbfVdhWSSSUEI5bL/0OQGBa
	 m3TzrwQP+pWw9Cw/u6q77pp/oiYZ0XqHYhAu5fIH7VAmaFiOEbWD4INzstzmNYTr4T
	 AEz6QEI5OvctCDOK87Jrtl8gKaUsp2504cGlZN9B1x4JuZOCKMRar2WC2UnxbE0EIv
	 x/moXLn7Ndj3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98A440DD5;
	Fri, 30 Oct 2026 14:20:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7844D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D99C7400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ik8EW12q2X8L for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 20D454052F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=Xvcym1fB7bOg5125B+fw1zLSPvJrpaf06pQCNje74cbWoi/tX/Is5MttUFj0IwkurADj
 x20YZxKRoD2l3solxojYcE1GaI+z8cwGoGR5uCQLm4OZ7RjlkPh4Y4UPLAwqa6a3goz3a
 xrLXjdS3AfnlmLP+0XWid51hMKUnTcXjxX9NIxDMA5HMDB2SKyL1RGQbWhOCZB4JaDosh
 g4dnfp/sZOdv585NIE1poHClOp7CwoEQtjdPO8IbDw4k6TEN/7SO6+KNIMdspjw/Vg5IJ
 jKLwUaAUGiEzLDvyGchULhqXIboisQ5G/grLH5PPdUlS/CiDxBhyC6XSPtLCv9yhXyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=e4fTXgZxLv2K2hjQIwgU1PDSE/63hdv1M1nfwzT3kIM=;
 b=CmyqefheQBPMiRMAW7aKvIVNA4fbvo8iY+g0Pbj0sWkRfx4nVVKpMv3iu+F0VzQmmcd6
 DMN0t1QcXBJAuFW3vtZwQqJ7DIH89E1KjFsC8D0JfVhEQifnvl+drmy49q33Xa6CHZ/sU
 aOOqzT1US2YJTi+laANtwS9UfBiUs2XhP419uUZu8DGM17t9MZSF92oXNbAeC9QZGMq2A
 4qcDSUl0j/FAJlTC5Jo4PAfGUcKwEln2RmQhGQlxJqeQNul3XzRrBWARUG2HbJ2dCc7/M
 oEERweUa3z2an9pIfdL26Y2MYKG2QY+No/0B4cv+9d1vLmRuCLNSWs8sMJEQn1WFzBg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20D454052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 400129D389; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5ad6a78f17ea109411f693b57615d0d97df5753b
X-Git-Newrev: 018be346fb44a53e6a82f9eb10c7ac4e889e1b26
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.400129D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/uclibc: declare
 wcsdup() for POSIX.1-2008
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
Content-Type: multipart/mixed; boundary="===============6181041753771962803=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6181041753771962803==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/018be346fb44a53e6a82f9eb10c7ac4e889e1b26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 339a4809172efd1fe5a0f6e28d69c0bb9d4eb90a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============6181041753771962803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6181041753771962803==--
