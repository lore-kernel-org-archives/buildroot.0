Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2E9606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KIf0KtBr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFFB60829;
	Mon, 16 Nov 2026 15:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z105cemnKxtz; Mon, 16 Nov 2026 15:40:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DF767607F0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843633;
	b=OMZoQzht73VcU63D8Xxm7H/ebO63dHrjCBiAO3Zwz3ZtheftFUX1KC1Occodb9tkkKQt
	 NDvHd9t8pAFyaqBSc4xAcuwGHYFpZNrOzV4CHTp0PcWG2n5n980NEezpXaZsMlGjJ69Td
	 WsxLkeUxnGH7pJkpRYovM320lVsRMOcdefC+2I6MX1Jc026J2geS7omQiuK48mwjoh9Nu
	 VeYThnLrfhdSgU4/PiiAOarnrUAEfaPnFZtfOf1IMh9th6vIf5HpDLB3u/gZIJueXLWDc
	 Zj413YUAcTvP7sI5pDPwtWsKmMR9DHngxvqaZLJzYYboHwpS32WzYT9YJrroExnX42g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843633;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DriQipJmcUzHBTXjEOY9+7vCnuEAy/ixyXGvAue3nWs=;
	b=hZSpiTe4ZcuEpaCDF6hQMiUcefLC9OA7DGIX7pMrrUf9ETbbaqY+JllK6W3VfzkSeT7G
	 ZqwkFQm63jNx7VFqqMVtxEJTBceSWRKHUditi8rChwhE5gJehN1NT00GvyXsNgVfZZ1ww
	 NDTv99ntaQqih3+1kcs4wnLMtPhQSoc/skEaRZGUGwhqgKILvFLiSzGpMLXl2Wdq+7wEe
	 YioxTcl1A2zSVgE+0TykmVmS7L9NV8GwLB/MpUV1b6tUMGCNQuazLxhNdvhGJHEZubiM/
	 gKMA8ybeJRr2M8pB3sBZCGyPRpIoNxMLVM0mTvESTAfLnpRyUdfwx1MjG1BybLpIbMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843633;
	bh=DriQipJmcUzHBTXjEOY9+7vCnuEAy/ixyXGvAue3nWs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KIf0KtBr+6nea+2BKlGE1AjEH3xT6P/3hkYYLFB1tHy7uRGrOf+TNW4B+iDu8ZfTK
	 GAY/wj04F13QkrXJodbh6062iZFLIIpVkM/c2KtP43cQuJrUFew+BjAQrKp34zZ0t5
	 9Skw5xHSQc21eybJxEttQaz9tN4npY7p0UP+g/aWL5IZMQ2bqhDWEp7H0/mb2VlHKv
	 aD1Z79tc1T38Z763poI9EGFuTw00Lqd4MpovnsvKkez+QkU4qbCpGW3qRvWJlrwsLX
	 r+dFQ0QzcbysxTZw9jPvbaHmsnZefkZjFDgSkjeQct053tzQVlWQEacpK/QsgPwAK2
	 a6Tv/qnghQRmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF767607F0;
	Mon, 16 Nov 2026 15:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F8D9109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 858DC40282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_WVuQlDYyYs for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4FCED4009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FCED4009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so11699575e9.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843625; x=1795448425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kW/X0/OTYbj/N4GMnxJT8i+Q9RSbxT01bGqQaZMj7zE=;
 b=CSs6625Tqhkc5a7UxCFiw4ClgTGGmqb70+Hz8kz+a4VipuO5+DiXnVNNKWxayz7mPw
 bW8S7GwlFqSai19wqwIhii3auwLs3FOpXrSrVVOScQ6TCbQTqtMd4BRWIaMk3zfsB35M
 NeYFA12RouR516sTPFN26dod1ptqyCiwcYML8hMpxwKmX6fC8YXlz/SC+IGexihzWiGf
 EWmuieJ0Y6dO4EuZEqHI6kdfAeIGtsNMwszoZpwy3Uv/bjPlGlVpH2zGlqGPBMsQobmc
 93Np0TyedxzmXz5jYscV1ogsC3CUWh4FRZ6JMr/9Bky35eSJe8JbAQSz3giobPN/qJID
 CTkg==
