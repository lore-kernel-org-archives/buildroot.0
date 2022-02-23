Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3E0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 08:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75BCE408CC;
	Wed, 23 Feb 2022 08:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Q6aWz1M1Iqn; Wed, 23 Feb 2022 08:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6527402B1;
	Wed, 23 Feb 2022 08:49:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31C641BF2E3
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 08:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B23C40180
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 08:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hxoJoDaFxfe for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 08:49:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB97040012
 for <buildroot@uclibc.org>; Wed, 23 Feb 2022 08:49:02 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-64-BP4Xr633MfqOZY5QcfKsOQ-1; Wed, 23 Feb 2022 08:48:59 +0000
X-MC-Unique: BP4Xr633MfqOZY5QcfKsOQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 08:48:57 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 23 Feb 2022 08:48:57 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'bugzilla@busybox.net'" <bugzilla@busybox.net>, "buildroot@uclibc.org"
 <buildroot@uclibc.org>
Thread-Topic: [Buildroot] [Bug 14366] Nodejs fails with "version `GLIBC_2.34'
 not found" on Ubuntu 20.04
Thread-Index: AQHYKI40oZJR3lMbEkC7f0umq27Lvqyg0sZA
Date: Wed, 23 Feb 2022 08:48:57 +0000
Message-ID: <b56cb610ee034d80ae2afe30fb6f6351@AcuMS.aculab.com>
References: <bug-14366-163@https.bugs.busybox.net/>
 <bug-14366-163-zTiO0GJ8cx@https.bugs.busybox.net/>
In-Reply-To: <bug-14366-163-zTiO0GJ8cx@https.bugs.busybox.net/>
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
Subject: Re: [Buildroot] [Bug 14366] Nodejs fails with "version `GLIBC_2.34'
 not found" on Ubuntu 20.04
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

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of bugzilla@busybox.net
> Sent: 23 February 2022 08:20
> To: buildroot@uclibc.org
> Subject: [Buildroot] [Bug 14366] Nodejs fails with "version `GLIBC_2.34' not found" on Ubuntu 20.04
> 
> https://bugs.busybox.net/show_bug.cgi?id=14366
> 
> --- Comment #4 from Jens Maus <mail@jens-maus.de> ---
> I just checked the latest 2022.02-rc2 version and there the issue with not
> being able to compile nodejs v14+ on an ubuntu host still exists as outlined
> here.
> 
> However, taking the workaround mentioned in
> https://gitlab.com/qemu-project/qemu/-/issues/857 I could workout a patch that
> seems to fix the issue:
> 
> --- buildroot/package/nodejs/v8-qemu-wrapper.in.orig
> +++ buildroot/package/nodejs/v8-qemu-wrapper.in
> @@ -5,5 +5,6 @@
>  exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
>      @QEMU_USERMODE_ARGS@ \
>     -L "${STAGING_DIR}/" \
> +   -E LD_LIBRARY_PATH="/lib/" \
>      "$@"

Except that isn't really what LD_LIBRARY_PATH path should be used for.

	David
> 
> 
> With this patch nodejs v14+ seems to compile fine on an ubuntu 20.04 LTS host.
> 
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
