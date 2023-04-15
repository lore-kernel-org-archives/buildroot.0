Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACDC7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 11:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9A3A40B52;
	Sat, 15 Apr 2023 11:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9A3A40B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-WlLO48_3yN; Sat, 15 Apr 2023 11:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1732240C15;
	Sat, 15 Apr 2023 11:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1732240C15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02D241C3FC3
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1A838458E
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A838458E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HCvPKj0mRFQ for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 11:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814BC8458A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 814BC8458A
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 11:52:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C4A5A5FFAD;
 Sat, 15 Apr 2023 13:52:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 13:52:52 +0200
Date: Sat, 15 Apr 2023 13:52:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230415115252.GF2819@scaer>
References: <20230414213504.14634-1-ps.report@gmx.net>
 <20230414213504.14634-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414213504.14634-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681559575;
 bh=R/m4XGlv4QSS0pmcoedPCMfYCqlv01tbTD72h4Wedas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VCun6efe7cZJglq+CDNUcm7gGKyb+l8xWvx0ZLgZfiz8xfHvVY/YYjqbzJ0pkerhV
 RUqDiOyaXznyWSI6SYVWATU2NIcUVhKXKe6V3sULmFbL3Fr430WTPaeiql6b3CCPYy
 x9wcrhjvr3m70wrnd4AuhhFa64FoAtP+AgZDa0Q1FND+I27T1IZAw9rt0l8pUFnWTr
 7YGEfojtQd/IyBHssD3mpvwWlZ0gynqUM52C4xat7UmoIBOh9HxZ7SvQvtG5RNXdnR
 uaDcrorA+30CdDgJbZ4JzCwwS2yFBgVhN+pW6c6vRzIpoxaqBlac/erZm74Q4CUhJa
 /BqUR7/EP9bhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VCun6efe
Subject: Re: [Buildroot] [PATCH v1 2/3] package/nginx: bump version to 1.24.0
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-04-14 23:35 +0200, Peter Seiderer spake thusly:
> For details see [1].
> 
> [1] https://nginx.org/en/CHANGES-1.24
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nginx/nginx.hash | 2 +-
>  package/nginx/nginx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
> index 06454c5e32..24bc588d85 100644
> --- a/package/nginx/nginx.hash
> +++ b/package/nginx/nginx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  9ebb333a9e82b952acd3e2b4aeb1d4ff6406f72491bab6cd9fe69f0dea737f31  nginx-1.22.1.tar.gz
> +sha256  77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d  nginx-1.24.0.tar.gz
>  # License files, locally calculated
>  sha256  ececed0b0e7243a4766cbc62b26df4bd3513b41de3a07425da1679c836d06320  LICENSE
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 185bcd576f..7bd2173b48 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NGINX_VERSION = 1.22.1
> +NGINX_VERSION = 1.24.0
>  NGINX_SITE = https://nginx.org/download
>  NGINX_LICENSE = BSD-2-Clause
>  NGINX_LICENSE_FILES = LICENSE
> -- 
> 2.40.0
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
