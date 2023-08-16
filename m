Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDE2C001E0
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 15:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D3B142015;
	Wed, 16 Aug 2023 15:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D3B142015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoCPm-Ny3WXU; Wed, 16 Aug 2023 15:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E9E042059;
	Wed, 16 Aug 2023 15:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E9E042059
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83BF41BF3AD
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 15:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C08D60EFB
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 15:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C08D60EFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxXRTaIpkpvl for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 15:04:53 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8AAC60DF4
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 15:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8AAC60DF4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1e73:3be7:eb1a:9d05])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5C3515FFAB;
 Wed, 16 Aug 2023 17:04:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Aug 2023 17:04:42 +0200
Date: Wed, 16 Aug 2023 17:04:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230816150442.GB1340200@scaer>
References: <20230816092439.570839-1-jamie.gibbons@microchip.com>
 <20230816092439.570839-2-jamie.gibbons@microchip.com>
 <20230816142316.76d45449@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816142316.76d45449@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692198289;
 bh=YpFb3NN2hGqEZMseJKjo/Cn2n2Vhd0ZKDbDadV7Evh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SvH492A097whOmeJscA0+vJLoQmZXXNgyyjwebEUmJNl9BUQnUXfeR0abOGqJoxKP
 yhmWcJNrZZurUvAwOFEL8REYkiFa2YD9FlaR5yyTxeSoOPU7jQrxIT0WrTWhW410rg
 LIsln+zBxF1T8RiH3PVtOwYmyHcOSrbxxLRLdh9f752zK49CcQ/d6Ze5SdkL6Rip62
 ZQld8ccNySSN/b5yX9yHwn8CP3kEQitojLm6u09v+DNvhuRp0lQ1SQDSj9MjRJSZ1M
 q/1swEOvUsgherJn+tj67B84X7MqzYRvnDAP+95RZrniJ1IU9+KCkdyUBhdegYOZHl
 GndDqijanA7QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SvH492A0
Subject: Re: [Buildroot] [PATCH v2 1/3] arch/Config.in.riscv: update
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
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, buildroot@buildroot.org,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jamie, Thomas, All,

On 2023-08-16 14:23 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Wed, 16 Aug 2023 10:24:37 +0100
> Jamie Gibbons <jamie.gibbons@microchip.com> wrote:
> 
> > Allow a RISC-V G core to support C and V. Copy custom RVC and RVV
> > instructions from RISC-V custom core to RISC-V general core.
> > 
> > v1 -> v2 changes:
> > - copied RVC and RVV kconfigs to both riscv_g and riscv_custom
> 
> We don't want to *copy* them. We want to make them available in both
> cases.

Basically, I think what Thomas expects is something like:

    diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
    index 3dfbb4165f..997f7a631d 100644
    --- a/arch/Config.in.riscv
    +++ b/arch/Config.in.riscv
    @@ -1,26 +1,5 @@
     # RISC-V CPU ISA extensions.
     
    -config BR2_RISCV_ISA_RVI
    -    bool
    -
    -config BR2_RISCV_ISA_RVM
    -    bool
    -
    -config BR2_RISCV_ISA_RVA
    -    bool
    -
    -config BR2_RISCV_ISA_RVF
    -    bool
    -
    -config BR2_RISCV_ISA_RVD
    -    bool
    -
    -config BR2_RISCV_ISA_RVC
    -    bool
    -
    -config BR2_RISCV_ISA_RVV
    -    bool
    -
     choice
         prompt "Target Architecture Variant"
         default BR2_riscv_g
    @@ -41,38 +20,28 @@ config BR2_riscv_custom

     endchoice

    -if BR2_riscv_custom
    -
     comment "Instruction Set Extensions"

    -config BR2_RISCV_ISA_CUSTOM_RVM
    +config BR2_RISCV_ISA_RVM
         bool "Integer Multiplication and Division (M)"
    -    select BR2_RISCV_ISA_RVM

    -config BR2_RISCV_ISA_CUSTOM_RVA
    +config BR2_RISCV_ISA_RVA
         bool "Atomic Instructions (A)"
    -    select BR2_RISCV_ISA_RVA

    -config BR2_RISCV_ISA_CUSTOM_RVF
    +config BR2_RISCV_ISA_RVF
         bool "Single-precision Floating-point (F)"
    -    select BR2_RISCV_ISA_RVF

    -config BR2_RISCV_ISA_CUSTOM_RVD
    +config BR2_RISCV_ISA_RVD
         bool "Double-precision Floating-point (D)"
         depends on BR2_RISCV_ISA_RVF
    -    select BR2_RISCV_ISA_RVD

    -config BR2_RISCV_ISA_CUSTOM_RVC
    +config BR2_RISCV_ISA_RVC
         bool "Compressed Instructions (C)"
    -    select BR2_RISCV_ISA_RVC

    -config BR2_RISCV_ISA_CUSTOM_RVV
    +config BR2_RISCV_ISA_RVV
         bool "Vector Instructions (V)"
    -    select BR2_RISCV_ISA_RVV
         select BR2_ARCH_NEEDS_GCC_AT_LEAST_12

    -endif
    -
     choice
         prompt "Target Architecture Size"
         default BR2_RISCV_64

Thomas?

Regards,
Yann E. MORIN.

> Also, the changelog shouldn't go inside the commit log but...
> 
> > 
> > Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> > ---
> 
> ... here, after the "---" line.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
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
