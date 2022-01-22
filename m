Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EF8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 16:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F7C40240;
	Sat, 22 Jan 2022 16:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAOnw7wyhvSK; Sat, 22 Jan 2022 16:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1C84401C2;
	Sat, 22 Jan 2022 16:14:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB9061BF575
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 16:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A76D1401C2
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 16:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nw_XG8aqQASt for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 16:14:47 +0000 (UTC)
X-Greylist: delayed 00:05:14 by SQLgrey-1.8.0
Received: from mx.msync.work (mx.msync.work [95.217.65.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03AC9400DA
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 16:14:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B16B2730BD; Sat, 22 Jan 2022 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1642867770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=B+pSH3eDoCwx8qONIbfrrUyvB5jznEMG/DMGjMskvRc=;
 b=hXbIbarXEcBXVvn4ntgqb2GNDhOHdAlOohjoOF5l5BRkXUg0CC4U4iZGWVu2rue+fpwS5p
 Mbv0XpUuaKqUqJf/W+8UUeIWJqxVGWwDHczxj69Rkgkp41wgSRrKgwRZwOe31O4Ea1I0KU
 o+ID8paFtrxIvQMoALpNdBBUQG/xFB6AvPNmKWdm6HSFc9InNM0NYPN1+v00hOuM5bHk9M
 bJ2mwixzEYO+oJ0UUMurFbVYv6sGJeaavnV50VsHFRYtX+y8zsMokrPQxJ0vQdEvGP6BeI
 qdQnfU+p3GG90PfNYndnA2JaguRrpokoVIGYjXf9SbmoiXJOCjjU2btSOkTTww==
Message-ID: <1a3ce2b5-4b17-b79f-5dd5-29637575d473@lexina.in>
Date: Sat, 22 Jan 2022 19:09:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Neil Armstrong <narmstrong@baylibre.com>
References: <20220118111457.2491318-1-adeep@lexina.in>
 <20220122143327.7d1a1cf7@windsurf>
 <27eb54d9-6897-a2df-00c3-fb6dca8aba91@lexina.in>
 <20220122160914.7e4cc513@windsurf>
In-Reply-To: <20220122160914.7e4cc513@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/amlogic-boot-fip: new package
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
From: Vyacheslav via buildroot <buildroot@buildroot.org>
Reply-To: Vyacheslav <adeep@lexina.in>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi, Neil!
Can you help us with understanding license for Amlogic binaries in
https://github.com/LibreELEC/amlogic-boot-fip?


22.01.2022 18:09, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 22 Jan 2022 18:05:06 +0300
> Vyacheslav <adeep@lexina.in> wrote:
> 
>>> So how can the contents of this repository be useful? OK, then can be
>>> used locally for your own experiments. But for building an actual
>>> device that you can ship/provide to others, using the contents of that
>>> repository, because Amlogic does not even allow you to distribute the
>>> contents of this repository.
>>>
>>> So I am wondering if it's really reasonable to package this in
>>> Buildroot.
>>>    
>> You already have package/odroidc2-firmware with same license.
>> amlogic-boot-fip just put all similar binaries together and Neil
>> Armstrong made a build system for aml uboot binaries.
> 
> Well, I wasn't aware package/odroidc2-firmware was under the same
> restrictive license. Are the license terms for
> package/odroidc2-firmware available somewhere? This package is
> downloaded from https://github.com/hardkernel/u-boot, but I don't see
> the license terms from Amlogic preventing redistribution. Of course, I
> understand that they simply may be missing (which would be really bad!).
> 
> But how can anyone use those blobs? You can't redistribute them.
> According to their license, just putting them on Github is not even
> allowed.
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
