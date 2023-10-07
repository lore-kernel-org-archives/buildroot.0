Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36B5E95A62
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 19:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80EA283D1D;
	Sat,  7 Oct 2023 19:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80EA283D1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PS97rm67wwp8; Sat,  7 Oct 2023 19:34:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C4A983D21;
	Sat,  7 Oct 2023 19:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C4A983D21
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0DE01BF400
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 19:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B73116105C
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 19:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B73116105C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwI-NitxEU0X for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 19:34:29 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B46E61055
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 19:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B46E61055
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:77f1:3f6b:b690:928a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0F6ECB00548;
 Sat,  7 Oct 2023 21:34:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Oct 2023 21:34:22 +0200
Date: Sat, 7 Oct 2023 21:34:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231007193422.GG2552@scaer>
References: <20231007181926.7115-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231007181926.7115-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696707266;
 bh=W08RsJ9dxmTZ00CHh2036MuqBcr7XHD07u6zICyWh1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WbCqf1YRMWgmc4dv45ajEw34HfYnyAxG6hBCnWETyWJkUQ9d3Cm471qxunorIBlWt
 qtjl8qVWsYUnhM7xDgWkUYobHNoziGTpZQhii+iyTOLOb9qZXDnyMdBp/pV39CHp8L
 68DU8aIkz78asBlmfU0ARo4PyucBtCCbSxnlE/wEKGu+08tEpVdT79NZuEwI5wN6u0
 VPNDx5PC47njEnVba88/BMTlJ8mLRFzoZ6KV1Tx1HuXVW1sk+D3yIWXQ6m0aGJhehn
 6UmomleMpSU5ObaP7f2BGzceGa3rYeJ2szQhiTTER/zp1++Hpinv0ifPHB2Noudqic
 ge9FPMogJ+AiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WbCqf1YR
Subject: Re: [Buildroot] [PATCH v2 1/2] package/refpolicy/Config.in: force
 merged usr when selecting upstream
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-07 20:19 +0200, Adam Duskett spake thusly:
> Refpolicy contexts expect a merged /usr file system. In fact, there
> are no references to /bin, /sbin, /lib, or /lib64 at all. However, if a user
> wants to go through the trouble of creating a policy that works with a
> non-merged system, they should be free to do so. As such, only select
> BR2_ROOTFS_MERGED_USR if using BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/refpolicy/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> index 0e72b895df..f1f3c7e64d 100644
> --- a/package/refpolicy/Config.in
> +++ b/package/refpolicy/Config.in
> @@ -36,6 +36,7 @@ choice
>  
>  config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
>  	bool "Upstream version"
> +	select BR2_ROOTFS_MERGED_USR

I wonder if this is the proper solution. I would have rather though of
depends on rather than select:

    diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
    index 0e72b895df..c413c1244b 100644
    --- a/package/refpolicy/Config.in
    +++ b/package/refpolicy/Config.in
    @@ -32,13 +32,17 @@ if BR2_PACKAGE_REFPOLICY

     choice
     	prompt "Refpolicy version"
     -	default BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
     +	default BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION if BR2_ROOTFS_MERGED_USR

     config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
     	bool "Upstream version"
    +	depends on BR2_ROOTFS_MERGED_USR
     	help
     	  Use the refpolicy as provided by Buildroot.

    +comment "upstream refpolicy needs merged /usr"
    +	depends on !BR2_ROOTFS_MERGED_USR
    +
     config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
     	bool "Custom git repository"
     	help

Not totally sure either ways, though...

Regards,
Yann E. MORIN.

>  	help
>  	  Use the refpolicy as provided by Buildroot.
>  
> -- 
> 2.41.0
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
