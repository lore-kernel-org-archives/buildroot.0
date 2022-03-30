Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9901C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 16:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7136861261;
	Wed, 30 Mar 2022 16:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEx2I5d92zIm; Wed, 30 Mar 2022 16:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF4B610A1;
	Wed, 30 Mar 2022 16:57:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9671BF341
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 16:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180DA610A1
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 16:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeP5QhTRn9Ft for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 16:57:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 973BF607F0
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 16:57:42 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-33-o55mMlC3NZekMJm_ubHEsQ-1; Wed, 30 Mar 2022 17:57:39 +0100
X-MC-Unique: o55mMlC3NZekMJm_ubHEsQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Wed, 30 Mar 2022 17:57:37 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Wed, 30 Mar 2022 17:57:37 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Peter Korsgaard' <peter@korsgaard.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Thread-Topic: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
Thread-Index: AQHYRFPFzS72cv7q9kGHCbtoXkDsoazYJAuA
Date: Wed, 30 Mar 2022 16:57:37 +0000
Message-ID: <50a8049df34e4adcba0476bc66ba8f08@AcuMS.aculab.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com> <871qyj8kpk.fsf@dell.be.48ers.dk>
In-Reply-To: <871qyj8kpk.fsf@dell.be.48ers.dk>
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

From: Peter Korsgaard
> Sent: 30 March 2022 17:33
> 
> Hi,
> 
>  > The RNG can't actually be seeded from a shell script, due to the
>  > reliance on ioctls. For this reason, the seedrng project provides a
>  > basic script meant to be copy and pasted into projects like buildroot
>  > and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.
> 
>  > This commit imports it into buildroot and wires up the init scripts to
>  > call it. This also is a significant improvement over the current init
>  > script, which doesn't credit entropy and whose hashing in shell scripts
>  > is sort of fragile.
> 
>  > As seedrng.c is a short tiny C program, we include this here in the
>  > package, like a few other packages do. Later we'll investigate adding
>  > this to busybox, but for now, this is a good start and a positive step
>  > in the right direction.
> 
> As discussed on IRC, I think it would be nicer to just add a normal
> seedrng package and depend on that from urandom-scripts, so the standard
> version/license info/.. stuff works. I can do that change if needed.
> 
> You mentioned something on IRC about this containing differences from
> what it is seedrng.git. Those changes/fixes are presumably not specific
> to Buildroot, will you add those changes to the git repo as well?

I remember this 'not so little' program limiting the amount of data
saved and restored to a fairly small amount.
I think it referred to a limit in the kernel.

I just wrote a 10 line program to copy a file to /dev/urandom
using the ioctl so that the 'entropy' is credited.
AFAICT the kernel copied all the data into the pool and would
credit quite a lot of entropy.
There is a loop that uses an 128 byte on-stack buffer.
But it is a loop.

Another thing I noticed is that the script is S20urandom.
This runs rather late, things like udev have already tried
to read random numbers.
The script really needs to run much sooner.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
