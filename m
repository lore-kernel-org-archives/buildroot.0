Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04002C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 16:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 888E7405C7;
	Sun, 16 Oct 2022 16:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888E7405C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7PdVjCJe1G39; Sun, 16 Oct 2022 16:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B27D40445;
	Sun, 16 Oct 2022 16:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B27D40445
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E43E1BF471
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07EC840933
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EC840933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZfmC1OctMqU for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 16:35:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B814940929
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B814940929
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 16:35:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0D71C13F8DA;
 Sun, 16 Oct 2022 18:35:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Oct 2022 18:35:43 +0200
Date: Sun, 16 Oct 2022 18:35:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221016163543.GM2503@scaer>
References: <20221015005611.4054933-1-james.hilliard1@gmail.com>
 <20221016162654.GL2503@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221016162654.GL2503@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665938146;
 bh=0YeRQbvwqyzjuuHr4KoDN01MzbL7S7Be10JT+XUar8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WWAdzGFfeesRZnbN5s9R1dSIOz/jHHEBaqD5SCGRp4lLSHLVrzI8oAk86tkignOHK
 csfQdJNKUJb2s2pVpsnvPHU3fPcc/zewZYvmYAkCOfdckRxllBRCuAf3okp39AhNKE
 H1w5hmkHa8Yp005H6h95NfQBcNyznEbbuoa+4OErzhA5eZuXapss5fxX5ynKTGIDDm
 yRNOyjAVoFLk+e3zotv1L9tjTf5YGcxP8LkdvxyphAfdQccZsGr6Tgm4a9G/p7XN6d
 SAjJVV2iyzief1ttW8MF24fTrROW8qBemOqTXpMfs03Va1DOPsJagWYooN2GEeAtuU
 m/EXZy5NsFHsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WWAdzGFf
Subject: Re: [Buildroot] [PATCH 1/1] package/Makefile.in: set .NOTPARALLEL
 for MAKE1
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

On 2022-10-16 18:26 +0200, Yann E. MORIN spake thusly:
> James, All,
> 
> On 2022-10-14 18:56 -0600, James Hilliard spake thusly:
> > Make 4.4 introduces a shuffle mode which randomizes prerequisites
> > in order to better flush out issues with parallel builds, as this
> > mode randomizes prerequisites even when using -j1 builds we must
> > instead explicitely mark parallel incompatible builds using the
> > .NOTPARALLEL special target which disables prerequisites
> > randomization when running in shuffle mode.
> > 
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/Makefile.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/Makefile.in b/package/Makefile.in
> > index 43d214bcbe..2327849a1f 100644
> > --- a/package/Makefile.in
> > +++ b/package/Makefile.in
> > @@ -17,7 +17,7 @@ else
> >  PARALLEL_JOBS := $(BR2_JLEVEL)
> >  endif
> >  
> > -MAKE1 := $(HOSTMAKE) -j1
> > +MAKE1 := $(HOSTMAKE) --eval .NOTPARALLEL:
> 
> Packages that do not build in parallel do not because their rules assume
> the ordering is kept.
> 
> I don't see how replacing -j1 with --eval .NOTPARALLEL: would cause the
> ordering to be restored.

Ah, it's in the --shuffle documentation, not in the .NOTPARALLEL one (and
reading .texi source is not my main ability).

Still, I think my proposal is better, because it is more explicit.

Regards,
Yann E. MORIN.

> Instead, I would have expected we do something like:
> 
>     # Only build one job at a time, *and* to not randomise goals and
>     # prerequisites ordering in make 4.4+
>     MAKE1 := $(HOSTMAKE) -j1 $(if $(findstring --shuffle,$(MAKEFLAGS)),--shuffle=none)
> 
> Regards,
> Yann E. MORIN.
> 
> >  override MAKE = $(HOSTMAKE) \
> >  	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
> >  
> > -- 
> > 2.34.1
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
