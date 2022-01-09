Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA850C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D69E4059C;
	Sun,  9 Jan 2022 20:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fof7Wm4ulc22; Sun,  9 Jan 2022 20:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00512405AF;
	Sun,  9 Jan 2022 20:14:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DBB71BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 232F04058C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wB9CtDRrcHQG for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:14:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7E8940103
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:14:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C57B15FFA6;
 Sun,  9 Jan 2022 21:14:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641759248;
 bh=mFTo/g6XfW7m3q3yhqxDQkTvchmudqkUnKvo/R3cVZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dLxtwHpyNOADzCHyDYYMGYz9QyLJlUfBfkDoxWTZDLvPBZnrDqm80u+Mjx6ELiQvv
 3JL1boSRbjKhqeH20SwtmCvt0KLELY4BFpENVA3xmWZJJU2o0nxVLpgEBCEtMxZEQW
 YKljMmcnmd/vgZWSeYMxAQTUrbCuXjTNA1IADAnEAYlrSSlMK63Jc2qKrfH7w8sA3k
 6HjQqVqsTnTe3QvewtGGMyD4pXooZ7eA8qhqFiEDr6nZ2i/oL7ELrGRuFLdnxcSOpd
 fJ0FzkhqXF1DnPWhVraK6mVr62bBkXrbJUKurldSD3zdket3muX+/EoSF4vENNSfX/
 mmCDDmZdguZgQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 21:14:02 +0100
Date: Sun, 9 Jan 2022 21:14:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220109201402.GE1477939@scaer>
References: <20220109171511.3293111-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109171511.3293111-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/mesa3d: Gallium VC4 driver depends
 on NEON
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
 Romain Naour <romain.naour@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-01-09 18:15 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Since version 21.3.0 of mesa3d, the generic broadcom infrastructure
> (which is called v3d but is used also for VC4) started using NEON
> instructions. This leads to assembler failures when VC4 is built for
> 32-bit ARM without NEON:
> 
> FAILED: src/broadcom/libv3d_neon.a.p/common_v3d_tiling.c.o
> /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-linux-gcc [...] -c ../src/broadcom/common/v3d_tiling.c
> /tmp/ccAvufNv.s: Assembler messages:
> /tmp/ccAvufNv.s:602: Error: selected processor does not support `vldm r7,{q0,q1,q2,q3}' in ARM mode
> [...]
> /tmp/ccAvufNv.s:686: Error: selected processor does not support `vstm r7,{q0,q1,q2,q3}' in ARM mode
> 
> Let the VC4 driver depend on NEON for 32-bit ARM. Aarch64 always has
> NEON, so no condition is needed there.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2b5/2b531f7aa4506ee31a7252c87a2e401fffab9dfb/
> http://autobuild.buildroot.net/results/6f9/6f9e7c864808dc0fafbca7c8984651fe92edbaf2/
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 34b0352056..37c4f8078e 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -274,7 +274,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>  	bool "Gallium vc4 driver"
> -	depends on BR2_arm || BR2_aarch64
> +	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>  	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> -- 
> 2.31.1
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
