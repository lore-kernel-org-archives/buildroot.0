Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEDEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B4D60E9A;
	Mon,  7 Feb 2022 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdnGP0o2kmq4; Mon,  7 Feb 2022 17:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E20160EC1;
	Mon,  7 Feb 2022 17:38:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3725B1BF29C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30F2640238
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAlivF2Xl_D5 for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:38:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D63D5401B5
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:38:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4514:5b91:b120:9d9f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1F71219F553;
 Mon,  7 Feb 2022 18:37:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644255481;
 bh=K6QPzsWG899vTubmhbewAD31fHJlJCJUz9MWzDJhYKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GPnBMguQBUhpHTlYFjRA4MaCX8NEitgtqCCEAJphuhwpvo9hIZ6MXtJBVR16zTRRm
 nDX+WddVl6MHTtkzmIlWiBnZSV/42WET49mdXEijmZGye7TlzIZbrrwxTTfytn20a+
 V2A1zItt50HmXkfPlhSMxMUByNplzpA5z/9ubZ7Kk0Iz0Ki6w0NmKj0KVzFjd8zy8v
 hS5kfX94Sc9HrRFCLTw2whOEje9dTTyB57tqclUOZtaS/XqtMCX1eC+na/OvFVVUFp
 QfWZtap0HwlSB3QO0m6phjobeiJETNNFF20q1TuG52EPlbuK6Wl9S0QiXqWNkxwhHt
 Ynfh1y8wNiinQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Feb 2022 18:37:51 +0100
Date: Mon, 7 Feb 2022 18:37:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220207173751.GA2249818@scaer>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
 <20220206200532.2758493-2-giulio.benetti@benettiengineering.com>
 <20220206213657.GA457876@scaer> <20220207085517.5c13c097@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207085517.5c13c097@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 01/16] board/aarch64-efi/genimage-efi:
 convert partition-type-uuid to single letter notation
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-02-07 08:55 +0100, Thomas Petazzoni spake thusly:
> On Sun, 6 Feb 2022 22:36:57 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > >  	partition root {
> > > -		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> > > +		partition-type-uuid = L  
> > As we discussed on IRC, this is not the same thing. genimage will extend
> > the 'L' shorthand to the full UUID 0fc63daf-8483-4772-8e79-3d69d8477de4,
> > which is different.
> And? Is that really important?
> > So I don't think uaing the shorthands are correct.
> Why?

I think that it is important that we do adhere to the expected values;
see below...

> > The UUID assignments are available on Wikipedia:
> >     https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
> > But the systemd docuemntation has extra UUID definitions:
> >     https://man.archlinux.org/man/systemd-gpt-auto-generator.8
> Yes, but how useful are they?

Why would we diverge from the specs?

> Unless these systemd-defined UUID are really relevant, I would prefer
> that we use the shortcuts provided by genimage wherever possible, and
> only rely on using the full UUID for special cases, such as the
> board/sifive/hifive-unleashed/genimage_sdcard.cfg (PATCH 15/16).

There are tools that expect those values, to autodetect partitions. This
is the case, of course, of systemd-gpt-auto-generator, which will lookup
the partition UUIDs, but other tools may expect these UUIDs too.

I am not saying that we would cause trouble by changing our board
descriptions, but if we want to allow people to just copy them as the
base for their own development, then diverging from expected behaviour
is not nice.

> This way, it would be pretty clear that we have the "common cases" (boot
> partition, rootfs partition) and the "odd/special cases".

I think the "common case" would be "adhere to spec, use specified
values", while the exceptions are "the spec says nothing, use something
else and comment it".

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
