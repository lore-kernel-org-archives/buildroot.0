Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC4606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SViZLFSd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C2F78146D;
	Fri, 30 Oct 2026 14:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oCX60FxPAuY; Fri, 30 Oct 2026 14:08:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 94A158128C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369302;
	b=KjFng1bnldVZrP2Xj/P1Lu+9TX1VT8XaUIhnNp9TWwSMO/zXlFW8alIrGIzXTawAaKry
	 prPHRpyVrnRARMlXRFBc6qaEs91hrY1huM28oROlEab9Owqd90TouWh5L7vbZoyOUOPTF
	 q56FH5Yt9FyjseISzbK5aOC1LBs4q/HClLQuz1cke4xAi1yMNGCU2N5wr7m39mY8CGYRM
	 gGuNnKfpgWZk/wevT81t3UuijcLb4JC0RLkHC9xsZ+zSJ4G+3+ncamB+hbfAxgem0MPLk
	 9hvqdqJAGrjqdJ/sKMr4zkkVKiikZuazWijFGslorVQ3MX+zOCQeLrUThEjO0kmtTSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LP4+HNilzVOvh8iqu68u+C0bgo9UE/rZF6YJCO1MSxk=;
	b=Qi4S3OiBInwWKLTjZ+VzCU9aVV/BDZ7Eil2yC+mT8cLo+H9zCh4iHOm9h5Igr0JNra/P
	 kPbik5pclbMnsFnYwN1yLrKGFZ4sHouXiAA0jGIMhDgVj1d8+HjeQmsXIOiVovNmr/dBH
	 OkRC8rruzAHQ+CDMjWJbEuQghp6IrNK6acOt5cLK3ioO1gloPD5Z6xPGuIgERfDgWmyiD
	 qR8d4l2VFPjb3x4XEXPz6HbHx+8t4jscLivVnGTauarPwfVtD21ZcCdKdhW1oA9UPoJhk
	 LsnHf7ClsAVKKq3BgRPYvYm/23OtIMCM9hWQ29Eg7+6j1Gc96JotxtuKZe7Omtfw0Xg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369302;
	bh=LP4+HNilzVOvh8iqu68u+C0bgo9UE/rZF6YJCO1MSxk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SViZLFSdy/RTBv/9nYIcUoLKQeilUj79VBMkp/jjSf1HxqRnKrIR+UInwcmseEOOZ
	 wnJVLV/73DnDkmRD6YaF3BYW41X9lEX9dIzcXuNbeo3PuxG+7Qi7yWYgcHjhp2VQWB
	 T1eY/Fct9GrCflWsr0BjI+uJFSaa8E1uK73dPhdBb5ydBCEeU4leJIlPW48Uz5qRR3
	 02LGZri3wP/8r805rYbeepmOjH48fTTuc8R62+e/lOGOIhJV8OFSm3brm+TBxoMmqo
	 XNS1ElubjNwG0vsPU6XHlwKgHjbpmzXsszJIjgJ2cegfADma7SJVQx+N3ZeZEABghq
	 XiCfVYpw2U81Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94A158128C;
	Fri, 30 Oct 2026 14:08:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6A16D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8966B81172
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AhobpFd5b69 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ADC5881136
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=rxJ53kuAxzqFipOPD/A+CkO08JAsqvGMhw93Dek5VPiVDJLs5h/VbO84Zm6JlJkniYc/
 ItYnntDfetjtLpe/RcpfACIcizTonU8g/RkEsESHJS1PwQRLmvBpsEjCtnvksBprQ7EqU
 G5EqHHfMXZYRO/JOf/9ddxCGsHXCc6xrvpetTXyepYmbWhxmNXtq6bfpMIWmHrordqlO0
 0iSIOVtUMgNpZtLRGovR/2cbEBY7NmZihHcB5RLdM53zbf8RE+7qs3zYkbbS3kPC8k+ov
 WmftO8wcCiXyRiVrTaMNdMMjg6GT4E+ZGtL5f/f04JeYW0PuSVprpkMDnG31+xWnYHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jMUHoE0730hV4EDHAJoM4MDmhpikhbhamcMY3r3Vy4I=;
 b=NJWOSl4bMuZZGO6P0XTEYcBrYfVC//VnMXoHcB9Xw6Tm9/xWrQs+5Y2K0Vsx/25FEd6c
 dK8Q5sE/yu4419QlBr3fQIdEdO244G7hQHpXZA9t3XAQ6Xs6huN3Cz9VRgFcjZHZu7AAB
 fbGC9zZhC/WoRwjkIgvYNncKTovJUFWwOf2Rx/h1rqDZeifToWlZhN/66IkoT74xzN+/M
 eeO7sTOtAA9o8uTstYfOikzZSHoNnw5oQJPHhsfYasdFizkEFWhVcLOgIVp7ERoqjv2MF
 0Elu1iWMUCs3LQ8XvGgraW2cQMdHEcWoGkM+G5YGaBhoAEkYofp//nH4PTccg0Nn5tQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADC5881136
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDC629D389; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9704b4f0fc2e47f0f19ebf597e9447b4e6ceaeec
X-Git-Newrev: 547c0e9c8c5c4e2b557557ee2da52fe5d986f3a0
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.CDC629D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: declare
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
Content-Type: multipart/mixed; boundary="===============6982875818126210510=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6982875818126210510==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/547c0e9c8c5c4e2b557557ee2da52fe5d986f3a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============6982875818126210510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6982875818126210510==--
