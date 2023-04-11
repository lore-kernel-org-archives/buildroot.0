Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0045C77B6F
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 16:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FE681A33;
	Tue, 11 Apr 2023 16:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FE681A33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBMzd26kcgpZ; Tue, 11 Apr 2023 16:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A42E681A2B;
	Tue, 11 Apr 2023 16:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A42E681A2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDC5C1BF29F
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 16:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9618F60BC6
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 16:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9618F60BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XoKkwOcXKIvt for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 16:04:55 +0000 (UTC)
X-Greylist: delayed 02:50:42 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DDA760740
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DDA760740
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 16:04:55 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-20-cQZ8CFFIP96oBtBr5ycpow-1; Tue, 11 Apr 2023 17:04:52 +0100
X-MC-Unique: cQZ8CFFIP96oBtBr5ycpow-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 11 Apr
 2023 17:04:50 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 11 Apr 2023 17:04:50 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Peter Korsgaard' <peter@korsgaard.com>
Thread-Topic: [PATCH 1/2] package/linux-headers: use host-make
Thread-Index: AQHZbHlIfRoZP87WBkuNgyh1X92J/q8mIvNQ
Date: Tue, 11 Apr 2023 16:04:50 +0000
Message-ID: <9a28d1547efc4191bc2507b659b3f91f@AcuMS.aculab.com>
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
 <3eff15aa-5790-604e-d6de-90ed5d2d3eb7@mind.be>
 <877cuisixk.fsf@dell.be.48ers.dk>
 <f45690e2-1ed1-5019-3bc9-da0704785a3c@mind.be>
 <87y1myr2ht.fsf@dell.be.48ers.dk>
 <0b89aff09c044bdfb2644d1111b1ccb5@AcuMS.aculab.com>
 <87ttxmr1lx.fsf@dell.be.48ers.dk>
In-Reply-To: <87ttxmr1lx.fsf@dell.be.48ers.dk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
Cc: "olegartys@gmail.com" <olegartys@gmail.com>,
 Oleg Lyovin <ovlevin@sberdevices.ru>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "sdfw_system_team@sberdevices.ru" <sdfw_system_team@sberdevices.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Korsgaard
> Sent: 11 April 2023 14:27
> 
> >>>>> "David" == David Laight <David.Laight@ACULAB.COM> writes:
> 
>  > From: Peter Korsgaard
>  >> Sent: 11 April 2023 14:08
>  > ...
>  >>
>  >> Sure, I would just be a step towards requiring make 4.0 (which is also
>  >> 10 years old by now:
>  >> https://lists.gnu.org/archive/html/make-w32/2013-10/msg00021.html), but
>  >> true - We can also just consider going straight from 3.81 to 4.0.
> 
>  > I had to revert a Centos 7 from 3.82 to 3.81 (stolen from Ubuntu 13.04)
>  > to fix an bug where make gets confused between dependency types.
>  > (Someone else was hitting it.)
> 
>  > There are a variety of reasons why we build on Centos 7,
>  > mostly because other software (not buildroot/busybox) still
>  > has to run on it and it is useful to use a common build system.
> 
> OK, but (as I'm sure you are painfully aware of), supporting such old
> systems gets harder and harder over time. Would building in a chroot or
> container be an option?

I was mostly pointing out that 3.82 may not be a good idea.
I already have to use a newer gcc for buildroot/busybox (mostly
for grub). So adding in newer tools isn't that much of a problem.

Getting drivers to compile/run on everything from centos 7
through to 6.3-rc3 keeps me busy!

> According to
> https://endoflife.software/operating-systems/linux/red-hat-enterprise-linux-rhel,
> RHEL7 will be EOL in ~1 year from now (June 30th, 2024), so perhaps it
> makes sense to only move to require make 4.0 in for 2024.02.x.

Except we will have to support it until the extended death - probably May 2029.
But that bit doesn't involve buildroot/busybox.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
