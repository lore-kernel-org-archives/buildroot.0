Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8809DC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5720C40743;
	Thu, 12 Jun 2025 20:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ny6JoPQVEvO8; Thu, 12 Jun 2025 20:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 783EA4073F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 783EA4073F;
	Thu, 12 Jun 2025 20:26:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5B72183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D800A4091E
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqAQyn_vQV5u for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:26:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1988408D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1988408D4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1988408D4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BC321C0E09; Thu, 12 Jun 2025 22:26:33 +0200 (CEST)
Message-ID: <674b0ce7-8079-49ad-94ec-c26798bf39fd@rnout.be>
Date: Thu, 12 Jun 2025 22:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20250530213904.465152-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250530213904.465152-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749759993; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Kq9pUvo+JAEGEmydZDbEkpbXtnz3EEpkFK2fGXsoGWM=;
 b=FQXmTz3aC0DN7YJVsS3Tnez3DkrdgVf+Z9HtVccbIkE7gUBhY2I8xP55lQK4U83Hnjlo/x
 TQymHFdbxhpSXmMlvlU1MT1ozIXlCT7UCwxVxwz5R/DDY8HKfLxRf7J0a1mdi6WuCgY1ji
 2gzuKPSk8SKldeH8EfJSKlOBQu/cXkp02V8yRQWSjiK6XobCznGN2W3JH++zLrF45g9rhn
 q3k5qb+Ja7W88UySxLKv8tP4E7hHbSXWk8grR+srxCbvyrZoXHVpHOWozF30qQzxhBwacg
 Gyzw0kBL/Dapp7l9J6D+OQxKjVtZWmmviQiNoxPESg3GMhAUg/XtdQgZpCsV4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FQXmTz3a
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 8.14.0
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



On 30/05/2025 23:39, Kadambini Nema wrote:
> Fixes the following security issues:
> - CVE-2025-5025:
>    No QUIC certificate pinning with wolfSSL.
>    https://curl.se/docs/CVE-2025-5025.html
> 
> - CVE-2025-4947:
>    QUIC certificate check skip with wolfSSL.
>    https://curl.se/docs/CVE-2025-4947.html
> 
> Changelog:
> https://curl.se/ch/8.14.0.html
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libcurl/libcurl.hash | 4 ++--
>   package/libcurl/libcurl.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 388ddc1418..1e908536a1 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.13.0.tar.xz.asc
> +# https://curl.se/download/curl-8.14.0.tar.xz.asc
>   # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025  curl-8.13.0.tar.xz
> +sha256  b3634cfc538c72c9c6ca794ef4c73d7fdbd171e8dee2db837d83a5e45231002a  curl-8.14.0.tar.xz
>   sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 5f04fc381f..2a9239148e 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCURL_VERSION = 8.13.0
> +LIBCURL_VERSION = 8.14.0
>   LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>   LIBCURL_SITE = https://curl.se/download
>   LIBCURL_DEPENDENCIES = host-pkgconf \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
