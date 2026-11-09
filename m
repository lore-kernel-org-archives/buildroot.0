Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4879E606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o6RRSh4h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=eQ87I14d
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 224DB60744;
	Mon,  9 Nov 2026 13:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ao0bcJluklC7; Mon,  9 Nov 2026 13:25:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 213BF6074C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794230708;
	b=rAJESvY9EXSbGDsyDZ0wKmOEGecUUQg31R1PiO0DtUK56POzpOMOuN2JkIKPie9QJ962
	 CacCVgg/oK+VVvzQRj30cg5zs4qf9u8oDh7vyVPCDV1ljzuGhMI6DKo44dO652tEJS/EM
	 uC62qacPh4VBjyvZCyKDQaLErIs9D0iWkDaDfyV+lSW9xW4FfmElJbEKVnwgzqsoh/f2c
	 Tiw28BSfUIAOMhXRAq8w8oNcwmpLhOkcsQteU5RSvRmeX6hWFyaO5cb0UlXM8rP7sY4Ql
	 WwAmbcnYXytHHJEyc1dyIl2cnf7wDR3Kf8PSOdAjZfTG0ch3xL6T2y9SrGKRuOhvvcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794230708;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5xUpuH+WK/2+wbrLotHlrWMavNJ9efOcpFWoaG0LlfI=;
	b=pNCWQWBvx/sOyWHYvAMXiAGynXlTHI6KDXZVoVBnnDfo/bIvHKMdqzj4f4BFURuSOTHH
	 JZT4xgLvzg72B/oj7CxwbVVLC3QJvSYNM1NeTrgxCSwvQKMIGKtd9tWGZmYsRbI6QiE2R
	 u8e98ph86wzFF+6ckNqzJHcesT1KKVT8hZSfPAvkaTE94J2ohIFQ/ld7Fh5R9gxbnxGCy
	 yLw3LuWBTKDoFIM5RNiSxzBlkLVLm9s+E/9Dt2kBIGO9+9OKvrynNRzczA8PKNwUbvnpB
	 rBwQco1UQZ/CfZ8FTclpLo/7Rw0Px69gafTZAEyUBJ9U11KsY39mDh5zXfPVTlM1W/Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794230708;
	bh=5xUpuH+WK/2+wbrLotHlrWMavNJ9efOcpFWoaG0LlfI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o6RRSh4hBDceiQrCjq6gj4E/Ri8UDD4IEGoV0dANNsZDuosfKLYA6iay7LsJhY2b1
	 cQ1IAgEXXIoBtHaC5izhJMK220Ulftt9u8ycFfWi2mImSk9tiTPxTokzXZ+36DaKSE
	 cWbXdhBuV6LOEDU3ffqTxBNRpXg/5E15m57mp4E8i1mNOBRQ65yQa/NDgDNiPW38nY
	 +uIc6ua+7KeLcmZbjfmVyqm8spk1vMKiOZfFEZf4KBpIzvgvIwmLAmix1ehus2s8YV
	 OUb8PSQsJRQELINisA04iVF4LaiWl6nf8bSbrXoFarK7H3paZHUHhZWHqpgiow8G6V
	 /UZjz84y1Uhxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 213BF6074C;
	Mon,  9 Nov 2026 13:25:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC0E4B8
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD2A4406EB
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPvTJ7qIqlAi for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 13:25:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 81939406E8
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::531"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=eQ87I14d
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81939406E8
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:25:04 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6b750e40ce2so9567a12.0
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 05:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794230703; x=1794835503; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=w7fFM1n82nLlOczESbMqIudIgitQ0J33dMxIBU1Y134=;
 b=eQ87I14djwsqQpGf43Dlu4caXRTcGJ5LdzREXqEx9QIQazlqitu3XO8JZQfVS/1xsi
 VRwva7ocTkJw9QjMN++vNlJFx5KeMmSngJCSbbdRLGYS/FVpJOh5a3bJUtN9Bu0cPJUb
 j7mZcQ6n5M2q0PyrthUtYA/dbFo3juDbUBdr7A1gTKL84tsfZXDNNCpaKJBvXV8ykmgR
 77tQqpquUctAjbiKDw779h0/Vy1JcHcYXWYs68gyG24Guo1QHblzGNWyieALfwIj/yhG
 jvMFP7+lj6qt3eVPHU1ajZw4VjBLnyjFdnQX4nyH8uEvXhf5rY3PY3nEqfm4yjlT29l9
 hf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794230703; x=1794835503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w7fFM1n82nLlOczESbMqIudIgitQ0J33dMxIBU1Y134=;
 b=OdjCO9rVSKVaRiyHKmNGK2oyMMKMiNWashIJVRxBmOh99dhgmJmwBrgK6GdKPmHfle
 gaBMbhKHXZvqnqSsbFVgE/na7OS7CCApTipAPo4uyqJ2B/ZPqJTR63MDi0ovuLaXVWn6
 SQMjPZzWOjGGhkzEAc5i/bXNRKGT1nBoBxiIoOpoVDT1qOaYstBuGM00qNDiuEXYLv/g
 h0s8V9KwOVftFEbZetKgz4B35UcsPY7//owYo5/jabqW1O9aI+l3+tVM9xp7t0Qxuwr0
 7W2Q5RkZyGAWsjawep4ZDIEj9lNiAo2QhUJpBEQJkY//7z4ed4SnMC7J32nysigj8UCa
 3FcQ==
X-Gm-Message-State: APuU4Z82UGNpfDf6ft9CW+ufOVcX7dW7BaAKXdsai10ODlr4WaEuEpRZ
 cn/jKDgofnXGvd3+tsZ89E+tU/02X/NaDRpplMYwI2avCiwkE64r9aJxDdpE3A==
