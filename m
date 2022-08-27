Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E0FC0502A
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 13:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F90F410B7;
	Sat, 27 Aug 2022 13:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F90F410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLP6wNYxVmt9; Sat, 27 Aug 2022 13:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2572140988;
	Sat, 27 Aug 2022 13:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2572140988
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFD8D1BF588
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B97040541
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B97040541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3lgLA1-QDvA for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 13:45:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8608D40286
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8608D40286
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:45:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 965AD78050E;
 Sat, 27 Aug 2022 15:45:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 15:45:25 +0200
Date: Sat, 27 Aug 2022 15:45:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220827134525.GA37358@scaer>
References: <20220824122601.266641-1-aperez@igalia.com>
 <20220827134203.GY37358@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827134203.GY37358@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661607927;
 bh=r63pq5gOgtvhh4og5b4NJLQbOVcKp5jSeosTEh3GTe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHoYldpK6MERWYlJ05z/0pUPy8JU/q72z5GZBVZJ5vyRRIaZJvMKvM+NXveG3+985
 PCAiDmC3lnViMjBWPq7t8qi4jhhU10GoQexUzuqDxTrfDNTgaMG7i15KA1NupBDI1Y
 4knS5mo2yGg9wjX5ntjawtuT8AvIimyWq58NoSXYlELbWvzsRhgV3PX6Ene4+GiKK0
 0ExMIMJT2AswZRTDS6FERIOWGpeN96RNQmB0/a09VJgcvv/FgdzS/V6nWxoLFY60cq
 JmDSpWSgFf+qVx+1UlgF1qncIx7rKxKU9v8W55F+yud6kOuUmwnLLAv/6lwczp50nH
 HswUQUs/RP+7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iHoYldpK
Subject: Re: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.12.1
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

Adrian, All,

On 2022-08-27 15:42 +0200, Yann E. MORIN spake thusly:
> On 2022-08-24 15:26 +0300, Adrian Perez de Castro spake thusly:
> > This minor release fixes a crash. Release notes:
> > 
> >   https://wpewebkit.org/release/wpebackend-fdo-1.12.1.html
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> Applied to next, thanks.

Damn, sent too fast..

I meant to ask:  the release notes state "in certain situations". Is
that occuring often enough to warrant being applied on master?

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> > ---
> >  package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
> >  package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
> > index 06289900b0..49c60fce0f 100644
> > --- a/package/wpebackend-fdo/wpebackend-fdo.hash
> > +++ b/package/wpebackend-fdo/wpebackend-fdo.hash
> > @@ -1,7 +1,7 @@
> > -# From https://wpewebkit.org/releases/wpebackend-fdo-1.12.0.tar.xz.sums
> > -md5  c43b34a4b4933bcd80068ae5776ee346  wpebackend-fdo-1.12.0.tar.xz
> > -sha1  e2576d564bd6d9a86737a4cd31dd5827ebc00fdf  wpebackend-fdo-1.12.0.tar.xz
> > -sha256  6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac  wpebackend-fdo-1.12.0.tar.xz
> > +# From https://wpewebkit.org/releases/wpebackend-fdo-1.12.1.tar.xz.sums
> > +md5  494f4a5b2bd89dacef37b69534b2e1ce  wpebackend-fdo-1.12.1.tar.xz
> > +sha1  72a85e4615e085926f7ad8fc8414f9c6a878ef28  wpebackend-fdo-1.12.1.tar.xz
> > +sha256  45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629  wpebackend-fdo-1.12.1.tar.xz
> >  
> >  # Hashes for license files:
> >  sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
> > diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
> > index 5fe9c5397f..2e2bdee94e 100644
> > --- a/package/wpebackend-fdo/wpebackend-fdo.mk
> > +++ b/package/wpebackend-fdo/wpebackend-fdo.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -WPEBACKEND_FDO_VERSION = 1.12.0
> > +WPEBACKEND_FDO_VERSION = 1.12.1
> >  WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
> >  WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
> >  WPEBACKEND_FDO_INSTALL_STAGING = YES
> > -- 
> > 2.37.2
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
