Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DCACD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1CAE605A7;
	Mon, 18 May 2026 18:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0w_LRO0k1kGO; Mon, 18 May 2026 18:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0402605AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779130446;
	bh=JQJCYg9bgGYMvcmBHmATzYrkZM4tpijIbX8riIY0BEY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jh0zOUddUwXBM3souVWvdTWeaFNghK1uUfD6DvK74yPc6lQ8OFUr9wYfLAuuI/XUb
	 xWQALnCudxXv7wpP/M1ZTxyugIZresiwwz2OzjdqbuCS8KB0LIZxZZaB8LSOFxXOlE
	 jHWoZZIR9AHa2Jq/kGZApmabfE/J/9dNnj2g8VKxY3wIuQbtHyRT4QbVf4AJIRmg6b
	 FVyKC60KA2FFj7AvdHDIUOwpM7B56qgySENZLJhYDpyXlC23nYuF8HjRcYXmupC8YP
	 cDaffyJUHMYYVas36xrnbjqVzvUSs6fXj+1Ya4YPzotCB1vy4MzgucYhYcTML5Uhi5
	 GjiDT6jDbPOTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0402605AD;
	Mon, 18 May 2026 18:54:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18B151B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA58402EC
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zi3gjJpxqONu for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42FF6402E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42FF6402E9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42FF6402E9
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:54:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A40C6B97BDDC; Mon, 18 May 2026 20:54:02 +0200 (CEST)
Message-ID: <9cec7fb3-4244-4401-beba-692be643af11@rnout.be>
Date: Mon, 18 May 2026 20:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20260514164448.92054-1-chakrabortyshubham66@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260514164448.92054-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779130443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=rAkxm1EMSBWeBetDNcwyr87fE8ppfdRMMqhYRZHJ0mw=;
 b=Jz3O0bh3kJRbY3h2UrHFaWwBBuvnTKrUjpQlpdumRRaQjp/HBprxBwLbeE3dfU/MGUp+TY
 HRqE8N+fZ+QqXg8YzzcKBk9FlshRoNT/Ecr1MeTDx4W4510dTMKDySGQ5EgWfrrSjAyKWi
 UoTdgwYHNBKXsq0WRd0nqbCU49dO8pvZZ0hcSXUC40aL/VAj7SNV8Sf9n8KD/W6l3cukKV
 H7YUtbbAr1TFHEC6AXaYB95b7A96Lu45bLmd70+WGMVzhQfgq/dMN2bHPzQaYC0qrK+9/C
 yt5y94FHWghgNu/xxaXTPpMf5i1/HFC9PY/UxTxoz9niBPrBWMHKP7Cmb5V6uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Jz3O0bh3
Subject: Re: [Buildroot] [PATCH] package/git: Fix build on older glibc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Shubham,

  Thank you for this patch!

On 14/05/2026 18:44, Shubham Chakraborty wrote:
> The build of the 'git' package fails on older Linux toolchains (like
> bootlin-aarch64-glibc-old which uses glibc 2.24) with the following
> error:
> compat/posix.h:159:24: fatal error: sys/random.h: No such file or directory
>   #include <sys/random.h>
> 
> This happens because Git recently made 'getrandom' the default
> CSPRNG_METHOD on Linux, which unconditionally includes <sys/random.h>.
> However, this header was only introduced in glibc 2.25.
> Fix this by using __has_include to check for the header's existence.
> If it's missing, undefine HAVE_GETRANDOM so Git falls back to its
> /dev/urandom implementation.
> 
> Command to reproduce:
> - ./utils/test-pkg -p git -c git-subtree.config -T bootlin-aarch64-glibc-old
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   .../git/0001-fix-build-on-older-glibc.patch   | 45 +++++++++++++++++++
>   1 file changed, 45 insertions(+)
>   create mode 100644 package/git/0001-fix-build-on-older-glibc.patch
> 
> diff --git a/package/git/0001-fix-build-on-older-glibc.patch b/package/git/0001-fix-build-on-older-glibc.patch
> new file mode 100644
> index 0000000000..b95ca94c23
> --- /dev/null
> +++ b/package/git/0001-fix-build-on-older-glibc.patch
> @@ -0,0 +1,45 @@
> +From c53f54a87503ae729640a6f12302778a980f84d9 Mon Sep 17 00:00:00 2001
> +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +Date: Thu, 14 May 2026 21:09:07 +0530
> +Subject: [PATCH] compat/posix.h: fix build on older glibc (missing sys/random.h)
> +
> +The build of the 'git' package fails on older Linux toolchains (like
> +bootlin-aarch64-glibc-old which uses glibc 2.24) with the following
> +error:
> +
> +compat/posix.h:159:24: fatal error: sys/random.h: No such file or directory
> +
> +This happens because Git recently made 'getrandom' the default
> +CSPRNG_METHOD on Linux, which unconditionally includes <sys/random.h>.
> +However, this header was only introduced in glibc 2.25.
> +
> +Fix this by using __has_include to check for the header's existence.
> +If it's missing, undefine HAVE_GETRANDOM so Git falls back to its
> +/dev/urandom implementation.
> +
> +Upstream: N/A (Buildroot specific fallback)

  I don't think this should be configured Buildroot specific. Nobody says that 
git shouldn't work on older platforms.

  Except of course that we're still on autotools and upstream is moving to 
meson. And in fact, meson.build already has:

elif csprng_backend in ['auto', 'getrandom'] and 
compiler.has_header_symbol('sys/random.h', 'getrandom', required: csprng_backend 
== 'getrandom')

so I think the proper fix is not to patch anything, but rather to switch to 
meson as the build system.

  Regards,
  Arnout

> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
> + compat/posix.h | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/compat/posix.h b/compat/posix.h
> +index faaae1b..1632221 100644
> +--- a/compat/posix.h
> ++++ b/compat/posix.h
> +@@ -155,6 +155,13 @@
> + #ifdef HAVE_ARC4RANDOM_LIBBSD
> + #include <bsd/stdlib.h>
> + #endif
> ++#if defined(HAVE_GETRANDOM) && defined(__linux__)
> ++# if defined(__has_include)
> ++#  if !__has_include(<sys/random.h>)
> ++#   undef HAVE_GETRANDOM
> ++#  endif
> ++# endif
> ++#endif
> + #ifdef HAVE_GETRANDOM
> + #include <sys/random.h>
> + #endif
> +--
> +2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