X-Gm-Gg: AYBFou2VF+vtQqbJT3x5doXpO2xxZYMxMWQG/vJRad8MquefkwOH47x3QKNKK4GcPAA
 qN2bLL52tYkXfjgzCgD+/n0kkT1wTnfvhoXL2cBxRAX790p2T+Q7d/QzWb4A6XkBsoI+HUkcc6H
 tLYzSouBIolF5cbomiTzE7TwxebQOKi+HW4HvIKuKoUxNNOmeU6XSIB7Nyb5Vsp3YiaKmXMkNvA
 EyaED5tIt/ddF6Oi/xhCF/GZ5kDlaGxdtFKMU4Ug/4V6ZKWR/Jn2wpU2dxvcqFH9WvyEYuT51/o
 mIhpa3aynnJ3B/yFeEs9SOlrgDhgDI8Ae6k5VWnox3PR4MfBpPA42Owqi9EIxYhFOx1o+/9Ua4E
 BDcd5PJ7iT0oP4z19PLFkKK4YCob1bYcMAc4IcNafOnqNhTHBRx87VtIZGzJQuqglcMiKcXuphb
 BSaochTWJRdMk3dysuNJF+u/mjJx+ne6nXHGcJGHIkYjntEfoSVdZgNCwGCu8FxK/NJeZR0cVsQ
 mgBkmMFjZwTbq68zyFjiddM0gVy3DNMCVcHWpVsPR/LZB8moCGWHaINmQigaR+YU/RI5H5WFS9G
 a67C+8SBsYx/NdByb9nsy9ZlqNpfC5dEUGw8omFCt/ZwH80qu3iUxuLwlQXEOWqwsO+fhppRadw
 dVzx78VcY
X-Received: by 2002:a17:907:6d27:b0:c42:102f:15d7 with SMTP id
 a640c23a62f3a-c4d6d4a7b24mr258188266b.10.1794230702798; 
 Mon, 09 Nov 2026 05:25:02 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d6a474e3dsm175658166b.42.2026.11.09.05.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 05:25:02 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 14:25:01 +0100
Message-Id: <20261109132501.233001-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libcurl: fix build on LoongArch with
 musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since libcurl 8.21.0, building the curl tool for loongarch64 with a musl
toolchain fails with:

ld: read-only segment has dynamic relocations
collect2: error: ld returned 1 exit status

On musl, none of the secure memory zeroing functions curl knows about
are detected, so curlx_memzero_low() falls back to calling memset()
through a 'const volatile' function pointer. In non-PIC code, GCC places
this pointer in .rodata, and on LoongArch the linker emits a dynamic
R_LARCH_64 relocation against memset() there, i.e. a text relocation.
musl's dynamic loader does not support DT_TEXTREL, so the Buildroot
toolchain wrapper links with -z text, which turns it into an error.
Other architectures resolve the address to a PLT entry at link time and
are not affected.

Add a patch, submitted upstream, that drops the 'const' qualifier, so
that the pointer is placed in .data.

This issue has been present since commit be2789d08432 ("package/libcurl:
security bump to version 8.21.0"), which brought in the upstream code
using the 'const volatile' pointer. It therefore affects 2026.08 and
later, and 2026.05.x since 2026.05.1.

Fixes:
https://autobuild.buildroot.org/results/558c08d552920e45628254bdc029518120a35ae1

Fixes: be2789d08432da951c0ebfb23b034072601bc8fe ("package/libcurl: security bump to version 8.21.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...-relocation-in-curlx_memzero_low-fal.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libcurl/0001-curlx-avoid-text-relocation-in-curlx_memzero_low-fal.patch

diff --git a/package/libcurl/0001-curlx-avoid-text-relocation-in-curlx_memzero_low-fal.patch b/package/libcurl/0001-curlx-avoid-text-relocation-in-curlx_memzero_low-fal.patch
new file mode 100644
index 0000000000..4bb1ad83c8
--- /dev/null
+++ b/package/libcurl/0001-curlx-avoid-text-relocation-in-curlx_memzero_low-fal.patch
@@ -0,0 +1,41 @@
+From 8c05728ff2dfd5481379280ee7215518a2817725 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 9 Nov 2026 13:42:51 +0100
+Subject: [PATCH] curlx: avoid text relocation in curlx_memzero_low() fallback
+
+The const volatile function pointer is placed in .rodata in non-PIC
+code. On LoongArch this needs a dynamic relocation for memset(), so
+linking the curl tool against musl with -z text fails:
+
+  ld: read-only segment has dynamic relocations
+
+Drop the const. volatile is enough to keep the call.
+
+Follow-up to 066478f6346a2d987a9ecc3bd3bf45764d69c1c4 #21598
+
+Upstream: https://github.com/curl/curl/pull/23844
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ lib/curlx/strdup.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/curlx/strdup.c b/lib/curlx/strdup.c
+index ebc58c236..6f6d7c673 100644
+--- a/lib/curlx/strdup.c
++++ b/lib/curlx/strdup.c
+@@ -96,8 +96,9 @@ void *curlx_memdup0(const char *src, size_t length)
+ }
+ 
+ #ifdef USE_CURLX_MEMZERO
+-static void *(* const volatile p_curlx_memset)(void *buf, int val,
+-                                               size_t size) = memset;
++/* not const, to keep it out of .rodata and avoid a text relocation */
++static void *(* volatile p_curlx_memset)(void *buf, int val,
++                                         size_t size) = memset;
+ 
+ /* Local fallback in case there is no system function to securely zero a memory
+    buffer. */
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
