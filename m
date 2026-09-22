Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B193AC982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 06:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4D04076B;
	Tue, 22 Sep 2026 06:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jo7UD6FR2Aub; Tue, 22 Sep 2026 06:42:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BEBC840728
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790059349;
	b=DF40A1bO8ZxRCA0ihRpLsUtgmllvy8vg5SgqH1SLPR4DdKBJa6mScvBUqIYmtiFW/vAC
	 0z53yCfbCzFMJJIV7k/uvgE7f97WjCNDYvCzNmE9YDunM6UiFqdOeD/MuQxQrpZtLDqCn
	 axauuz3pRNHlV8DCzhI91oBm5mHN8TBbzV37mVzpMwos3LVFulKPT5BZIKDSZnOAKQlXK
	 B6QRuzS2/gSRrfWvrAT5cKz0f5OuhxiDizsablFglG4Gstaowi/dqkH6oGs01kTwnXZ0s
	 2N6YmqvMiA7ne0ucDxumaV63V7D0BgO/0UGQkqK7HcufdYQt/OK4peHjoLG6QWBc8AA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790059349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=f/DiBw/pRnbEcNiWvMu6zoZOuLiT6rv6j1wFZ83p9WU=;
	b=KeDL6UC+Q0LVsusQnglmHqvkn0KZm5Im9jOQzD/XoQisUoC7ZBzEwopbeypVync617yq
	 HP+8YLUJoSwxPo8qL2gHj+HZr4bZ7F6xJbzLj7P3A+WHaVfYPkXHGSfY8znEB83dvoad+
	 BjqBy4mcSQaEGgjWesvdXXGxxzmsZwZ0j+8HeuK/r2u5H0Tu6MY5glBM0QXUitdWnBWBD
	 V80jTC88VTPIj7X6xv/kOMozMArAjZ61DXhIbT5E2ZWdz/yUitbq24ogx1HJUbunXncBx
	 UKKql1vyZeNu9krz4txUqk+TSWipsNHU6YkNwlufRJ7g0OczFX8SQsNfRBCOVSIvXWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790059349;
	bh=f/DiBw/pRnbEcNiWvMu6zoZOuLiT6rv6j1wFZ83p9WU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XfxojA3gm2qxhUifJqgEn3YJQ8CRbGpgl7nA1y427wkkmtH8mq1o6v8sTiUZrrQ3M
	 43wJrWuO4mhKby0TZGsg0V+X/45XYpBozMwsw1+0VgvtiYORM/pTpa0cUpuQVJO46L
	 kb4BsUUyidlKfqR72olr3/ACl6HjrL2t/pNx1UVJFMK//6PM4itb2Jm3wetb439V1h
	 OaDw27NydzMrz1a9mZGmy8x8zufOuJqIpTX1TjjIZ7Vp/uCh40+7ptdbSy3Y0Qp7GV
	 z+ewwE6NStYKeyoIiyVLutgOnixY5clWZchjfhWxWH3TACX5GQV340paZtl1w4dcvI
	 7ujydMVcW7vTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEBC840728;
	Tue, 22 Sep 2026 06:42:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF1DA9D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B432F6065F
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOSMtmbi3sSI for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 06:42:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 03E4560662
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790059347;
 b=K2TxrdS0xNKx6/+pq5uduBvUQ7NW6Q9wIfhba+EEv7+k6otF7uQkqmimUeIKZqGr9GMc
 HAT9dUL9rJcyR6yPKDQUrNZquPrHaEnJNJpfTUQU6THQFwF/O3w9usSksahk6c7YhfzTz
 5lt8jrkYznKPDLxHYmBYE/fqrgPX35npdU5Z+IYCbbaeonw/cqADKwZ9pepRaSnF2+HkY
 SyhiliGB51D+x9dhrMOVmMVH4G4yeFJeMdcnGA39L5LHBOi7iE8nkzDUXzOMnAHhVmkER
 /RyuT7gxx/uC0mKeBQmq9wBqtknFbMSCojXLvFONVDGNSqtHzc6PcYkw2u0ms9DJ+6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790059347;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=ByJml4ZOz3jVwyQv/4f6CuL9pv+X1McFPDaK4FUkCJo=;
 b=DfWe/sc9k98JujQM+GO5uLotj1G5OTy11Y/sOnKrfGmcj9Z/17DB6rseetq1jEMmX+Vh
 xHYyKV8ef1n/VXRagvhKNoB7GfBvunUlaNKU+XZza+QY415y1BBk9V7M4CJisIprZIYae
 VKgk0rgTzLjrOqH5+hWioRgELXVZ64cck5tNqsMqax7EKvYdlg19RD7FP7byPkc5nT5S4
 Xx1xKupIyZUAC80CiDgdR4sE8Q/zzXdjK8MYt5seJ06lcbrttWHpZ39WDDb9D+tZHWHVd
 +yOHeqjYpFCXtKzAZFa0f3qQazioYUrMZErTgBYpSOsMCqNE30I9vd7Hzp141xUrweQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EKXmnOuR; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03E4560662
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:42:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E4B13C23DB0;
 Tue, 22 Sep 2026 06:43:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6839060580;
 Tue, 22 Sep 2026 06:42:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E795110329211; 
 Tue, 22 Sep 2026 08:42:07 +0200 (CEST)
