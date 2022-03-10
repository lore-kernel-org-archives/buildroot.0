Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62ECC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 780E88471F;
	Thu, 10 Mar 2022 11:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WGWD36c5Q6-7; Thu, 10 Mar 2022 11:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BFEB84393;
	Thu, 10 Mar 2022 11:52:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0801BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B725418EF
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x99T8wDx5kaV for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:52:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9237418ED
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 11:52:12 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-122-oG7tTW-XPzCD6DjRqA5OIw-1; Thu, 10 Mar 2022 11:52:09 +0000
X-MC-Unique: oG7tTW-XPzCD6DjRqA5OIw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 10 Mar 2022 11:52:08 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 10 Mar 2022 11:52:08 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mat' <mat@parad0x.org>
Thread-Topic: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
Thread-Index: AQHYNGk1T+9nJKOaGEy6uS9IhKyXC6y4bnOAgAAN+YCAAAD6QA==
Date: Thu, 10 Mar 2022 11:52:08 +0000
Message-ID: <35a9243ae72142ac8380675e9caa0fcf@AcuMS.aculab.com>
References: <20220310101826.GA2353@parad0x.org>
 <34cb1e87c9ff49b897ae79c543278d03@AcuMS.aculab.com>
 <20220310113310.GA9122@parad0x.org>
In-Reply-To: <20220310113310.GA9122@parad0x.org>
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
Subject: Re: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Mat
> Sent: 10 March 2022 11:33
> 
> On Thu, Mar 10, 2022 at 10:45:41AM +0000, David Laight wrote:
> > From: Mathieu Mirmont
> > > Sent: 10 March 2022 10:18
> > >
> > > Different shells can have different behaviours when it comes to
> > > globbing patterns. The dash shell (/bin/sh) on Debian testing switched
> > > to a different fnmatch/glob implementation that results in this new
> > > behaviour:
> > >
> > > Using bash:
> > > $ mkdir /tmp/foo
> > > $ echo /tmp/foo/.[^.]*
> > > /tmp/foo/.[^.]*
> > >
> > > Using dash:
> > > $ mkdir /tmp/foo
> > > $ echo /tmp/foo/.[^.]*
> > > /tmp/foo/..
> >
> > That is just broken.
> > Does the [^x] pattern work at all?
> >
> > Raise a bug on 'Debian testing' hopefully they'll
> > fix it before it actually gets released anywhere.
> 
> The new behaviour of dash is very strange indeed, but also according
> to POSIX the wildcard pattern [^x] is undefined so we should not rely
> on it.

Well [^x] originally meant '^' or 'x' (the same as [x^] but then
shells started treating [^x] the same as [!x].
So I guess POSIX has allowed such shells to be conformant by
making [^x] undefined.

I'm not sure how many shells treat [^x] the same as [!x] but
enough do that people (including me) have forgotten the difference.
ash from a recent buildroot treats [^x] as [!x} but a cygwin
ash I've got doesn't.
A quick search failed to find dash.

ISTR dash is badly broken in other places, try:
$ x=aaab234; echo ${x##${x%%b*}}
b234

It is worth checking whether Debian have changed the behaviour of dash
or whether they've just changed the default root shell to dash.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
