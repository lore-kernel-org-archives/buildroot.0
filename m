Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871EFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 15:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D8386133C;
	Thu, 31 Mar 2022 15:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AibHVuCL-HFj; Thu, 31 Mar 2022 15:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2070261304;
	Thu, 31 Mar 2022 15:46:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80A951BF3AE
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D2D384027
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZRufV-0gz5e for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 15:46:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B65784021
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 15:46:30 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-258-XH6oj_iIOmelc6BgCSebcg-1; Thu, 31 Mar 2022 16:46:26 +0100
X-MC-Unique: XH6oj_iIOmelc6BgCSebcg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Thu, 31 Mar 2022 16:46:26 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Thu, 31 Mar 2022 16:46:25 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'buildroot' <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v4] package/urandom-scripts: actually credit
 seed files via seedrng
Thread-Index: AQHYRQ+5WUssofF9w0yE9t35m1p8F6zZmVjggAAJCnA=
Date: Thu, 31 Mar 2022 15:46:25 +0000
Message-ID: <4b68f218df884478b709df580e500d46@AcuMS.aculab.com>
References: <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <20220331145738.119773-1-Jason@zx2c4.com>
 <acee4066c6e2437595b10cc769d49270@AcuMS.aculab.com>
In-Reply-To: <acee4066c6e2437595b10cc769d49270@AcuMS.aculab.com>
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
Subject: Re: [Buildroot] [PATCH v4] package/urandom-scripts: actually credit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Resend to just the list - I think Jason's gmail account
is rejecting direct mail from me.

Which probably means he hasn't seen my earlier messages either.

	David

> -----Original Message-----
> From: David Laight
> Sent: 31 March 2022 16:16
> To: 'Jason A. Donenfeld' <Jason@zx2c4.com>; Peter Korsgaard <peter@korsgaard.com>; buildroot
> <buildroot@buildroot.org>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Subject: RE: [Buildroot] [PATCH v4] package/urandom-scripts: actually credit seed files via seedrng
> 
> From: Jason A. Donenfeld
> > Sent: 31 March 2022 15:58
> >
> > The RNG can't actually be seeded from a shell script, due to the
> > reliance on ioctls. For this reason, the seedrng project provides a
> > basic script meant to be copy and pasted into projects like buildroot
> > and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.
> >
> > This commit imports it into buildroot and wires up the init scripts to
> > call it. This also is a significant improvement over the current init
> > script, which doesn't credit entropy and whose hashing in shell scripts
> > is sort of fragile.
> >
> > As seedrng.c is a short tiny C program, we include this here in the
> > package, like a few other packages do. Later we'll investigate adding
> > this to busybox, but for now, this is a good start and a positive step
> > in the right direction.
> >
> ...
> > -# Quietly do nothing if /dev/urandom does not exist
> > -[ -c /dev/urandom ] || exit 0
> > -
> > -URANDOM_SEED="/var/lib/random-seed"
> > +# The following knobs can be adjusted by placing uncommented modified lines
> > +# into /etc/default/urandom:
> > +#
> > +# Set these to change where the seed and runtime lock file are stored:
> > +#
> > +#     export SEEDRNG_SEED_DIR=/var/lib/seedrng
> > +#     export SEEDRNG_LOCK_FILE=/var/run/seedrng.lock
> > +#
> > +# Set this to true only if you do not want seed files to actually credit the
> > +# RNG, for example if you plan to replicate this file system image and do not
> > +# have the wherewithal to first delete the contents of /var/lib/seedrng:
> > +#
> > +#     export SEEDRNG_SKIP_CREDIT=false
> > +#
> 
> That quietly breaks anyone who just updates buildroot without
> noticing that the 'magic' shell variables have changed.
> 
> I'm also sure you can manage to pass the arguments into the program
> through argv[] instead of grovelling through the environment.
> 
> 	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
