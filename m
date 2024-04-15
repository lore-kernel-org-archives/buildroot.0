Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E926C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 20:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2459401B0;
	Mon, 15 Apr 2024 20:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78JJg-3KaGA0; Mon, 15 Apr 2024 20:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 887D5404DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 887D5404DA;
	Mon, 15 Apr 2024 20:20:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC38E1BF379
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 20:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7BFB406BC
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 20:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiGlzh25qu4v for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 20:20:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9F2F406A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F2F406A5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9F2F406A5
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 20:20:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 39BBF13F838;
 Mon, 15 Apr 2024 22:20:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Apr 2024 22:20:16 +0200
Date: Mon, 15 Apr 2024 22:20:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <Zh2MAAqe0NEOa3bO@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-2-thomas.perale@mind.be>
 <Zh1ZciOBMxTssprd@landeda>
 <f2bc83c5-c77c-4360-b1da-73aa069bb08d@essensium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2bc83c5-c77c-4360-b1da-73aa069bb08d@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713212422;
 bh=uk7QZr0vL0vYsXttrGFyY8ZEhFH/YzSlCHjN2oMHfco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hls49Uf+JA4DnOMTNlpKx5aLHU8VQ7eKNgN3mbVxC60WE5OujG4cHpLBS5Ax6z8o4
 PFFuqWIEcUejm4OuoOOCtX67ybmwr8ADSaTH6xuCtodaW76A56i1rrNatTEYnukmF0
 wcns0bCPRh6Gs5Hywc+QvvC2goXt1DNH1vBTa3ZXEnXSE0sVlwONBFTvhfMj0Y82t1
 5Ekldv8ZqN91fAefyebZRapglIT2eqjzTCkj4s7PY20DzX8+InSG3rjLspBkuSh7qe
 cHbqzWtQZIZMA6W6DCRuC4AcuiH4GDtmqITw7CZmbFU4PfKUUBAAFiOwQ8+QmxLhYm
 hIZBaAs+J1f9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hls49Uf+
Subject: Re: [Buildroot] [PATCH v2 1/6] DEVELOPERS: add Thomas Perale for
 'go'
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
Cc: Christian Stewart <christian@paral.in>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-04-15 19:38 +0200, Thomas Perale spake thusly:
> Please use SoB @mind.be.
> 
> I subscribed with the @essensium email to the buildroot ML and if i recall
> correctly i received an error when sending with the @mind alias and didn't
> really bothered fixing it.

In that case, I think you can tell git send-email to always inject the
pseudo From-header at the beginning of the commit, and when we git-am,
that's what get used instead of the mail's From field.

I had a similar issue with my @work setup [0], I'll dig up the git
config I use there tomorrow.

[0] https://lore.kernel.org/buildroot/ZNCU8E59+%2FD%2Frn5T@tl-lnx-nyma7486-2/

Regards,
Yann E. MORIN.

> Regards,
> PERALE Thomas
> 
> On 4/15/24 6:44 PM, Yann E. MORIN wrote:
> > Thomas, All,
> > 
> > On 2024-04-15 18:22 +0200, Thomas Perale via buildroot spake thusly:
> > > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> > Your From and Signed-off-by are still not the same: @essensium.com vs.
> > @mind.be.
> > 
> > Check your ~/.gitconfig for the proper user.email key. If you also set
> > format.signOff, it should automatically inject the proper SoB line, but
> > if you, like me, explicitly inject SoB lines [0], check your code
> > snippet.
> > 
> > [0] I use vim's snipmate plugin https://github.com/garbas/vim-snipmate
> >      with my own snippets for SoB lines:
> > 
> >      snippet sob
> >          Signed-off-by:
> >      snippet ME
> >          Yann E. MORIN <yann.morin.1998@free.fr>
> > 
> > (so that I can reflex-type sob<TAB>ME<TAB> for my SoB lines.)
> > 
> > For this series, no need to respin _just_ for this: just reply whether
> > to use the SoB line (@mind) or the From field (@essentium), and I can
> > fix it locally when applying.
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> > > ---
> > >   DEVELOPERS | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > index 399b2931ff..039b803d50 100644
> > > --- a/DEVELOPERS
> > > +++ b/DEVELOPERS
> > > @@ -2979,6 +2979,9 @@ F:	package/frotz/
> > >   F:	package/kvm-unit-tests/
> > >   F:	package/xorcurses/
> > > 
> > > +N:	Thomas Perale <thomas.perale@mind.be>
> > > +F:	package/go/
> > > +
> > >   N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > >   F:	arch/Config.in.arm
> > >   F:	board/beaglev/
> > > --
> > > 2.44.0
> > > 
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot

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