X-Gm-Message-State: APuU4Z+qimZ11hJzORtFO8EV52pRWWNJDyYuku7djdf+cEUZAMLlfhXB
 GdNWQYUrkWJm6TpP2/zRWadJ6cc3W4STTKvtcfOAgZS+PnSeiwv4r+bnJqgHCOgzQSLWZuK1P55
 CcWym8OI=
X-Gm-Gg: AYBFou2Ja91HR+YekiI4cu7bK4s7pGXwkV+gqZtqJs/s/kXg+sz0tjXKKyGORnye4KA
 c0la8Nn34892e44MbwY+Z+RoTqhRP+Io1n3NB+1QPVlpdSW09gHABPNzLCAE4tpL3Y+dQhhwAX5
 tD1FS/G0cg1TrKm32FdifTB6H4clhLVIrIGpZd8m1pDzmA/3wycFyI3yxn5W5fl5ZHVNHRkuo7s
 dU3U/QJCq1a33uJM2qS0oW6oJ8gqaZ055Tb90+uxPkb3dM72l7HoElB+iW2sX0NwIKn0z2rO+E3
 GxioVYipVCSv22FFws7vLMPxiJfT+QoGuEwSVS0nLLglCQsmjhd7uaC7ZiGGSio+ixhnCOw/o2S
 sGHc7CcE3DVdeXU/6D6pyHsPx+K5u8Wj4lY6mEzZH3WbcVUEO7Uvrmbr8cYmGwO64At8cgKm8Yu
 bDjDyyhvMuS3Q3PpCJjxIh56wTYRBXbzwPgdxHHnVha92z085Ix3Khpxr1jPE/fiX0/JIYpGW/l
 KYx6vcpnH0154Pw4MWHmzsvkpCBSHa0CvB+2dEJQfC9RuRDfHHI+uMWUglzGBhbR1Eqfymcthbw
 nZaHUGq7kLcLCD2iT9PPJX2usINjRgk=
X-Received: by 2002:a05:600c:3496:b0:4bb:6de4:2f7c with SMTP id
 5b1f17b1804b1-4bb6de43047mr89946605e9.20.1794843625106; 
 Mon, 16 Nov 2026 07:40:25 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb5faf05f8sm179135975e9.10.2026.11.16.07.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:24 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:22 +0100
Message-ID: <20261116154023.725922-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105203813.1522364-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{lib,
 minizip-}zlib: security bump version to 1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://github.com/madler/zlib/releases/tag/v1.4
