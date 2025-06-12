Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ED4C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B38A83A98;
	Thu, 12 Jun 2025 20:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4Fmyvt4PvjN; Thu, 12 Jun 2025 20:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3043483A71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3043483A71;
	Thu, 12 Jun 2025 20:26:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 323451BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23FC24071D
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e10hwyGYqELH for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:26:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EF7740719
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF7740719
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EF7740719
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:26:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D3951C0E09; Thu, 12 Jun 2025 22:26:24 +0200 (CEST)
Message-ID: <ef3e3f1e-a0e8-43a3-999a-421cd4b55d09@rnout.be>
Date: Thu, 12 Jun 2025 22:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20250501090919.74916-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250501090919.74916-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749759984; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZnuhHcxEsPrFnLVRWcSHLu+MqSormhX8vBl471Nn+aw=;
 b=IZQyC5AsYK3hcxKX+s5bENDtLj8hw9lkgf6t7eFyek5EbUqMRrOjE6RMilT/MdIE1dfkCh
 mx7cB5H8Ya+l8dDqS2sT/aQNSMg1ciWnJTO8+I2IKjdPerM0mM1grDtei19YX3O+2ok4sa
 pAkPkZ9U2HtD18dX8h+3WtLHw29EImbDqc8tbSaXPF90YRcimxwf1Zu7WK3Pcxt0YCdG+m
 pEkt0P9t+mqxPHm4+xNiXAeoCEcYhcjC9Pw/fK+Av7Eip1ZuXljlaJd/XHCGXfJBQCXDEP
 vRIUnLOWcgT2dPnjBJrFK+cVXjr7H7ql+66xUnlpgrplkhbypp2XQNAuVYScwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IZQyC5As
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.13.0
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



On 01/05/2025 11:09, Kadambini Nema wrote:
> Changelog:
> https://curl.se/ch/8.13.0.html
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
> index 4a26a1774d..388ddc1418 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.12.1.tar.xz.asc
> +# https://curl.se/download/curl-8.13.0.tar.xz.asc
>   # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202  curl-8.12.1.tar.xz
> +sha256  4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025  curl-8.13.0.tar.xz
>   sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 2066ba0388..5f04fc381f 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCURL_VERSION = 8.12.1
> +LIBCURL_VERSION = 8.13.0
>   LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>   LIBCURL_SITE = https://curl.se/download
>   LIBCURL_DEPENDENCIES = host-pkgconf \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
