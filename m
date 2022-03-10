Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E021C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 07:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E065B611A7;
	Thu, 10 Mar 2022 07:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QbkBbeIZ449; Thu, 10 Mar 2022 07:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B2561198;
	Thu, 10 Mar 2022 07:40:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5CE1BF476
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 07:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D24561198
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 07:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kgHlPpi068Xr for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 07:40:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D969660F4E
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 07:40:54 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-244-GaDg_dYINAauBvMvtftogw-1; Thu, 10 Mar 2022 07:40:51 +0000
X-MC-Unique: GaDg_dYINAauBvMvtftogw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 10 Mar 2022 07:40:50 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 10 Mar 2022 07:40:50 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'clayton.shotwell@rockwellcollins.com'"
 <clayton.shotwell@rockwellcollins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] fs: Change default fakeroot shell to bash
Thread-Index: AQHYNAqJJFoV56uRdU2SQ2OdCWiCS6y4Owqw
Date: Thu, 10 Mar 2022 07:40:50 +0000
Message-ID: <28b7bbc57970469eae07f1e439fdf1cd@AcuMS.aculab.com>
References: <20220309230745.143885-1-clayton.shotwell@rockwellcollins.com>
In-Reply-To: <20220309230745.143885-1-clayton.shotwell@rockwellcollins.com>
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
Subject: Re: [Buildroot] [PATCH 1/1] fs: Change default fakeroot shell to
 bash
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
Cc: Clayton Shotwell <clayton.shotwell@collins.com>,
 "matthew.weber@collins.com" <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: clayton.shotwell
> Sent: 09 March 2022 23:08
> 
> The addition of the removal of the /run and /tmp contents using a
> non-POSIX pattern causes the file system creation to fail on systems
> where /bin/sh does not default to bash. Switching the fakeroot script
> to a bash shell addresses the problem.

I'm not sure you can rely on /bin/bash existing.

Better to fix the script to not need bashisms.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
