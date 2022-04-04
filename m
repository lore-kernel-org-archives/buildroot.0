Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8EBC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 08:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C97401CB;
	Mon,  4 Apr 2022 08:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d20kYS3o1s4; Mon,  4 Apr 2022 08:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 724F74004E;
	Mon,  4 Apr 2022 08:43:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB0571BF3E3
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 08:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F0B829AF
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 08:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3kD-mVRSLum for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 08:42:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70F2682923
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 08:42:56 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-131-1cZtk2lTMdi1IaxEwQPS3Q-1; Mon, 04 Apr 2022 09:42:01 +0100
X-MC-Unique: 1cZtk2lTMdi1IaxEwQPS3Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Mon, 4 Apr 2022 09:41:45 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Mon, 4 Apr 2022 09:41:45 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnout Vandecappelle' <arnout@mind.be>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/fetchmail: fix build with
 libressl
Thread-Index: AQHYR/Z+8VMu6H2F+0KQ/pOqXkzLvKzfb1ow
Date: Mon, 4 Apr 2022 08:41:45 +0000
Message-ID: <5771e60200854118a380e4b47b540f68@AcuMS.aculab.com>
References: <20220403185306.928833-1-fontaine.fabrice@gmail.com>
 <20220403201530.GB2354230@scaer>
 <01a5ba2d-a511-5322-5406-d1bc9bc95347@mind.be>
In-Reply-To: <01a5ba2d-a511-5322-5406-d1bc9bc95347@mind.be>
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
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: fix build with
 libressl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Arnout Vandecappelle
> Sent: 04 April 2022 08:35
> 
> On 03/04/2022 22:15, Yann E. MORIN wrote:
> > Fabrice, All,
> >
> > On 2022-04-03 20:53 +0200, Fabrice Fontaine spake thusly:
> >> Fix the following build failure with libressl raised since bump to
> >> version 6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31 and
> >> https://gitlab.com/fetchmail/fetchmail/-/commit/340d00bf9910ed55163be26435f70baf65a64f9d:
> >>
> >> configure: error: fetchmail cannot legally be linked against LibreSSL for lack of GPL2 clause 2b
> exception. See COPYING.
> >
> > This sentence is incorrect. It is legally not possible to *distribute*
> > fetchmail when linked against LibreSSL, as the GPL conditions in that
> > case only trigger at the moment of distribution.
> >
> > So, there should be no issue with linking fetchmail to LibreSSL for
> > private use without redistribution.
> 
>   It would be nice though if this could be mentioned in legal-info.

ISTM that the default needs to be to disable the build.
Requiring 'hoops be gone through' for a private build.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
