Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42E6C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 10:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A64040220;
	Sun, 12 Feb 2023 10:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A64040220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8Ohy_V3BOmP; Sun, 12 Feb 2023 10:11:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FCF54014E;
	Sun, 12 Feb 2023 10:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FCF54014E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0ABB41BF378
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8DD0415EF
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DD0415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EK8JXBCOtDW1 for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 10:11:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC4D415E4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABC4D415E4
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 10:11:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BF9295FFAB;
 Sun, 12 Feb 2023 11:11:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 11:11:12 +0100
Date: Sun, 12 Feb 2023 11:11:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230212101112.GL2796@scaer>
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <20230212094205.GK2796@scaer>
 <CADvTj4oC6WXD=n3zMyBMZuCiZvra3PztQ9YhpDfZ72cJqeq0SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4oC6WXD=n3zMyBMZuCiZvra3PztQ9YhpDfZ72cJqeq0SQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676196675;
 bh=miFE+e9fxzNfyuk1+fLkBsXte9C1zmoO8+WD8R8jxxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LWmzX60Vw1IatVlyc2GjP4NhxTgqw9Smj1xPPduani/0Uf+tmZlbFthS4PJ1cx3fg
 Qn7szO1taPMVVRVVykjlkwj4vnAS71Oeg8F4ZmGnTN6bsmqVs9m+2RKl+LY9Rb+uGl
 A5QeoDdQOvNbaIaCDugjFw0qCeI8hYn5uBhkCYisXy0lkQgPCdpxg/opx/IG3chHP8
 vZdyTK5rseP2pyVvZbpIhbLziF4/gFYntM4KwyeJr43HoRnuXSzFuq08LQAzXliivL
 f26SE7ciPofc3/H+bDBtoPFIU9qnmt/t/Q1S9AKeX3sjJM/RZsM1QJatX3W10JXdD0
 rvCms+r2vnvoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LWmzX60V
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-02-12 03:02 -0700, James Hilliard spake thusly:
> On Sun, Feb 12, 2023 at 2:42 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-10-17 21:46 -0600, James Hilliard spake thusly:
> > > To ensure the evaluation order is always correct use double colon
> > > rules to make the evaluation order explicit as per make docs:
> > >
> > > The double-colon rules for a target are executed in the order they
> > > appear in the makefile.
[--SNIP--]
> > So, I'd like that we get another way to fix that, if possible...
> I have unfortunately not found any other method to fix the execution
> ordering...

What about something along the lines of (untestd!):

    $(1)-rebuild: $(1): $(1)-clean-for-rebuild
    $(1)-rebuild: $(1)

We already use such a construct in package/pkg-kconfig.mk, but only
once, so this is not as if it were widespread either...

Still, I think it is more easy to read...

Regards,
Yann E. MORIN.

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
