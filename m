Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ADEC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A32404D0;
	Sat,  9 Dec 2023 20:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A32404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPi2kcdPEevV; Sat,  9 Dec 2023 20:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EB94042F;
	Sat,  9 Dec 2023 20:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0EB94042F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4602A1BF681
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28BE140140
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28BE140140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zG2yEDDcVhL for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 20:57:15 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1A9140138
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 20:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1A9140138
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E106813F880;
 Sat,  9 Dec 2023 21:57:09 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Dec 2023 21:57:09 +0100
Date: Sat, 9 Dec 2023 21:57:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZXTUpaUf7AAB2l3T@landeda>
References: <20231209200916.250950-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231209200916.250950-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702155432;
 bh=FcaqMIGdgikHcRJE5XqhyXTbGmujMKX2+rFYSpE9P2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6ZSv1L2vwKmNFGNeMPe29bruQouIWRGTtVQft6MM+Szyg24l1b8Un5FL6batv8tl
 8Y3n/602cZoYKZljBRgMANm00/59yraNLc3W9LWouDXMhP+8ivRaczPIJ8pP/RiGCZ
 bqOLQEtFnU70ethyuprYs3Mtp7bcsc1hl/wjb4p0K4LwB5WHZY6/HDuCQwVbTLAna2
 QUxvJ4nwkalj4j+3bgPYIb6KIKGblCSlospL8T1NpzPO6M48XMZmf37fVgBOq3cUf9
 8ZM5Eg7EXziwDGXb2IFIXIOEWnHTh91EyHIFp5okXZuVOBrKjzkZH2ucRASZPbmnWB
 cziIvuUfuZISA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X6ZSv1L2
Subject: Re: [Buildroot] [PATCH] package/libcurl: security bump to version
 8.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-12-09 21:09 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> - CVE-2023-46218: cookie mixed case PSL bypass
> 
>   This flaw allows a malicious HTTP server to set "super cookies" in curl
>   that are then passed back to more origins than what is otherwise allowed
>   or possible.  This allows a site to set cookies that then would get sent
>   to different and unrelated sites and domains.
> 
>   https://curl.se/docs/CVE-2023-46218.html
> 
> - CVE-2023-46219: HSTS long file name clears contents
> 
>   When saving HSTS data to an excessively long file name, curl could end up
>   removing all contents, making subsequent requests using that file unaware
>   of the HSTS status they should otherwise use.
> 
>   https://curl.se/docs/CVE-2023-46219.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index ecd5d63909..d5c20d29d3 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.4.0.tar.xz.asc
> +# https://curl.se/download/curl-8.5.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d70dec63e2e6336f2a82d  curl-8.4.0.tar.xz
> +sha256  42ab8db9e20d8290a3b633e7fbb3cec15db34df65fd1015ef8ac1e4723750eeb  curl-8.5.0.tar.xz
>  sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 2c87821a48..3ecc587a52 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.4.0
> +LIBCURL_VERSION = 8.5.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
