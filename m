Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F28EC77B71
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 11:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43B6C40592;
	Sat, 15 Apr 2023 11:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43B6C40592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYb6wMZHHpFA; Sat, 15 Apr 2023 11:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21D4441748;
	Sat, 15 Apr 2023 11:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21D4441748
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3DE1C3FE1
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2240D610E2
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2240D610E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83j3kYupXGTS for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 11:52:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2C6E61087
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2C6E61087
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 11:52:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CB6FD5FFAE;
 Sat, 15 Apr 2023 13:52:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 13:52:37 +0200
Date: Sat, 15 Apr 2023 13:52:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230415115237.GE2819@scaer>
References: <20230414213504.14634-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414213504.14634-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681559561;
 bh=CsCGzamc1HWm6M893ivV9T2CbDW/cGVac4BDacoagt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X8TvITtEuvqwxZNiMqU6W45zBAwhtB6ID8lRcfnkGmikEpZl2ypxUvck4Sh1eGhN+
 m3C08jLh1e/DHt4ED4EZ7EJr2g3WbsC1qg44Obp4Af3Cgc1U3INzUOmooTQBwIWqrM
 bBQFPR3yaGHsmzcHYHlTnbvbkEOq3ZkAKs8UWwT2DdqJQu1AcfYHU0MrOnKHdwxgDV
 X0VnpY8eGi3ntycG8Ah7voOEKfkAjcW+EJjUo7HWBdPvUtmC7ftotL89LAMmZX3xa2
 BIVemLGrpFvlAxaHCLV+DEvqXwtbf5HnV6JtknCAcwSvdLDkSjh0GEfwoEgR1wj7TY
 +dKnYmmil12Bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X8TvITtE
Subject: Re: [Buildroot] [PATCH v1 1/3] package/nginx: change project and
 download URL to https
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
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nginx/Config.in | 2 +-
>  package/nginx/nginx.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nginx/Config.in b/package/nginx/Config.in
> index 406a1c861a..8e888baa1c 100644
> --- a/package/nginx/Config.in
> +++ b/package/nginx/Config.in
> @@ -6,7 +6,7 @@ menuconfig BR2_PACKAGE_NGINX
>  	  nginx is an HTTP and reverse proxy server, as well as a mail
>  	  proxy server.
>  
> -	  http://nginx.org/
> +	  https://nginx.org/
>  
>  if BR2_PACKAGE_NGINX
>  
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 10cc95d90e..185bcd576f 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  NGINX_VERSION = 1.22.1
> -NGINX_SITE = http://nginx.org/download
> +NGINX_SITE = https://nginx.org/download
>  NGINX_LICENSE = BSD-2-Clause
>  NGINX_LICENSE_FILES = LICENSE
>  NGINX_CPE_ID_VENDOR = f5
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
