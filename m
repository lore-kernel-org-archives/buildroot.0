Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB07C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F8CC60C2F;
	Thu,  6 Jan 2022 20:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iaYSvghyXGMX; Thu,  6 Jan 2022 20:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F24B660BCB;
	Thu,  6 Jan 2022 20:19:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D57BA1BF3A4
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 20:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD9D460BCB
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 20:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBUmkNlyNmu8 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 20:19:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDC0560A82
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 20:19:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5148:b9c:d8ec:b3b5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8CB99780346;
 Thu,  6 Jan 2022 21:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641500379;
 bh=H7ZGjeBIT5492faYFtqqeRW/OZrLRf2fTBLZSMQJgtk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPiE0ui5d6CGCJ0ysFvz89Xez/yIO+AG/EBvN9xmmvgKE0soZMW0bZreb9cwRoG1R
 ESgDU9FRKp5V87JJ4iZQQEeu5LALLDKBCHp2H7LI/JzSjsVmDP+FNnwD3aBKTKmeC7
 n8C6CqpBQHmHXgk3xwNLvaJ7nxFvxxh6IB/T5hqTi1/C35nWSzLjK4W6HcY7eYbrBQ
 RbKf+5jT2xyWTuaT6PeBcvUFjv5XxnCfiDz5TrTlPEX31rB5UMJ+jjLrjp5HKOjj7/
 Sl8iUdeK0Ua2L2BamGKdI7QYABA2Che116IcN7rnNIimFu/Q6z0tcRFyO9MGv56e/0
 mPF7D/TKG7YWw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jan 2022 21:19:25 +0100
Date: Thu, 6 Jan 2022 21:19:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220106201925.GP614810@scaer>
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
 <20220106185923.0cb1bb9c@windsurf>
 <CADvTj4q5R0TweMiHhtk_7XM6XT3u5mQ3_TF+m_M_D34Or6r1iQ@mail.gmail.com>
 <de9d6912-6bbd-4412-47f7-094d1ea7fe0b@mind.be>
 <CADvTj4otRbTpruWEZF=FcYH20x72_wi98A2_WTDYzSKH0Q0mrA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4otRbTpruWEZF=FcYH20x72_wi98A2_WTDYzSKH0Q0mrA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/4] Makefile: only check
 _FINAL_DEPENDENCIES are selected
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>,
 =?utf-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-01-06 13:14 -0600, James Hilliard spake thusly:
> On Thu, Jan 6, 2022 at 1:07 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 06/01/2022 19:51, James Hilliard wrote:
> > > On Thu, Jan 6, 2022 at 11:59 AM Thomas Petazzoni
> > > <thomas.petazzoni@bootlin.com> wrote:
> > >> On Wed,  5 Jan 2022 23:24:04 -0700
> > >> James Hilliard <james.hilliard1@gmail.com> wrote:
> > >>> _FINAL_ALL_DEPENDENCIES includes _FINAL_PATCH_DEPENDENCIES which may
> > >>> not need to be selected in kconfig in cases where building is not
> > >>> desired, so only check that _FINAL_DEPENDENCIES are selected.
[--SNIP--]
> >   I think the patch is wrong though. A patch dependency is still a dependency,
> > so the package should be selected.
> Well I thought selection was to enable a package build, I thought selection
> was only for packages that need their build executed.

No, they are needed for all target packages.

> >   The problem is that you add two target packages which have no Config.in. That
> > is simply a no go: target packages should always have a Config.in symbol.
> Well we don't want to actually build the package, only extract+patch
> it, I wasn't
> sure how else to do that.

From what we discussed on IRC the other day, I thought I had udnerstood
that qt5webengine-chromium-catapult was a hot package, that's why I
suggested it to not have a Config.in entry.

However, I might have misunderstood, and it really is a target package,
so it needs to have a Config.in entry, even one that does not have a
prompt

we already have for a few packages in that situation, that are not
user-selectable but are still target packages: glibc, mesa3d-headers,
bluez5_utils-headers and a few others... Most interestingly, though, is
that we already have a similar situation with linux extensions: they are
packages that are present only to provide files that are copied into the
kernel tree, like ev3dev-linux-drivers or fbtft.

So, in your case, I believe that qt5webengine-chromium-catapult.mk is
basically correct, but a simple Config.in is missing:

    # Not user-selectable, it is only needed to be copied
    # into the chromium source tree.
    config BR2_PACKAGE_QT5WEBENGINE_CHROMIUM_CATAPULT
        bool

And then you should not have any issue anymore with patch-depednencies.

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