> https://github.com/madler/zlib/blob/v1.4/ChangeLog
> https://madler.net/pipermail/zlib-announce_madler.net/2026/000017.html
> "This version remedies several security vulnerabilities, fixes other
>  bugs, and has many other enhancements and portability improvements."
> 
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/abfccd119bdc40abb2bf9125c83410f519ab594a
> 
>  ...overflow-bug-in-non-blocking-gzwrite.patch | 31 -------------------
>  package/libzlib/libzlib.hash                  |  2 +-
>  package/libzlib/libzlib.mk                    |  4 +--
>  ...ncy-to-ints.h-in-minizip-Makefile.am.patch | 26 ----------------
>  package/minizip-zlib/minizip-zlib.mk          |  2 +-
>  5 files changed, 3 insertions(+), 62 deletions(-)
>  delete mode 100644 package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
>  delete mode 100644 package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
> 
> diff --git a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
> deleted file mode 100644
> index 32aaabcc76..0000000000
> --- a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
> -From: Mark Adler <git@madler.net>
> -Date: Wed, 16 Sep 2026 16:26:14 -0700
> -Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
> -
> -This addresses CVE-2026-85091.
> -
> -Upstream: https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
> -CVE: CVE-2026-85091
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - gzwrite.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/gzwrite.c b/gzwrite.c
> -index b217b85ce..512329244 100644
> ---- a/gzwrite.c
> -+++ b/gzwrite.c
> -@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
> -             n -= state->strm.avail_in;
> -             state->x.pos += n;
> -             len -= n;
> --            if (ret == -1)
> -+            if (ret == -1) {
> -+                state->strm.avail_in = 0;
> -+                state->strm.next_in = state->in;
> -                 return state->again ? put - len : 0;
> -+            }
> -         } while (len);
> -     }
> - 
> diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
> index bc8b046426..11907ede28 100644
> --- a/package/libzlib/libzlib.hash
> +++ b/package/libzlib/libzlib.hash
> @@ -1,4 +1,4 @@
>  # From http://www.zlib.net/
> -sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
> +sha256  4f11c512053d7bab8d9e9b89bde3575add3e4c50a383b42ef6cb837035fc5a7c  zlib-1.4.tar.xz
>  # License files, locally calculated
>  sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
> diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
> index 9ce08d7093..ac411d3d11 100644
> --- a/package/libzlib/libzlib.mk
> +++ b/package/libzlib/libzlib.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version here, please also update the minizip-zlib package
> -LIBZLIB_VERSION = 1.3.2
> +LIBZLIB_VERSION = 1.4
>  LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
>  LIBZLIB_SITE = https://www.zlib.net
>  LIBZLIB_LICENSE = Zlib
> @@ -15,8 +15,6 @@ LIBZLIB_PROVIDES = zlib
>  LIBZLIB_CPE_ID_VENDOR = zlib
>  LIBZLIB_CPE_ID_PRODUCT = zlib
>  
> -LIBZLIB_IGNORE_CVES += CVE-2026-85091
> -
>  # It is not possible to build only a shared version of zlib, so we build both
>  # shared and static, unless we only want the static libs, and we eventually
>  # selectively remove what we do not want
> diff --git a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
> deleted file mode 100644
> index 98e16251d8..0000000000
> --- a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From cb14dc9ade3759352417a300e6c2ed73268f1d97 Mon Sep 17 00:00:00 2001
> -From: Rui Chen <rui@chenrui.dev>
> -Date: Tue, 17 Feb 2026 10:48:39 -0500
> -Subject: [PATCH] Add dependency to ints.h in minizip Makefile.am.
> -
> -So that ints.h is part of the installation.
> -
> -Upstream: https://github.com/madler/zlib/commit/cb14dc9ade3759352417a300e6c2ed73268f1d97
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - contrib/minizip/Makefile.am | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/contrib/minizip/Makefile.am b/contrib/minizip/Makefile.am
> -index d343011eb..b7dea4f7e 100644
> ---- a/contrib/minizip/Makefile.am
> -+++ b/contrib/minizip/Makefile.am
> -@@ -27,6 +27,7 @@ libminizip_la_LDFLAGS = $(AM_LDFLAGS) -version-info 1:0:0 -lz
> - minizip_includedir = $(includedir)/minizip
> - minizip_include_HEADERS = \
> - 	crypt.h \
> -+	ints.h \
> - 	ioapi.h \
> - 	mztools.h \
> - 	unzip.h \
> diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
> index d5c07fcca5..acbff105d4 100644
> --- a/package/minizip-zlib/minizip-zlib.mk
> +++ b/package/minizip-zlib/minizip-zlib.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version here, please also update the libzlib package
> -MINIZIP_ZLIB_VERSION = 1.3.2
> +MINIZIP_ZLIB_VERSION = 1.4
>  MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
>  MINIZIP_ZLIB_SITE = https://www.zlib.net
>  MINIZIP_ZLIB_DL_SUBDIR = libzlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