Date: Tue, 22 Sep 2026 08:42:06 +0200
To: Adam Duskett <aduskett@gmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot <buildroot@buildroot.org>, 
 Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>, 
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David GOUARIN <dgouarin@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>, 
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, 
 Christian Hitz <christian@klarinett.li>, Gregory Dymarek <gregd72002@gmail.com>,
 Stefan Ott <stefan@ott.net>, Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arIiPynsaPteQb23@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net> <aq-xqh_4_J_v2lQ6@windsurf>
 <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
 <arFb6txpfwW2SwzJ@windsurf>
 <CAFSsvmqhq-xbpkXPFUUnip9=Db9aHv17=sjgojP7rmqXYqgFxw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFSsvmqhq-xbpkXPFUUnip9=Db9aHv17=sjgojP7rmqXYqgFxw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 01/77] Remove mender packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon, Sep 21, 2026 at 08:04:10PM +0200, Adam Duskett wrote:

>     Thanks for your feedback. Based on how you phrase your feedback, it
>     seems like you're somehow taking it personally, as if it was
>     specifically your contributions that were being ignored.
> =

> Nope. Other patches not from me such as the qmake QT6 series is also igno=
red.=A0

Indeed, that's a global problem and there is nothing personal about
you or your contributions.

>     While I understand the frustration that it may cause, simply being
>     "grumpy" is not going to help in any way. What would help is having
>     more contributors involved in the review of patches from others.
> =

> Don't be condescending.=A0 This is the same line that has been used for o=
ver a
> decade. Reviews are also ignored and maintainers insist on nit picking ev=
ery
> single patch.=A0

Please do not over-interpret my words: keep in mind that I am not a
native speaker, and in this sort of complex written conversation, it
is difficult to convey my exact state of mind. I am not condescending
at all.

>     Can I ask that rather than just looking at your own patches for your
>     own specific topic, you take a look at the bigger picture, hopefully
>     turning your "grumpiness" into more productive help/participation to
>     the Buildroot community? This is going to be a LOT more useful.
> =

> Again, don't be condescending. I was CCed on a patch series, I put in my =
two
> cents. If my opinion wasn't wanted then don't include me on the email.=A0

Your opinion is wanted.

>     And I restate: Mender is an important piece of software of the
>     embedded Linux ecosystem, and it makes complete sense to have good
>     support for it in upstream Buildroot.
> =

> Then perhaps one of the maintainers can step up and update the package? I
> wasn't being "grumpy" as you put it when I said an external tree is easie=
r for
> me to maintain. I choose not to deal with the endless nitpicking fand
> bikeshedding rom the maintainers, as I have voiced my frustrations with t=
he
> maintainers and developers for more than a decade and nothing has changed=
.=A0

We are not bikeshedding, we are ensuring a proper consistency and
quality level. Just like what happens in every open-source project
that is properly maintained.

Before Peter Korsgaard took over the maintenance of Buildroot in
2008-2009, multiple people not coordinating with each other and not
having a solid idea of how things should be done had commit
access. And trust me, the result was atrocious. Every problem was
solved in a different way in different places, the code had no
consistency. It was very very difficult to work with. So what you
(hopefully?) like in Buildroot today is in large part due to what you
call "endless nitpicking and bikeshedding from the maintainers".

Best regards,

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
