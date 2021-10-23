Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023DCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 16:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6327261090
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 16:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6327261090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF14240383;
	Sat, 23 Oct 2021 16:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYpQXUGhTkCE; Sat, 23 Oct 2021 16:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487FC4037F;
	Sat, 23 Oct 2021 16:20:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CBB01BF2AA
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B0E2401F7
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 16:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fJHZ7FYIFRW for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 16:20:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31C224019B
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 16:20:45 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-197-qDVwmC21Nf2fmRb9Tyolsg-1; Sat, 23 Oct 2021 17:20:42 +0100
X-MC-Unique: qDVwmC21Nf2fmRb9Tyolsg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.24; Sat, 23 Oct 2021 17:20:42 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.024; Sat, 23 Oct 2021 17:20:41 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Peter Seiderer' <ps.report@gmx.net>, =?utf-8?B?S8O2cnkgTWFpbmNlbnQ=?=
 <kory.maincent@bootlin.com>
Thread-Topic: Grub2 changes since 2021.10.2
Thread-Index: AdfIJxBIXGDQIVeuRa2/1WKaXn6a1g==
Date: Sat, 23 Oct 2021 16:20:41 +0000
Message-ID: <e8b54604a28b4a35b266b5e788d92431@AcuMS.aculab.com>
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
Subject: [Buildroot] Grub2 changes since 2021.10.2
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Walter,
 Stefan" <stefan.walter@iml.fraunhofer.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do the recent changes to grub2 make it any easier to install
the version of grub2 built by buildroot?
I'm pretty sure the commands in the scripts I inherited install
grub from the host system.
This is made much more likely because the actual boot disks
are made on a second system (by production, not development).

I've tried setting the BR option to include the grub objects
in the built 'root' filesystem.
While this adds files to the image, even when booted from the
disk the grub install program fails - IIRC due to missing files.

Either the host's own 'grub install' program needs to install
these files from somewhere (I could parcel them up somewhere else)
or I need to get the 'host' version of the required binaries
into my release (they should run on production's system, the
ones from the image itself won't).

This is all x86_64 using MBR disks (EFI causes too much grief).
I understand all about the x86 boot process (I rewrote NetBDS's
MBR and PBR code many years ago), but where grub2 installs anything
(and which programs update what) seems to have been deleted
from any user documentation.
AFAICT grub writes all over parts of the disk (like the rest of
track 0?) that aren't actually reserved for boot code.

I've also got a problem where the grub build objects to /usr/bin/gcc
being earlies that gcc 5.1 (it is 4.8.5 on a Centos 7 system).
I expected everything to be built with the gcc 10 I specified.
Has this been fixed by the recent changes to the CC path in the
grub package?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
