Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F695C433F5
	for <buildroot@archiver.kernel.org>; Fri, 20 May 2022 10:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88355424D3;
	Fri, 20 May 2022 10:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ksyaNazHv43; Fri, 20 May 2022 10:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5047141960;
	Fri, 20 May 2022 10:17:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7D11BF33E
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 10:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59F8741101
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 10:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFe_l1tUMfDw for <buildroot@lists.busybox.net>;
 Fri, 20 May 2022 10:17:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3948440A6A
 for <buildroot@buildroot.org>; Fri, 20 May 2022 10:17:39 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-310-vmaseRuZNb6Qg-Ip-NGUSw-1; Fri, 20 May 2022 11:17:36 +0100
X-MC-Unique: vmaseRuZNb6Qg-Ip-NGUSw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Fri, 20 May 2022 11:17:36 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Fri, 20 May 2022 11:17:35 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Baruch Siach' <baruch@tkos.co.il>, Ugroon} Hackerone <h1ugroon@gmail.com>
Thread-Topic: [Buildroot] How to run an executable file
Thread-Index: AQHYbAqWwcaN7nShykqzTzhUtKf8Qq0njVyQ
Date: Fri, 20 May 2022 10:17:35 +0000
Message-ID: <55a1dc0b3ba345a6adb4e98c0faf5353@AcuMS.aculab.com>
References: <CAJiigQmUmhkv+AMuz2eF1kbi=_-VGEAmWTN40aUbvbTqA9+5dQ@mail.gmail.com>
 <87czg8n55k.fsf@tarshish>
In-Reply-To: <87czg8n55k.fsf@tarshish>
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
Subject: Re: [Buildroot] How to run an executable file
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

From: Baruch Siach
> Sent: 20 May 2022 06:25
> 
> On Fri, May 20 2022, Ugroon} Hackerone wrote:
> > I have an executable file and when I try to run it with "chmod +x
> > file" and "./file" I'm getting command not found: ./file error. So I
> > just want to learn how to execute this file?
> >
> > Note: The output of "file file" is Elf x64
> 
> The most common reason for "not found" error on running an executable is
> that one or more of needed shared library is missing. The command
> 
>   readelf -d file
> 
> will list the needed libraries, as well as more information on the
> dynamic section of the ELF executable. Make sure you have all listed
> shared libraries.

You can also be missing the required 'elf interpreter'.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
