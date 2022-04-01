Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A673BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 10:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FEAF60701;
	Fri,  1 Apr 2022 10:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vygJ0VZZ7aNe; Fri,  1 Apr 2022 10:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61ADA6059E;
	Fri,  1 Apr 2022 10:12:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0FD1BF355
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 10:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A08C40386
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 10:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GgMs2JimSxT for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 10:11:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66B2D401FB
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 10:11:58 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-15-xKHDpxQJMquIi8gJ3OCi1g-1; Fri, 01 Apr 2022 11:11:55 +0100
X-MC-Unique: xKHDpxQJMquIi8gJ3OCi1g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 1 Apr 2022 11:11:54 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 1 Apr 2022 11:11:54 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
Thread-Topic: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
Thread-Index: AQHYRSJozS72cv7q9kGHCbtoXkDsoazatK7ggAAEaQCAABq8YA==
Date: Fri, 1 Apr 2022 10:11:54 +0000
Message-ID: <e76de69b227d4a66ae2f2c9fd6901476@AcuMS.aculab.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com> <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <87bkxm2gix.fsf@dell.be.48ers.dk>
 <2949fa8776db4c96800e1df8e39a8ec2@AcuMS.aculab.com>
 <CAHmME9rQOtfhKCOD8AAmpnY6yjNZTUi0H6_Jmd5vYtu68TxaGg@mail.gmail.com>
In-Reply-To: <CAHmME9rQOtfhKCOD8AAmpnY6yjNZTUi0H6_Jmd5vYtu68TxaGg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jason A. Donenfeld
> Sent: 01 April 2022 10:23
> 
> On 4/1/22, David Laight <David.Laight@aculab.com> wrote:
> > I used the following small program instead of dd to credit the entropy.
> 
> Not a safe idea; will lead to problems and footguns. Doesn't handle
> safe fsync'd deletion of used seeds and safe sequencing. Doesn't
> handle hashing old seed with new seed. Ignores much of the discussion
> that lead to seedrng's design.

But it does exactly what the old scripts thought they were doing
and is far better that just using dd.

I'm not even sure that trying to save a 'new seed' in the
startup script is a good idea at all.
The new seed is very likely to just be a permutation of the
old seed - since little extra 'entropy' can have been added.
So while it may stop complete reproducibility I'm not at
all sure it is cryptographically sound at all.

If you can't rely on saving entropy at shutdown, then using
(the equivalent of) a cron job to save every hour (or so)
is probably useful.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
