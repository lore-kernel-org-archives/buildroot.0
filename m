Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1736CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 09:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C97A81BCB;
	Tue, 30 Nov 2021 09:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phIzaAObI6x7; Tue, 30 Nov 2021 09:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC0E181A0D;
	Tue, 30 Nov 2021 09:10:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5F631BF281
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 09:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B350281A0D
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 09:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uaIOaH0F3_EA for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 09:10:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 912B2819E6
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 09:10:23 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-225-ZlZqmEZSNrCd6LoDvLlkfg-1; Tue, 30 Nov 2021 09:10:20 +0000
X-MC-Unique: ZlZqmEZSNrCd6LoDvLlkfg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Tue, 30 Nov 2021 09:10:19 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Tue, 30 Nov 2021 09:10:19 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nicolas Cavallari' <nicolas.cavallari@green-communications.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] DHCP default.script
Thread-Index: AdflRRWl50vMBTqNTvKf7Q5EylNhqQAIS5IAABhwE1A=
Date: Tue, 30 Nov 2021 09:10:19 +0000
Message-ID: <fb221bb348514a8892165ee3aec34139@AcuMS.aculab.com>
References: <e3ba29bfce7a4de3aa95a105146eadbf@AcuMS.aculab.com>
 <cb21affd-1ab4-ddd5-1cbe-03861208eda4@green-communications.fr>
In-Reply-To: <cb21affd-1ab4-ddd5-1cbe-03861208eda4@green-communications.fr>
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
Subject: Re: [Buildroot] DHCP default.script
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

From: Nicolas Cavallari
> Sent: 29 November 2021 21:16
> 
> On 29/11/2021 18:19, David Laight wrote:
> > I was looking at the DHCP default.script (that ends up in /usr/share/udhcpd)
> > and found some quite nasty problems.
> > I've fixed them locally and ended up with the script below.
> > (Which is probably easier to read than a diff.)
> > I've ripped out ahavi - we don't need it (and i don't know what it does!).
> 
> It gives IPv4 link-local addresses (169.254.0.0/16) when DHCP fails.

Ah - that 'useful' feature.
I thought it was also responsible to the 'popup windows' every time
someone turns on/off a printer - that I don't seem to be able to disable.

> > 2) On a 'renew' it would delete all routes, not just the one added
> >     by dhcp.
> >     The 'proto dhcp' parameter can be used to identify routes added by
> >     dhcp so that they are the only ones deleted (this matches my desktop).
> 
> Busybox's iproute is very limited (e.g. it does not display the proto
> when listing routes) and 'dhcp' is not a builtin proto, so this needs a
> /etc/iproute2/rt_protos file to list 'dhcp'...

I've got the full 'ip' program installed to get namespace support.
The number could be used instead of the name - but that might
still need minor enhancements to the program.
If you've got dhcp installed the extra bit of code probably isn't
a problem - I suspect even the smallest embedded systems have more
memory and 'disk' space for slightly larger versions of many of
the 'busybox' programs - especially if they are running a recent
Linux kernel.

> > nl="$(printf '\nx')"
> > nl="${nl%x}"
> 
> or just
> 
> nl='
> '

Yes, but I've fallen foul of shell script files with dos line endings.
So I always use the longer form for safety.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
