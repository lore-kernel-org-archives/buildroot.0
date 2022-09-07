Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05DFC38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 22:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE83061058;
	Wed,  7 Sep 2022 22:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE83061058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-Vkw01evZ8L; Wed,  7 Sep 2022 22:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F349360F3C;
	Wed,  7 Sep 2022 22:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F349360F3C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4B3B1BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 22:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 897F081365
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 22:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 897F081365
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OiId46WKmkMt for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 22:08:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE4B81346
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCE4B81346
 for <buildroot@busybox.net>; Wed,  7 Sep 2022 22:08:48 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-270-3fK99hWSN7asibRdXhGK4A-1; Wed, 07 Sep 2022 23:07:26 +0100
X-MC-Unique: 3fK99hWSN7asibRdXhGK4A-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Wed, 7 Sep
 2022 23:07:26 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Wed, 7 Sep 2022 23:07:26 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Grant Edwards' <grant.b.edwards@gmail.com>, "buildroot@busybox.net"
 <buildroot@busybox.net>
Thread-Topic: [Buildroot] How to include prebuilt binary using buildroot?
Thread-Index: AQHYwvkl+WxESnkON0W4WUMb1qMQwq3UhYzw
Date: Wed, 7 Sep 2022 22:07:26 +0000
Message-ID: <dc20805594c84f369d5be87bf5eb224b@AcuMS.aculab.com>
References: <CADYjeSu2TUq3Wkk-AFK8TM=xazH66jKPD8Vg6HA9W3WnX2xymg@mail.gmail.com>
 <tfav6k$uda$1@ciao.gmane.io>
In-Reply-To: <tfav6k$uda$1@ciao.gmane.io>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] How to include prebuilt binary using buildroot?
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

From: Grant Edwards
> Sent: 07 September 2022 21:33
> 
> On 2022-09-07, Sourabh Hegde <hrsourabh011@gmail.com> wrote:
> >
> > I think this is rather a basic question:
> >
> > An application package is not part of buildroot But I am looking for
> > possibilities to include it in my image.
> 
> I configured buildroot to run a post-build script. In that script, I
> copy various files to various places in the output/target tree. I'm
> admittedly

We just use fakeroot again to expand the cpio archive
buildroot generates, delete some stuff, copy some more files in,
and then archive it back up.

That also means we can change our bits without having
to rerun all the buildroot makefiles.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
