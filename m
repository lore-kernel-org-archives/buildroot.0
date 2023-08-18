Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8547DEE4992
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 21:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 155F040519;
	Fri, 18 Aug 2023 21:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 155F040519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ousTuhKNkS7h; Fri, 18 Aug 2023 21:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22647419B3;
	Fri, 18 Aug 2023 21:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22647419B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8380E1BF3C2
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BDF960736
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BDF960736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vgMq0q6jumj for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 21:58:35 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D0DE60692
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 21:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0DE60692
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 28C5F2003DD;
 Fri, 18 Aug 2023 23:58:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Aug 2023 23:58:25 +0200
Date: Fri, 18 Aug 2023 23:58:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jamie Gibbons <jamie.gibbons@microchip.com>
Message-ID: <20230818215825.GD1134940@scaer>
References: <20230818104301.403429-1-jamie.gibbons@microchip.com>
 <20230818104301.403429-3-jamie.gibbons@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818104301.403429-3-jamie.gibbons@microchip.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692395913;
 bh=Bx3eJsus+tLaqxspV7Dj+1HM7YSQqqYZxQe77igS12Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NtNRJzAgGrWSSJ27c07yzIKf4CqkZR0SgOcLIXGON4M7H7ityhKZ3lo6O0oOcE4gJ
 l4XZbSbrF8nsDBzFNnoALXXnrL+BBI19H0YIv8yA1Yq7/v1/73GmRsZTEscrgkgweM
 I9Pi87/HRuMXT/zzlIPRwVpMbEUEgvQRbVUZouYJxVfrfvnz0Oq5c+H0hwT8WAfBPQ
 wxFUJTEq8NI3736Dq2Mh2g6v/SNqWnmTGLF/jGPqvKOYQvCpSmTq2oUVCOOj4ozaOJ
 +Zr/VDI4eLJXx6RdIzQHT3iU0vtCjkg+w696WB0MlrxVfzhCv8enfzg3nq+QE/qTSO
 v+cIRCUC0Wo3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NtNRJzAg
Subject: Re: [Buildroot] [PATCH v3 2/3]
 configs/microchip_mpfs_icicle_defconfig: update instruction sets
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

On 2023-08-18 11:43 +0100, Jamie Gibbons via buildroot spake thusly:
> Update the instruction sets for MPFS icicle kit to mirror the
> configuration update, i.e. It is now classed as a RISC-V G core with
> support for C, IMAFDC.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/microchip_mpfs_icicle_defconfig | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
> index b2568cae6a..a3b3093982 100644
> --- a/configs/microchip_mpfs_icicle_defconfig
> +++ b/configs/microchip_mpfs_icicle_defconfig
> @@ -1,8 +1,5 @@
>  BR2_riscv=y
> -BR2_riscv_custom=y
> -BR2_RISCV_ISA_CUSTOM_RVM=y
> -BR2_RISCV_ISA_CUSTOM_RVF=y
> -BR2_RISCV_ISA_CUSTOM_RVD=y
> +BR2_riscv_g=y
>  BR2_RISCV_ISA_CUSTOM_RVC=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
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
