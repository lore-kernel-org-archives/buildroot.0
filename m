Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDBDC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A088D41943;
	Sat,  1 Oct 2022 16:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A088D41943
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WvTQgwgy2ayH; Sat,  1 Oct 2022 16:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6369541932;
	Sat,  1 Oct 2022 16:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6369541932
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E83AE1BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C397940BA8
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C397940BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxL2MsRGUALB for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:31:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD27F408E8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD27F408E8
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:31:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 28E0E780368;
 Sat,  1 Oct 2022 18:31:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:31:05 +0200
Date: Sat, 1 Oct 2022 18:31:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221001163105.GF30794@scaer>
References: <20221001065609.28815-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221001065609.28815-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664641869;
 bh=5gp8XFvgCiwXmdWmHsn+3b2X9BVZvWgPeSO8Cou6u1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RPUY0VFIlu/f3VFqxPH4pwBZ91/VKbUg/N6WuoEfQfnTnyeTq4Ir8KLu3thNkb84D
 JPGAOzl8kptjvZ3e3JQXyNyttYZaqYf+lYz/FGErHxYuOdlOM60MgIi8Ez0tvbFv3W
 +sH10mqvKskDEcx0qtWHdILYxQpT7eHsyEMd1+/kC/HFv0upXYPlg9R7hRGzXHYKPK
 LOvyumlLA1GCkJwsmpo6r+jx4K5x8ywAfFHZba0xEbwPpuXjj/P7yn50NdPA+kTiQG
 HPkjol/8o0bKTiFBk2Ng2PV7n+i7iuzHKxnNtpiDiZ3vVW0sP7gY9SC+EMU/zrWSsw
 /z1vgPhG3LbWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RPUY0VFI
Subject: Re: [Buildroot] [PATCH] package/rauc: bump to version 1.8
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2022-10-01 08:56 +0200, Heiko Thiery spake thusly:
> See the release notes[1] on GitHub for changes.
> 
> [1] https://github.com/rauc/rauc/releases/tag/v1.8
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rauc/rauc.hash | 5 ++---
>  package/rauc/rauc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> index 677d358158..8351d0266e 100644
> --- a/package/rauc/rauc.hash
> +++ b/package/rauc/rauc.hash
> @@ -1,4 +1,3 @@
> -# Locally calculated, after verifying against
> -# https://github.com/rauc/rauc/releases/download/v1.6/rauc-1.6.tar.xz.asc
> -sha256  8b7d37cc1eb57df4f03de3c943dd7be290b78d47be28881e8b1f070e1d5e55df  rauc-1.7.tar.xz
> +# Locally calculated
> +sha256  d233247c1763b1c56c851d0adef2094b7aa2fcd72decf524a8ac0419188e0978  rauc-1.8.tar.xz
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index 8bfb0b79ba..0c81a6cc35 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RAUC_VERSION = 1.7
> +RAUC_VERSION = 1.8
>  RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>  RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>  RAUC_LICENSE = LGPL-2.1
> -- 
> 2.20.1
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
