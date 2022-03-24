Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0C6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 10:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC7BC419B6;
	Thu, 24 Mar 2022 10:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxD8dZBw0HzU; Thu, 24 Mar 2022 10:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D208419BF;
	Thu, 24 Mar 2022 10:25:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D538D1BF2C7
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 10:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1F9A84325
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 10:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1QzTBvnpJlJ for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 10:25:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51CE484322
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 10:25:18 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-56-9DBcJcgBPT-ane8rrFLFpQ-1; Thu, 24 Mar 2022 10:25:14 +0000
X-MC-Unique: 9DBcJcgBPT-ane8rrFLFpQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Thu, 24 Mar 2022 10:25:13 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Thu, 24 Mar 2022 10:25:13 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'Yann E. MORIN'" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
Thread-Index: AQHYP1iknTroLI/B6E6vl8ATYchf8qzOQFvggAAPVwCAAAK58A==
Date: Thu, 24 Mar 2022 10:25:13 +0000
Message-ID: <b36b2f5bd49645729508e9980a6ed488@AcuMS.aculab.com>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com> <20220324082433.GA3649946@scaer>
 <be8ccaa597e343698f32663cfb937c2a@AcuMS.aculab.com>
 <20220324100906.GC3649946@scaer>
In-Reply-To: <20220324100906.GC3649946@scaer>
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
Subject: Re: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yann E. MORIN
> Sent: 24 March 2022 10:09
> 
> David, All,
> 
> On 2022-03-24 09:15 +0000, David Laight spake thusly:
> > From: Yann E. MORIN
> > > Sent: 24 March 2022 08:25
> > >
> > > +Peter: candidate for backporting as a security fix
> > Probably not - the security fix is the code that actually
> > initialises the RNG.
> 
> Not sure I understood... As Jason explained, we have so far been saving
> a seed from an RNG that is probably partially deterministic; that is the
> security issue.

I'm pretty sure the seed is also saved during shutdown.
So a normal startup doesn't rely on the seed saved by the startup script.
(Although is would be better to use a background script
to save after (say) 30 minutes of operation.)

> The way we are seeding the RNG fundamentally does not change, because
> we are not crediting any entropy with whatever we put in there. So,
> whether we write something, anything, or nothing at all, has no impact
> on the strength of the RNG.

Right - the problem is that RNG isn't being given any entropy
at boot time.
So it is very weak.
The only point in saving/loading a seed is to give the RNG some
entropy at boot time.
Otherwise programs run from startup scripts that read the RNG
to get session keys don't get very good values at all.
That is the real security problem.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
