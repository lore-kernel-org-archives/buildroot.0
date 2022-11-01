Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A07FA3745
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 08:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7357840328;
	Tue,  1 Nov 2022 08:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7357840328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWfiJTWjiC9T; Tue,  1 Nov 2022 08:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F2540154;
	Tue,  1 Nov 2022 08:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F2540154
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC89B1BF30E
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 08:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4B8960B49
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 08:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4B8960B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xgYvocSj2NHI for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 08:46:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ACA060B2C
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ACA060B2C
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 08:46:28 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-237-Hj7rX4vKNmCx-0F4DhkabQ-1; Tue, 01 Nov 2022 08:46:25 +0000
X-MC-Unique: Hj7rX4vKNmCx-0F4DhkabQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Nov
 2022 08:46:23 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Tue, 1 Nov 2022 08:46:23 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Thomas Petazzoni' <thomas.petazzoni@bootlin.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, "mail@jens-maus.de" <mail@jens-maus.de>,
 "fesc2000@mailbox.org" <fesc2000@mailbox.org>, "f.rogall@gmx.de"
 <f.rogall@gmx.de>, "oliver.kasten@trsystems.de" <oliver.kasten@trsystems.de>
Thread-Topic: [Buildroot] NodeJS, qemu wrapper and ELF interpreter fun
Thread-Index: AQHY7WjtA9ZdzCQkb0qx2TxDcW6OzK4pwXMg
Date: Tue, 1 Nov 2022 08:46:23 +0000
Message-ID: <f7086aad47234c089332330689ae9a42@AcuMS.aculab.com>
References: <20221031213926.50d3c778@windsurf>
In-Reply-To: <20221031213926.50d3c778@windsurf>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] NodeJS, qemu wrapper and ELF interpreter fun
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

...
> (C) Pass LD_LIBRARY_PATH pointing to $(STAGING_DIR)/lib and
>     $(STAGING_DIR)/usr/lib in the Qemu wrapper. This works because
>     LD_LIBRARY_PATH paths have precedence over paths given by
>     ld.so.cache.
> 
>     This is the solution already used by the GOI qemu wrapper in
>     package/gobject-introspection/g-ir-scanner-qemuwrapper.in, and
>     which was suggested in bug
>     https://bugs.busybox.net/show_bug.cgi?id=14366.
> 
> Any opinion? Or other ideas?

Using LD_LIBRARY_PATH like that is a bad idea.
Just google for it and you'll find a load of stuff about it.

LD_LIBRARY_PATH should only really be used not substitute a
non-standard library - eg for testing.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
