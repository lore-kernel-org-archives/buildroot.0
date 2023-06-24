Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C4EEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 19:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B620841746;
	Sat, 24 Jun 2023 19:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B620841746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ignhA6ji1uXb; Sat, 24 Jun 2023 19:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8C94169E;
	Sat, 24 Jun 2023 19:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8C94169E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0891C1BF3D9
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 19:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C2181FFE
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 19:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C2181FFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPySmOSjuUmz for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 19:27:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 972CC81FFB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 972CC81FFB
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 19:27:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8A858B0053E;
 Sat, 24 Jun 2023 21:27:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 21:27:42 +0200
Date: Sat, 24 Jun 2023 21:27:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20230624192742.GZ24952@scaer>
References: <20230622164951.1213353-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622164951.1213353-1-festevam@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687634865;
 bh=lsYKE7TXdi1WBEBXBrBWdv+hQfk5h9nhcckWkVWijfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egKlapjPfvy5CESUsVnuwtS29VPzpRIexTHoF7coZU6gr/thrCxd6VVyCN5KwSXuf
 SrxlpJZ6Cfqiznv5N9jsRHkGU1shVVvk+wHvnT7GDwdDjWibxMQC4wvxbe3OekEM8X
 aD/6W8laUvVX9HHVnySr7XjmChM7sI9Toroe4o0sMwfeXY0CArylJJ5B1DIJSrSlN3
 zuppQR9GXiNYIx6VokFWQ7s+0rF4Ls33iqsJ0YIHL1DlaKwZqWujRqgIWn5dlFjHHL
 vq4a2TUWQzdZpXHl/FeMS3eW+Ikuny5EKJcVL6+lWmtwi5t+tNaHwIYahNklaxy2Ny
 Eh3o3czQymUXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=egKlapjP
Subject: Re: [Buildroot] [PATCH] configs/mx53loco: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabio, All,

On 2023-06-22 13:49 -0300, Fabio Estevam spake thusly:
> Select  BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
> build error:
> 
> include/image.h:1383:12: fatal error: openssl/evp.h: No such file or directory
> 
> Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/mx53loco_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
> index 212a032d84aa..d03c7d0916e8 100644
> --- a/configs/mx53loco_defconfig
> +++ b/configs/mx53loco_defconfig
> @@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
>  BR2_TARGET_UBOOT_FORMAT_IMX=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -- 
> 2.34.1
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
