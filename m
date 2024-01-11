Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF77C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 19:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA5E342527;
	Thu, 11 Jan 2024 19:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5E342527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GL-DWG03tgHT; Thu, 11 Jan 2024 19:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8394255F;
	Thu, 11 Jan 2024 19:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8394255F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92B0C1BF3A0
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 785EB83F65
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 785EB83F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzJEUwjgDKyx for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 19:25:12 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43DC683F60
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 19:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43DC683F60
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 59839B005A2;
 Thu, 11 Jan 2024 20:25:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 20:25:06 +0100
Date: Thu, 11 Jan 2024 20:25:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaBAkrKFxYOGICrd@landeda>
References: <20240111182225.2420602-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111182225.2420602-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705001109;
 bh=rzIklpklTZjxM26yKMCWdqIsMIWSji56V+q/27yR5u0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mxzgDdH85id4OUXYDCXlDeC5Odlewjf3y6rbt7POTji0ilZyhOhAIZcligGGc17vy
 hx91jqVAZE8NVJVYuFdlHC2BeYxT5+toxLeTg+K4UGnzak4DpNP68eUeATkurzNzY1
 9NfEKkCRSmfna2wiQQIPK53AUGHNga7pCwjw5US1VXzqsHBhwEz/AEcNqgjq4VwExR
 F8Cyly1rlxR8pGAv5F+SUaJvJnUuj8KLKg15WfvbASW/22nsGEtgI9dQeBbentYy6R
 s2qTQRIUsNTcWTcZ3ub69wbNr3VT79bPw+PXGRpNzNihYzJ3rdnJ5xqdON1bIzJNi9
 rj73pxw99XWdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mxzgDdH8
Subject: Re: [Buildroot] [PATCH 1/1] package/criu: disable i386
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-11 19:22 +0100, Fabrice Fontaine spake thusly:
> Building for i386 raises the following build failure since the additon
> of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:
> 
> Makefile:23: *** "The architecture i386 isn't supported".  Stop.
> 
> Setting ARCH=x86 won't work either as it results in the following build
> failure:
> 
> compel/arch/x86/plugins/std/memcpy.S: Assembler messages:
> compel/arch/x86/plugins/std/memcpy.S:20: Error: bad register name `%rdi'
> compel/arch/x86/plugins/std/memcpy.S:21: Error: bad register name `%rdx'
> compel/arch/x86/plugins/std/memcpy.S:22: Error: `shrq' is only supported in 64-bit mode
> compel/arch/x86/plugins/std/memcpy.S:24: Error: `movsq' is only supported in 64-bit mode
> compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S: Assembler messages:
> compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S:13: Error: bad register name `%rcx'
> compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S:19: Error: bad register name `%rax'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/94cc463762b57efacf743d107a8dda7660a995a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/criu/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/criu/Config.in b/package/criu/Config.in
> index ff3bf30229..b3bb830768 100644
> --- a/package/criu/Config.in
> +++ b/package/criu/Config.in
> @@ -6,7 +6,6 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
>  	default y if BR2_ARM_CPU_ARMV7M
>  	default y if BR2_ARM_CPU_ARMV8A
>  	default y if BR2_aarch64
> -	default y if BR2_i386
>  	default y if BR2_mips
>  	default y if BR2_x86_64
>  	default y if BR2_powerpc64le # Only support powerpc64 with LE
> -- 
> 2.43.0
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
