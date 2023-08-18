Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A34DEE4998
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 21:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B87D940519;
	Fri, 18 Aug 2023 21:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B87D940519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkspcQ9uaKFk; Fri, 18 Aug 2023 21:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEBA1405C6;
	Fri, 18 Aug 2023 21:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEBA1405C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 267441BF3C2
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C9E542074
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C9E542074
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obmaU52OLAFB for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 21:58:19 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B7C84206B
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 21:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7C84206B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1EA4E2003DA;
 Fri, 18 Aug 2023 23:58:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Aug 2023 23:58:08 +0200
Date: Fri, 18 Aug 2023 23:58:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jamie Gibbons <jamie.gibbons@microchip.com>
Message-ID: <20230818215808.GC1134940@scaer>
References: <20230818104301.403429-1-jamie.gibbons@microchip.com>
 <20230818104301.403429-2-jamie.gibbons@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818104301.403429-2-jamie.gibbons@microchip.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692395896;
 bh=hlBRear0SxV4IpE4YCLMEilnPpuwmX0aJJmKE4IpWkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sJXXGNMnIwBjOZvbd+V4fI7a7YFehv84USsqVO5nMtxd3xQ9y8Eof3qeS93bDzoTN
 NK58NIAnM64lr5eM1UbRhAR20BMlItMvPCLaDvtYTbstlu8Huky7itqM8Yt0prveDL
 9AyX4foAG6FwR/EAH2kZD+vR7+4MtQ5TM0pTcUuxDuZlNOMWlgPgx2IcUYL5wm1GaM
 HmUVCGdNMCPgcJsB8+YXyYVSkaE+wBiS1j4sLVAtPDQdEb7Sfeafg7NnIBZZgRY7R9
 AMiqbFI3j7ErIhum/i8CStW7PfiJCMwSbaaeyMsxnEBnI0aFlEQ4i6PMlC8kfRw7kh
 fxuhPSCAxMzVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sJXXGNMn
Subject: Re: [Buildroot] [PATCH v3 1/3] arch/Config.in.riscv: update
 instruction set ext
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jamie, All,

On 2023-08-18 11:42 +0100, Jamie Gibbons via buildroot spake thusly:
> Allow a RISC-V G core to support C and V. Copy custom RVC and RVV
> instructions from RISC-V custom core to RISC-V general core.

After discussing with Thomas on IRC, I applied the patch, but using the
construct I proposed in my review of v2.

This diverges substantially from what your patch does, but I think it is
a bit nicer, if at lesat because the user has direct feedback of what
sets generic implies (and that yes, we mean the same thing as the riscv
spec says).

Applied to next, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> ---
> 
> v1 -> v2 changes:
> - copied RVC and RVV kconfigs to both riscv_g and riscv_custom
> 
> v2 -> v3 changes:
> - removed duplicate menu options
> 
>  arch/Config.in.riscv | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
> index 3dfbb4165f..df8499c7a0 100644
> --- a/arch/Config.in.riscv
> +++ b/arch/Config.in.riscv
> @@ -41,10 +41,10 @@ config BR2_riscv_custom
>  
>  endchoice
>  
> -if BR2_riscv_custom
> -
>  comment "Instruction Set Extensions"
>  
> +if BR2_riscv_custom
> +
>  config BR2_RISCV_ISA_CUSTOM_RVM
>  	bool "Integer Multiplication and Division (M)"
>  	select BR2_RISCV_ISA_RVM
> @@ -62,6 +62,8 @@ config BR2_RISCV_ISA_CUSTOM_RVD
>  	depends on BR2_RISCV_ISA_RVF
>  	select BR2_RISCV_ISA_RVD
>  
> +endif
> +
>  config BR2_RISCV_ISA_CUSTOM_RVC
>  	bool "Compressed Instructions (C)"
>  	select BR2_RISCV_ISA_RVC
> @@ -71,8 +73,6 @@ config BR2_RISCV_ISA_CUSTOM_RVV
>  	select BR2_RISCV_ISA_RVV
>  	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
>  
> -endif
> -
>  choice
>  	prompt "Target Architecture Size"
>  	default BR2_RISCV_64
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
