Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BA3CD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C22C40B5D;
	Sat, 30 May 2026 12:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id was1TDJONuqC; Sat, 30 May 2026 12:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB7540A2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145776;
	bh=w90qN327Dr0rx6QxcxW2nUfEgIE3yd0cmwURDMEzsY8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P2uC79qtG8OS/AEc379xywYEvFWheHNtPatYymkfxsfMC4cmm+BZkSMcOyvM0OETe
	 jA4uo4TqF9WlFV5YiFBU0tXbhgdWjGzlT1EdlSJFZ66Pl15ShoE6TvVoEGESeVdK79
	 YISWkcDFmuEHZxDs0TlpE4Wg/gqxfAKP5dR/CAEHaXvjFbgukhd40aWH5l3Gmz+AXG
	 YSLCXA1yh/ZzTyHBfNgn8/M7alb9Fc9CQRAySwcWbWWuaiyoG0rHrvLXGuh8Q7R8bF
	 TuAoOYpMbBITtputGmT5YmGISnsGpS/JCEt1Bgyz0H+PRYqxdpN56qi/Pj73m16Qu/
	 N0r18sztW9lIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BB7540A2B;
	Sat, 30 May 2026 12:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5536D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAE51835C4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTNd9-KVEMDW for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8574849F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8574849F4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8574849F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3A40B97C721; Sat, 30 May 2026 12:46:16 +0200 (CEST)
Message-ID: <baa0e607-953e-47f9-a240-13b09db919ad@rnout.be>
Date: Sat, 30 May 2026 12:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260418215536.55054-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260418215536.55054-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780137976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=xNGTU5k+/xP9P7Nd1X8lcsZXtnlcQXlG0u8FY30s3SA=;
 b=dSKqhGXzcpdJtsPU0/D0Koa25Nrn+muFF9eg4WaUmug4m4w68EQnrasV9shbf0MkyID64e
 gbKah1hHWcFc3Jo78C9Kte1KaNJwCtQszGsmgECybSZhySIPkLBGvMHpKl4SkO/PzQrHKe
 O/ksX3xB1f7EedV3VJfUwHC0gcX6fdXcQ+D7BWu+JzEElm7ZmP3CofG3P6geXnaEWOERsk
 MhVvqJTtDH9aozPTF9gk0aPbDZj3Hyw9kowsjNTXTpgFtzMux32i+VdM0zYldwfeoj7sYy
 FVyBAYVYdGKsqlzU8SVyOuOCWFoeOQKAsjnAxma4C7W0nDEKh8VQlpjPyvdYWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dSKqhGXz
Subject: Re: [Buildroot] [PATCH 1/3] package/jemalloc: fix build on
 m68k/uClibc
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



On 18/04/2026 23:55, Bernd Kuhls wrote:
> include/jemalloc/internal/jemalloc_internal_inlines_a.h:16:32: error:
>   implicit declaration of function 'sched_getcpu'; did you mean
>   'SYS_getcpu'? [-Wimplicit-function-declaration]
>     16 |         return (malloc_cpuid_t)sched_getcpu();
> 
> Added -D_GNU_SOURCE to CFLAGS because
> 
>    extern int sched_getcpu
> 
> is wrapped with __USE_GNU:
> https://github.com/wbx-github/uclibc-ng/blob/v1.0.57/libc/sysdeps/linux/common/bits/sched.h#L80C1-L80C17
> 
> Fixes:
> https://autobuild.buildroot.net/results/57c/57c68aad9abcce7621fbff52081da041485e8830/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied 1 and 2 to master and 3 to next.

  Regards,
  ARnout

> ---
>   package/jemalloc/jemalloc.mk | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
> index bd8a2d7654..0c46f65029 100644
> --- a/package/jemalloc/jemalloc.mk
> +++ b/package/jemalloc/jemalloc.mk
> @@ -12,11 +12,15 @@ JEMALLOC_LICENSE_FILES = COPYING
>   JEMALLOC_INSTALL_STAGING = YES
>   JEMALLOC_CONFIG_SCRIPTS = jemalloc-config
>   
> +JEMALLOC_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
> +
>   # gcc bug internal compiler error: in merge_overlapping_regs, at
>   # regrename.c:304. This bug is fixed since gcc 6.
>   ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
> -JEMALLOC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
> +JEMALLOC_CFLAGS += -O0
>   endif
>   
> +JEMALLOC_CONF_ENV += CFLAGS="$(JEMALLOC_CFLAGS)"
> +
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
