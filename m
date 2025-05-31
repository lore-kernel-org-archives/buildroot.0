Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9633FC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F7E829DB;
	Sat, 31 May 2025 17:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x__EVgMnzYLR; Sat, 31 May 2025 17:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F1D682330
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F1D682330;
	Sat, 31 May 2025 17:51:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A920127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6D54064A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yORQCAlMeajs for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C744B4078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C744B4078E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C744B4078E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:51:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 970ED5FFC0;
 Sat, 31 May 2025 19:51:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 31 May 2025 19:51:16 +0200
MIME-Version: 1.0
Date: Sat, 31 May 2025 19:51:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250530213904.465152-1-kadambini.nema@gmail.com>
References: <20250530213904.465152-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <cea20a41becb294414d838a5a98e3817@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748713877;
 bh=0M+WfdnirlH/9pl/vmlL0Q8+GokGeCTdWkxkEHpzrqk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gC3h8z1gPwQMP5xakHptYbmD5oH0Gu3nPpUj4DSAekVA1DIWgtH5fr5wfd5SWx4zL
 B+Yw/6SFboIAzthkDKE6snYT4P/omP0ffrRDNsfcjbhE+eR04TpAVP6J+JZMU/nRHV
 VkKQ+i0lLDoSjVpRbhqf1jpPFYgLDQx53+s2rV/xMCl2pcxRD3sCkoV79Wdx7iXkU9
 lOHqE7DhTjnLMNp6VKLtqzbcgWSkJNtj2uMKbX0dfe3jAtIFWPzAz0l/GvUiG7XDrm
 H2rxuKiG9j8zYRtpYCQWt4WWMO9Tot/NdGi3RzPzBCXNyQt53yPzoSIHnUpSyA/L/X
 dXPh2PYVI796g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gC3h8z1g
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kadambini,

Thanks for the patch.

On 30/05/2025 23:39, Kadambini Nema wrote:
> Fixes the following security issues:
> - CVE-2025-5025:
>   No QUIC certificate pinning with wolfSSL.
>   https://curl.se/docs/CVE-2025-5025.html
> 
> - CVE-2025-4947:
>   QUIC certificate check skip with wolfSSL.
>   https://curl.se/docs/CVE-2025-4947.html
> 
> Changelog:
> https://curl.se/ch/8.14.0.html
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash 
> b/package/libcurl/libcurl.hash
> index 388ddc1418..1e908536a1 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.13.0.tar.xz.asc
> +# https://curl.se/download/curl-8.14.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  
> 4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025  
> curl-8.13.0.tar.xz
> +sha256  
> b3634cfc538c72c9c6ca794ef4c73d7fdbd171e8dee2db837d83a5e45231002a  
> curl-8.14.0.tar.xz
>  sha256  
> e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  
> COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 5f04fc381f..2a9239148e 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBCURL_VERSION = 8.13.0
> +LIBCURL_VERSION = 8.14.0

The bump to this version introduces two build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1846597109

For reference, the last 8.13 version was building fine:
https://gitlab.com/jolivain/buildroot/-/pipelines/1803732760

This seems related to curl starting to use accept4(),
introduced in:
https://github.com/curl/curl/commit/3d02872be7cfe6dcdef4b02321b47af19e1ce268

The autotools configure script is supposed to detect the presence
of the accept4() function and use it only if detected. The build
failure is because there is a use of 
-Werror=implicit-function-declaration.
Also the failing toolchains are both noMMU.

>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> --
> 2.25.1

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
