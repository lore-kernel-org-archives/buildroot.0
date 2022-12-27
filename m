Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D971C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F4EB81438;
	Tue, 27 Dec 2022 21:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F4EB81438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxWXVnlOEN0T; Tue, 27 Dec 2022 21:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8FC5813CA;
	Tue, 27 Dec 2022 21:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8FC5813CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D40E71BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEB0B4031E
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEB0B4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TDx1ElC-AZ5d for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:58:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8009F4018F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8009F4018F
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:58:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.54])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E22B82003C6;
 Tue, 27 Dec 2022 22:58:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 27 Dec 2022 22:58:02 +0100
Date: Tue, 27 Dec 2022 22:58:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221227215802.GC2498764@scaer>
References: <20221226180353.1897840-1-bernd.kuhls@t-online.de>
 <20221227224354.3b1d1fdf@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227224354.3b1d1fdf@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672178287;
 bh=kRlr49TRDLo9UVrspZF6oFCvT4+u+LtZeP8avTvC4oI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DcVbWALINQEXQ3bpE1TxZXCPz+d/TWlHv6XqmMo/IciSU8LEHTC2kF12G7X23RV4q
 jBy4q43bBuGyslqPxOjd5Sy5wpVjfmsBNsUxrFLkXs1SuYUdARcLPsMCVjJ9MFZYzc
 UTSTVRQ6r2c/fyTMEesTqJiv9mq5sr33GVYj5y+7ksL0EXn52PWLCLXRSAjkiUVOLQ
 z30XvpJmjls5/oXddOkxcxS1IY+612tEhskztI2FKkdWwj75//2z6zi3JnH0gUrrlW
 lMATfFZAaBE0sisy2ZKCAdb+WAE6A+CPzo0l1aCQPU0TVA6TayBsCEcHsBSKQG44+D
 549Y13vuuCeOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DcVbWALI
Subject: Re: [Buildroot] [PATCH 1/1] package/dvb-firmware: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, Thomas, All,

On 2022-12-27 22:43 +0100, Thomas Petazzoni spake thusly:
> On Mon, 26 Dec 2022 19:03:53 +0100
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Do we know why these firmware files are not part of the linux-firmware
> project? They are needed in conjunction with which kernel drivers?

And there is some overlap. For example, dvb-usb-dib0700-1.20.fw is
present in both packages.

> > +DVB_FIRMWARE_VERSION = 1.4.2
> > +DVB_FIRMWARE_SITE = $(call github,LibreELEC,dvb-firmware,$(DVB_FIRMWARE_VERSION))
> > +DVB_FIRMWARE_LICENSE = PROPRIETARY
> > +DVB_FIRMWARE_REDISTRIBUTE = NO
> 
> This DVB_FIRMWARE_REDISTRIBUTE = NO is not good, as it would actually
> encourage people to violate the license of those firmware files. Indeed
> what DVB_FIRMWARE_REDISTRIBUTE = NO says is "to not mention this
> package in the manifest" and "do not copy the license files".

Wrong. _REDISTRIBUTE = NO does not exclude the package from the manifest
or from copying the license files; it only restricts copying the source
tarball and the applied patches. The entry in the manifest is still
added, and the license files are still copied.

See the comment in package/pkg-generic@1137:

  1137 # We save the license files for any kind of package: normal, local,
  1138 # overridden, or non-redistributable alike.
  1139 # The reason to save license files even for no-redistribute packages
  1140 # is that the license still applies to the files distributed as part
  1141 # of the rootfs, even if the sources are not themselves redistributed.

> However,
> several license files in dvb-firmware explicitly *require* that the
> license file should be distributed.
> 
> Quoting from LICENCE.go7007:
> 
> =====
> The firmware files included in the firmware/ directory may be freely
> redistributed only in conjunction with this document; but modification,
> tampering and reverse engineering are prohibited.
> =====
> 
> Quoting from LICENCE.xc5000
> 
> =====
> // Permission to use, copy, modify, and/or distribute this software, only
> // for use with Xceive ICs, for any purpose with or without fee is hereby
> // granted, provided that the above copyright notice and this permission
> // notice appear in all source code copies.
> =====

"all source code copies" would not apply to binary files, I would say.

> Quoting from LICENCE.siano
> 
> =====
> * Redistributions must reproduce the above copyright notice and the
> following disclaimer in the documentation and/or other materials
> provided with the distribution.
> =====
> 
> If we want to create a package for this properly, we need to have a
> mapping between the firmware files and the specific license file that
> applies to them, so that we know which conditions apply to which
> firmware file. As it is done today in this Github repo, it looks like
> some firmware files are random binaries from the Internet, with no
> clear licensing... which makes their redistribution not legal.

I had a first look at that package a while back too, and it is a bit of
a mess license-wise.

At the very least, indeed, we should restrict the way the files are
installed, a bit like we do for linux-firmware.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
