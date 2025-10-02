Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8998DCAC5B8
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 21:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44BA4406B3;
	Thu,  2 Oct 2025 21:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgvLI3JgeeyB; Thu,  2 Oct 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7798F4072E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7798F4072E;
	Thu,  2 Oct 2025 21:02:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 968521CE
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8849781140
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 21:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srlJIkbbocYU for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 21:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34FC581137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34FC581137
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34FC581137
 for <buildroot@busybox.net>; Thu,  2 Oct 2025 21:02:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1404120039E;
 Thu,  2 Oct 2025 23:02:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Oct 2025 23:02:36 +0200
MIME-Version: 1.0
Date: Thu, 02 Oct 2025 23:02:36 +0200
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@busybox.net
In-Reply-To: <20251002123824.1033833-1-mf@go-sys.de>
References: <20251002123824.1033833-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c7179ed3690909048ed87e8255c8c6e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759438958;
 bh=n60m8xkHLcnXpvbdfHupYH0f3ZMiaGQEFr1YBJuSVX4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FNgA2upco4/8PYsuNLmoPF52Sd44KaNrmN4W8x6NvV+1OIUHfwHqhjvRmfhK+grbm
 bXm8ynW8a7paRWCkCB6DzwV1MVbhcte5PL+r0fjZk17CEm6TdTkC0jPoA8L0fZHmKS
 VWF4kJabSGgp04lWy5lcR2HTlsuvP9kxZ9o7zuiWYp9PjHXDdoe3lT34uWFa9n6vMQ
 O0E72jnF41OREXEcQI8+UVMoRgO95PqBB/j8NNu5pWhmm2NSpaq693JxwyQmG1Nnkl
 0olmWHr7ZDOP48DfYsZR9km6wTnP9K4736UVI9jje9GXMT5sEmMAQz/ib1gAaa8ZRp
 cHw+rYhqdWQxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FNgA2upc
Subject: Re: [Buildroot] [PATCH] package/libopenssl: bump version to 3.5.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

Thanks for the patch!

I applied an identical patch sent a few hours before yours:
https://patchwork.ozlabs.org/project/buildroot/patch/20251002065706.1010793-1-francois.perrad@gadz.org/

On 02/10/2025 14:38, Michael Fischer wrote:
> Security patch release.
> The most severe CVE fixed in this release is Moderate.
> 
> This release incorporates the following bug fixes and mitigations:
> 
> - Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap.
>   (CVE-2025-9230)
> 
> - Fix Timing side-channel in SM2 algorithm on 64 bit ARM.
>   (CVE-2025-9231)
> 
> - Fix Out-of-bounds read in HTTP client no_proxy handling.
>   (CVE-2025-9232)
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash 
> b/package/libopenssl/libopenssl.hash
> index d0ca45d303..e78b664aa5 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From 
> https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
> -sha256  
> c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  
> openssl-3.5.3.tar.gz
> +# From 
> https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
> +sha256  
> 967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  
> openssl-3.5.4.tar.gz
> 
>  # License files
>  sha256  
> 7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  
> LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk 
> b/package/libopenssl/libopenssl.mk
> index b892d4e236..2f844fd44a 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBOPENSSL_VERSION = 3.5.3
> +LIBOPENSSL_VERSION = 3.5.4
>  LIBOPENSSL_SITE = 
> https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
