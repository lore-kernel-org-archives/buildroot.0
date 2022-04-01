Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2C5C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 11:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12E8843EF;
	Fri,  1 Apr 2022 11:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iJAN8rAtr_r; Fri,  1 Apr 2022 11:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4392843DA;
	Fri,  1 Apr 2022 11:34:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2641BF30A
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 11:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B07340538
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 11:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFcWaFVTfEP9 for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 11:34:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D43FB400B8
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 11:34:55 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-320-e6HeaNDeMpu1AYdv8pfoJw-1; Fri, 01 Apr 2022 12:34:53 +0100
X-MC-Unique: e6HeaNDeMpu1AYdv8pfoJw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 1 Apr 2022 12:34:51 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 1 Apr 2022 12:34:51 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, James Hilliard
 <james.hilliard1@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
Thread-Index: AQHYRbhKzS72cv7q9kGHCbtoXkDsoaza6TGg
Date: Fri, 1 Apr 2022 11:34:51 +0000
Message-ID: <f16f09468ba64eb0bb9d985304daecb4@AcuMS.aculab.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com> <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
 <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
In-Reply-To: <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jason A. Donenfeld
> Sent: 01 April 2022 12:05
> 
> On 4/1/22, James Hilliard <james.hilliard1@gmail.com> wrote:
> > I should add that I do also think this should be upstreamed to busybox,
> > which
> > will also reduce the amount of duplicate work as busybox is commonly used
> > across many distros.
> 
> I'll work on that. And hopefully David won't sabotage it with his
> "it's only 10 lines!" stuff.

:-)

Busybox tends to care about code size.
You really want to roll-up the unrolled loop in blakes2.
Performance really doesn't matter here.

In any case, don't new kernels just 'stir' the new entropy into
input pool?
So feeding in non-random data doesn't really make the output
any worse?
So you could add the saved entropy, force a reseed of the output
generator, and then save data from /dev/urandom - which now
contains any entropy collected since boot and the saved seed.
No need for any cryprographic code in userspace??

The old kernel code is just too horrid to think about.
IIRC the output generator is just and xor of several LFSR
and so is completely and trivially reversable.
(One of the random number generators did that.)
And the input pool tries to count bits in and out instead
of 'stirring' input data into some data structure.
So feed it non-random data and it discards the old random
data it had.

How much state does the blakes2 input pool have?
I'd have thought you'd want the input pool to have
much more state than the output generator?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
