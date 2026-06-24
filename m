Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDE5CDE000
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 21:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCBDA60E44;
	Wed, 24 Jun 2026 21:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCYRqCUylJIx; Wed, 24 Jun 2026 21:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F8660D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782337398;
	bh=F1sxmEyg43/EZfbGG2cdsAp4JbtHqnjRap/y+OZ3Eco=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=WuTcgRLN9ChOuTXD/pJZhFZ3wly/0LMGprJ471s/0U8m98nRS7jCQRH365tPEJYNv
	 RwV+Wu+cs+V8zAuIw+trJz0HVLIN7cGMPGvQZb+xURGeQazgjTtU5GpQh9kPwG5YkD
	 QN0myOqBtZvMNQdrgVwMpsDXvX1iVkffmgfqHGSS4FAia3PotyIWDQ9Rs0BSPIx8Uj
	 HWJb2M25MmjIMnu0hmvggwIVe6nEw3d2B5Hn41zD9OzbhFW/wVaxtt80CnjDWxBW77
	 Dr3+1hhPezrqEzpDknK0iigGMniEsuUwqnVL42UqRUoVs+UryFavzrLTzlbff16X97
	 muG1BJz4XsW7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1F8660D9F;
	Wed, 24 Jun 2026 21:43:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4633265
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 21:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B207660D9F
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 21:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Osn-5DhgBzEF for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 21:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53AD4606C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53AD4606C6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53AD4606C6
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 21:43:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEV3C-1wNhG14B90-00DSlO; Wed, 24
 Jun 2026 23:43:12 +0200
Message-ID: <931a0342-1142-4e6d-8583-f7815d96dfcd@gmx.de>
Date: Wed, 24 Jun 2026 23:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260624184057.1060045-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260624184057.1060045-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:KKfFSxy6y/a2QHFgnw4mGw51tAgQWEbzl3Ixpw8R5BbasGjiEhK
 i7O9g5mRBGDdmAlU/yMknu5CXiaPdp7P6aPVqUWLVKJgkGUCOHSuPeyAuMzI4Go9BYSMjEG
 NpdvpD0L2/2lmdhg3I3KpdEIb6U6FleFCu0u2dpu++5xRSIMjhy78/V1WHvV3tTBQQ1gl7B
 u+P/kPMckultyK6olil4A==
UI-OutboundReport: notjunk:1;M01:P0:3+tApCMjkz8=;AlRzcQF1Gu2cl1Ar3jaE0iCFFso
 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
 WqXC8HuBE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782337392; x=1782942192; i=fiona.klute@gmx.de;
 bh=ko7zXb/7A5UPleEGpnzvlSbArFPl+2tPnM81/E2GCbY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rK1eLK8KLYWKyJHWOqBktXrCJIemsDdVaeBcSWYo5D1k/Nv8TjOWWyr7WHQyUOaz
 RSTNZowaynuAZUba2O5lsu978fc/hj6CMgwQPEF3tFI4fA38JMPON6xqWkMl2I2qB
 9GpGFUZvAqxDONBQW0JkVSNk0hpGiqKliIwJTQHsNbJ6OUHT+5LmTTdbV/ah6HxrP
 zvx8w4cqASxXe9OF/2TAjGcajbzKRzyLjFbsIoF4IpJ6bAqN5mVkRGY2/6IPdHw3y
 s1ejc9nGv2vrJVspXE81KeQ6AQP0yjtvXzRODoFM9kcVYn6haKYpsItpuZ/b7zHTK
 lpwcPTB6jGprDcXUcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rK1eLK8K
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 8.21.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 24.06.26 um 20:40 schrieb Bernd Kuhls:
> https://curl.se/ch/8.21.0.html
> https://daniel.haxx.se/blog/2026/06/24/curl-8-21-0/
> 
> Fixes the following CVEs:
> 
> Severity Medium
>      CVE-2026-8925: SASL double-free
>      CVE-2026-8927: env-set cross-proxy Digest auth state leak
>      CVE-2026-9079: stale proxy password leak
>      CVE-2026-11856: cross-origin Digest auth state leak
> 
> Severity Low
>      CVE-2026-8286: wrong STARTTLS connection reuse
>      CVE-2026-8458: wrong reuse for different services
>      CVE-2026-8924: trailing dot domain super cookie
>      CVE-2026-8926: password leak with netrc and user in URL
>      CVE-2026-8932: incomplete mTLS config matching in conn reuse
>      CVE-2026-9080: UAF after pause in socket callback
>      CVE-2026-9545: exposing HTTP/3 early data
>      CVE-2026-9546: sending old referer
>      CVE-2026-9547: SSH improper host validation
>      CVE-2026-10536: HTTP/2 stream-dependency tree UAF
>      CVE-2026-11352: QUIC zero-length UDP datagrams busy-loop
>      CVE-2026-11564: Native CA trust persist
>      CVE-2026-11586: WS Auto-PONG memory exhaustion
>      CVE-2026-12064: proto-default skips SSH verification
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/a016b2837c83c8c12dfd612efb0bb723190f7e18
> 
>   package/libcurl/libcurl.hash | 6 +++---
>   package/libcurl/libcurl.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 549527b1af..e2393bf2f4 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,7 +1,7 @@
> -# From https://github.com/curl/curl/releases/tag/curl-8_20_0
> +# From https://github.com/curl/curl/releases/tag/curl-8_21_0
>   # after checking pgp signature:
> -# https://curl.se/download/curl-8.20.0.tar.xz.asc
> +# https://curl.se/download/curl-8.21.0.tar.xz.asc
>   # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896  curl-8.20.0.tar.xz
> +sha256  aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6  curl-8.21.0.tar.xz
>   # Locally computed
>   sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 94d7ec677c..219ce9f712 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCURL_VERSION = 8.20.0
> +LIBCURL_VERSION = 8.21.0
>   LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>   LIBCURL_SITE = https://curl.se/download
>   LIBCURL_DEPENDENCIES = host-pkgconf \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
