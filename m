Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443C2C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C473D400CE;
	Sat, 23 Dec 2023 12:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C473D400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEN5vOTbqD-A; Sat, 23 Dec 2023 12:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A453940482;
	Sat, 23 Dec 2023 12:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A453940482
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1081BF2A9
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 12:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53475835E4
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 12:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53475835E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6l4fZFSdmNuK for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 12:50:23 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BB1B83478
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 12:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BB1B83478
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A8C73B00585;
 Sat, 23 Dec 2023 13:50:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 13:50:19 +0100
Date: Sat, 23 Dec 2023 13:50:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <ZYbXi0G4-Kvt8nik@landeda>
References: <20231222205321.5588-1-petr.vorel@gmail.com>
 <20231222205321.5588-2-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222205321.5588-2-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703335821;
 bh=+nhEXeNLivgTZLzFUSrJ6GD1yPQoNXExO9W0MTdwNPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bSABbMKp6ymVdJiCld/vG197hSLBHX/EosHxCGsSY8l8zAESDOSFxcEUAcK6PXafn
 r7bZ8gsLwOAuQX/V5sreQcrjKnKtr2zDOamIiStLJP4/Q/uzvJaKuCQH/xb969f+K+
 YTahiqyk2bJBrRuLf2BDxwmuGONmp/YB4H0VqU83IVkblOXRQofeeQn09eGI5nCrby
 CYTHw3bTc6dkUpv0i1pVs/nBsqvxa5IWNj/s6AEmzeeT4mwdR118t4/fyxsFvobX7K
 KQrHGi1NHACkRFK1j020hb8h+vBDanoG7WM39ncF6XggC5GxA3NYHD6tMHuvmMT3A5
 q9GP488metGFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bSABbMKp
Subject: Re: [Buildroot] [PATCH 2/2] iputils/iputils: remove note about fork
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

Petr, All,

On 2023-12-22 21:53 +0100, Petr Vorel spake thusly:
> After 10 years we don't have to justify the fork.

I slightly reworded that, as the fork is now the real upstream.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/iputils/iputils.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 783ed9a0e7..a8f93488bb 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -4,13 +4,6 @@
>  #
>  ################################################################################
>  
> -# The original upstream was forked to the github repository in 2014 to
> -# pull fixes from other distribution and centralize the changes after
> -# the upstream seemed to have gone dormant.  The fork contains the
> -# latest changes including musl support, removing a libsysfs dependency
> -# and IPv6 updates.
> -# http://www.spinics.net/lists/netdev/msg279881.html
> -
>  IPUTILS_VERSION = 20231222
>  IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
>  IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
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
