Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180E4C46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 08:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94F7141797;
	Mon, 18 Sep 2023 08:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F7141797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qoM1ig5rVOMt; Mon, 18 Sep 2023 08:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EBC24176F;
	Mon, 18 Sep 2023 08:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EBC24176F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4BE1BF5A8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 08:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 392A94176F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 08:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 392A94176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kU29APhvy1tl for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 08:26:42 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44F5C4174F
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 08:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44F5C4174F
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BCBB6352BDF9; Mon, 18 Sep 2023 10:26:39 +0200 (CEST)
Date: Mon, 18 Sep 2023 10:26:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZQgJv2wMCnd6ka0G@waldemar-brodkorb.de>
References: <ZQWdfMVaJjzX9Vfr@waldemar-brodkorb.de>
 <20230917130023.GX415981@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917130023.GX415981@scaer>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1695025599; bh=loZqmJ2C/Bq5mYky24I5H2UKMW32KOGsoMOrNq+810w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v8F9i4eTuiTz53fAwZUy4EyW/y3IS/6X+U7GZiqJ/xhr6IryOQ72dJ+N1BpmV/oIL
 2cX2JQAr7Gq4WxgmpMgiuFZT+1guY1P+8pi50dmkMF3BkScOnSPmRt/zWuEb9WG3nC
 Y/mnLxesQnEnxkDfz9Cw/oNztUumVS/YwoJ6z7RTWh9fj0bwqXNzB+fks1g7E2T9pt
 DU1VvTAc8tP3Aw5F9ORzmJI36VXIoV94nBjTQij3Hi/NLhugKE7rZJd2jET63ziJdx
 7kTNd9Lv/kb+JCPl3eNvqqgaMDWhWsW457xrr/Zw8/v0SekvG++TLzqwUTxtGMKtqU
 jJKBDa1kl4yJg==
Subject: Re: [Buildroot] [PATCH v2] ruby: bump version to 3.2.2
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

Hi Yann, all,
Yann E. MORIN wrote,

> On 2023-09-16 14:20 +0200, Waldemar Brodkorb spake thusly:
> > Patch is included upstream, remove it and the reference in .checkpackageignore.
> > 
> > Host build fails with following error:
> > <internal:/buildroot/output/build/host-ruby-3.2.2/lib/rubygems/core_ext/kernel_require.rb>:85:in `require': cannot load such file -- psych (LoadError)
> >         from <internal:/buildroot/output/build/host-ruby-3.2.2/lib/rubygems/core_ext/kernel_require.rb>:85:in `require'
> >         from /buildroot/output/build/host-ruby-3.2.2/lib/rubygems.rb:608:in `load_yaml'
> > 
> > Fix it by adding host-libyaml to the dependencies.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  v1->v2:
> >   - add failure for host build requested by Thomas Petazzoni
> 
> You provided the error message of the build failure for the host
> variant, that explains why host-ruby needs host-libyaml. That's good.
> 
> But I think that what Thomas requested, was to explain why the target
> variant does not need libyaml.
> 
> Indeed, it looks like host-ruby is trying to load libyaml at runtime,
> so it would kinda make sense that it would also need it at runtime on
> the target...
> 
> A runtime test would be great, and would resolve the issue. ;-)

I sent an runtime test to the list. THis show that ruby should work
without libyaml on the target. It is an optional feature for the
target.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
