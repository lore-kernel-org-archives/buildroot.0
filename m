Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6D3C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 14:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3F841C4C;
	Thu, 24 Mar 2022 14:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmP0KxxtNl8W; Thu, 24 Mar 2022 14:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADFC3418F9;
	Thu, 24 Mar 2022 14:31:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A43F1BF3E1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 14:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02141418F9
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 14:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_S4JbPHCy2R for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 14:31:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E46FC418F4
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:31:39 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-254-gNJCLxYeP_iMP1VaOn9IYw-1; Thu, 24 Mar 2022 14:31:36 +0000
X-MC-Unique: gNJCLxYeP_iMP1VaOn9IYw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Thu, 24 Mar 2022 14:31:35 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Thu, 24 Mar 2022 14:31:35 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
Thread-Topic: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
Thread-Index: AQHYP1iknTroLI/B6E6vl8ATYchf8qzOQFvggABOTwCAAAoZ4A==
Date: Thu, 24 Mar 2022 14:31:35 +0000
Message-ID: <859deab97eb947eb9114cf491c871a00@AcuMS.aculab.com>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com> <20220324082433.GA3649946@scaer>
 <be8ccaa597e343698f32663cfb937c2a@AcuMS.aculab.com>
 <CAHmME9p4sXHZB_jUfCwJ3bDZH71pCu2oaS0arSNCCogB6F+q=w@mail.gmail.com>
In-Reply-To: <CAHmME9p4sXHZB_jUfCwJ3bDZH71pCu2oaS0arSNCCogB6F+q=w@mail.gmail.com>
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jason A. Donenfeld
> Sent: 24 March 2022 13:54
> 
> On Thu, Mar 24, 2022 at 3:15 AM David Laight <David.Laight@aculab.com> wrote:
> >
> > From: Yann E. MORIN
> > > Sent: 24 March 2022 08:25
> > >
> > > +Peter: candidate for backporting as a security fix
> >
> > Probably not - the security fix is the code that actually
> > initialises the RNG.
> 
> No. The security fix here is that the old and new seeds are hashed
> together so that the new one doesn't regress in entropy. Yann is
> correct.

But there is no entropy, you've never let the system collect any.

It is still completely broken.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
