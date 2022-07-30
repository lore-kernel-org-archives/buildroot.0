Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B58C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 14:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CB5860E11;
	Sat, 30 Jul 2022 14:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB5860E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3XrBtx3Jt74; Sat, 30 Jul 2022 14:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B148606C6;
	Sat, 30 Jul 2022 14:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B148606C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0D991BF3D2
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 14:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C10F83F73
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 14:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C10F83F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HKEeOKT7GJbu for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 14:48:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC4683F5F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CC4683F5F
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 14:48:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1F2CC6012A;
 Sat, 30 Jul 2022 16:48:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 16:48:11 +0200
Date: Sat, 30 Jul 2022 16:48:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20220730144811.GU3168@scaer>
References: <20220729220748.3737915-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729220748.3737915-1-shorne@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659192494;
 bh=nMHmFenhwRF8+4gncz5w0yP88dFF2I99bMbpatuSb9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CrnQi8m6VlW18e6Uh4jfnggxbCLSPMZJcQP2gVJthySpUO/SDpy+auMyP5EE27BaK
 49VtMIYVUEXRLYBx/B7IxFrsSQP95yu0raz+MyeqyB6u2q22emOQVCeEAk1b7CQ9oR
 G9Rw7ghGHswVo76a8X3bP/u0PRCaW58dSOIXpda6cczALtZgoLN4qsVux7oH/8Ncya
 SRk8QNmXitOft77z6E02naZbLqdT4y5cFO3mwX0OcVP/cmq7psMcgcqVmPQA3zao3U
 PbKJu3VCQOx2DW+0GYrPlQ8D2EJ+5K3iCNw/AqQkmELh6awIKd2QPH1CF6QE4+a3Mn
 n3Cn2NBgW7sNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CrnQi8m6
Subject: Re: [Buildroot] [PATCH] package/gdb: Enable OpenRISC GDB support
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

Stafford, All,

On 2022-07-30 07:07 +0900, Stafford Horne spake thusly:
> The OpenRiSC gdb port has supported native debugging since version 8.3
> and remote debugging since before that.  So it is now safe to enabled
> this.
> 
> This patch removes the conditions blocking gdb from being built on or1k
> architecture builds.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdb/Config.in      | 1 -
>  package/gdb/Config.in.host | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index a39837fe71..2708834ee2 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
>  	default y
>  	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
>  	depends on !BR2_microblaze
> -	depends on !BR2_or1k
>  
>  comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
>  	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 43af64a1ed..dfa9f8c384 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
>  	default y
>  	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
>  	depends on !BR2_microblaze
> -	depends on !BR2_or1k
>  
>  comment "Host GDB Options"
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
> -- 
> 2.37.1
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
