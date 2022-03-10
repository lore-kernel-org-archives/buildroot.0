Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918D2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2525140B17;
	Thu, 10 Mar 2022 11:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPiHGlazO7JW; Thu, 10 Mar 2022 11:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D2E840286;
	Thu, 10 Mar 2022 11:31:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0F451BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D32C40286
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPXUJ8UEz3pZ for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:31:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D059400C9
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 11:31:26 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-93-zAV9j7c1PuCI2Ms_7azTwg-1; Thu, 10 Mar 2022 11:31:22 +0000
X-MC-Unique: zAV9j7c1PuCI2Ms_7azTwg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 10 Mar 2022 11:31:21 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 10 Mar 2022 11:31:21 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Edgar Bonet' <bonet@grenoble.cnrs.fr>, Mathieu Mirmont <mat@parad0x.org>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
Thread-Index: AQHYNGk1T+9nJKOaGEy6uS9IhKyXC6y4eV8AgAACW7A=
Date: Thu, 10 Mar 2022 11:31:21 +0000
Message-ID: <fcf6f41bfddf48608cb98aeb2653977c@AcuMS.aculab.com>
References: <20220310101826.GA2353@parad0x.org>
 <455a9499-b6a6-adbd-1e20-0b4f1ceb66f7@grenoble.cnrs.fr>
In-Reply-To: <455a9499-b6a6-adbd-1e20-0b4f1ceb66f7@grenoble.cnrs.fr>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Of Edgar Bonet
> Sent: 10 March 2022 11:22
> 
> Mathieu Mirmont wrote:
> > Using dash:
> > $ mkdir /tmp/foo
> > $ echo /tmp/foo/.[^.]*
> > /tmp/foo/..
> 
> There is an error in this glob pattern. Fixing it would be simpler than
> invoking find/xargs.
> 
> Within a regexp, character classes are complemented with "^": [^.] means
> "any character other that a dot". Within a glob pattern, character
> classes are complemented with "!", and the same class would be written
> [!.]

I should know that :-)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
