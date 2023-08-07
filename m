Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DC6C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E8EC409A0;
	Mon,  7 Aug 2023 21:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E8EC409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2FM5wMJ2g3y; Mon,  7 Aug 2023 21:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ACF2409A5;
	Mon,  7 Aug 2023 21:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ACF2409A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE761BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEA6A60E49
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEA6A60E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVFO_dfCFtoH for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:14:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1046860C13
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1046860C13
Received: by mail.gandi.net (Postfix) with ESMTPSA id EECEE1C0006;
 Mon,  7 Aug 2023 21:14:39 +0000 (UTC)
Date: Mon, 7 Aug 2023 23:14:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230807231438.6bfe2c7a@windsurf>
In-Reply-To: <20230807174515.3261136-1-bernd@kuhls.net>
References: <20230807174515.3261136-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691442880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykhHVSnI95Viy/R2mFdkvpEkF04cGoqDvfTQRtegq6k=;
 b=gwA7nfs5G9NWxeJ+G9/njtb4BEjcICrajPR/bZjlE36Gdc9ZDkty3d48Tfk49e8g5OBln4
 5bGaVM8AD969LfYLRtli3LHznl+/+qYistXDiuS6Idt0Vd7ka04xRXMdma/LcxK13CLe9M
 w/NvAG9Owgtng5aly5Zh9/h3EI+Sl4tj0ahat3dRkkxN+QBAQQBJoua622hYvBHPUTIQ4Q
 zWRag/OTrU7zN9IbVvWE8JlZcy912LcYr72kwBtELpzNzg7czKNZhgJxtR6HXL6XKaXUo9
 iEbuTIRhtTRxljMUoT1nyeKPwlMdo57Xt9EevpuMfs9WWJiwADhVTseh+h5NDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gwA7nfs5
Subject: Re: [Buildroot] [PATCH 1/2] package/berkeleydb: add option for
 historic dbm interface
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Mon,  7 Aug 2023 19:45:14 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Berkeley DB support in python depends on dbm, when missing python fails
> to detect libdb:
> https://github.com/python/cpython/blob/d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4002
> 
> quoting python configure log:
> checking for libdb... no
> 
> quoting python config.log:
> conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'
> 
> This patch provides a configure option for the historic dbm interface
> to be used by the python package.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for those patches. However, I don't quite understand how it was
working in Python 3.10.

I agree that in Python 3.11, they moved some detection logic from
setup.py to configure.ac. But the actual code of dbm module hasn't
changed. Back in Python 3.10, it was already calling dbm_open(), which
gets expanded by a macro from db.h into __db_ndbm_open(). And indeed in
Python 3.10, the dbm module already has references to this symbol:

$ readelf -aW output/target/usr/lib/python3.10/lib-dynload/_dbm.cpython-310-arm-linux-gnueabihf.so  | grep "UND.*__db"
    10: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_delete
    15: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_store
    23: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_nextkey
    25: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_clearerr
    40: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_fetch
    41: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_open
    44: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_firstkey
    48: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_error
    51: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __db_ndbm_close

And those symbols are not provided by libdb-5.3.so:

$ readelf -aW output/target/usr/lib/libdb-5.3.so | grep __db_ndbm
$

But, the dbm Python module works as expected:

# python
Python 3.10.8 (main, Aug  7 2023, 22:52:15) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import dbm
>>> dbm.open("/tmp/plop", "c")
<dbm.dumb._Database object at 0x767ccc28>

So I'm really confused. How does it work in Python 3.10 ? Did we
already need the historic dbm interface back then ?

Any idea?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
