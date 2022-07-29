Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5658C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EA8B4055F;
	Fri, 29 Jul 2022 21:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EA8B4055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzy9jPEWe2sw; Fri, 29 Jul 2022 21:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44A0140524;
	Fri, 29 Jul 2022 21:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44A0140524
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFC61BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56F4C60A6C
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F4C60A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUo-bVRk8qAM for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:18:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2332A60655
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2332A60655
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:18:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A68C113F8AC;
 Fri, 29 Jul 2022 23:17:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 23:17:55 +0200
Date: Fri, 29 Jul 2022 23:17:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220729211755.GE1554632@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729000904.1295295-2-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659129484;
 bh=EFIwLBnB9p/xxTG2AwcSJ2bJF9DTOD3Ha6NhuJODkv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skbu7+dvud5D2yXWevCA2tJC+Dxl+BGhUYioz82KfSjZa0qwQSyxMEJX/UMhROrBw
 8odDthwtYtXIZ4ssQxHYc7DzFBPxT4MBzrsU5QqweVINaHr081l8+NRm/BHvH7pgIX
 Ag8ysgM+yxWKf6TA5yPwjefGFOGuoSbSxGp3C89M0Gn81iAnkMFx10274HX/nOTsb8
 8Qf8oGJY4UqrWbYhzMnGZwP6rI7KF6xyQI4doOoJf3KLph++mc40vxCAS+DJiUBgoS
 Jev5Js79A9ddeUXNfmVYAsjvxQCAO01xZ5+0eZfNpg0Fh7d57w0u7VPizwVCbiRBMW
 jrUP69yKlBvoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=skbu7+dv
Subject: Re: [Buildroot] [PATCH 1/9] arch/powerpc: Hide SPE ABI behind CPU
 type
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joel, All,

On 2022-07-29 09:38 +0930, Joel Stanley spake thusly:
> The target ABI option for PowerPC is for selecting the SPE ABI, not the
> ELF ABI that users may expect.
> 
> Hide it when there is no option available to make it clearer when
> browsing menuconfig.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/Config.in.powerpc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index c48edd3bb40c..ef0e85fec680 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -143,6 +143,7 @@ config BR2_powerpc_power8
>  	select BR2_POWERPC_CPU_HAS_VSX
>  endchoice
>  
> +if BR2_POWERPC_CPU_HAS_SPE
>  choice
>  	prompt "Target ABI"
>  	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
> @@ -157,6 +158,7 @@ config BR2_powerpc_SPE
>  	bool "SPE"
>  	depends on BR2_POWERPC_CPU_HAS_SPE
>  endchoice
> +endif

I don't understand this change. Currently we have:

 1. If BR2_POWERPC_CPU_HAS_SPE=y:
    BR2_powerpc_CLASSIC is not selectable
    BR2_powerpc_SPE is the only choice

  2. if BR2_POWERPC_CPU_HAS_SPE is not set:
    BR2_powerpc_CLASSIC is the only choice
    BR2_powerpc_SPE is not selectable

This means that the choice was really nt a choice, because the value of
HAS_SPE implies which option is settable or not.

With your change, the BR2_powerpc_CLASSIC will never be selectable at
all, and BR2_powerpc_SPE will be forcibly set when
BR2_POWERPC_CPU_HAS_SPE=y

So we should just drop the choice altogether, and use the SPE ABI when
the CPu has SPE.

Is that what your patch was aiming at?

Regards,
Yann E. MORIN.

>  config BR2_POWERPC_SOFT_FLOAT
>  	bool "Use soft-float"
> -- 
> 2.35.1
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
