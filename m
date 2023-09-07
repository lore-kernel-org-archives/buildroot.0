Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B27EC8727
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 13:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 086AA82281;
	Thu,  7 Sep 2023 13:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 086AA82281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDvc8GEhHIwg; Thu,  7 Sep 2023 13:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D91582265;
	Thu,  7 Sep 2023 13:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D91582265
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA671BF304
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 13:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEB9060E1A
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 13:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEB9060E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1vplOpL7m4i for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 13:20:00 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D0BB60B5D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 13:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D0BB60B5D
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9DEC8353A909; Thu,  7 Sep 2023 15:19:56 +0200 (CEST)
Date: Thu, 7 Sep 2023 15:19:56 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZPnN/CZ0gJG5iwNF@waldemar-brodkorb.de>
References: <CA+h8R2oiG-nR_8rGE607Sq2RewGBbSfnJvfp46y5Dw=0q1OryQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2oiG-nR_8rGE607Sq2RewGBbSfnJvfp46y5Dw=0q1OryQ@mail.gmail.com>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1694092796; bh=eihZHnXDr93xKXm/V/01Yuz09QX0J2RGivnhyUk64D8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z2dvXye/644STs3J3ce9juiwIt3eCpo+nXvWgS4UreDJvt75HL95wu4PprvyQXT5L
 H6/KmW4Lxrw4dgivlvH39mOT/FtUitRsZBD+6DolYWUKLIvkbfKQQtGahm3pREX8OI
 6A+h7TmSRoBPLlhFqD8GGwOCzkG9ulHgz2a+T2qZOM6be+aHmkxw2UBvQTNfHG6OLr
 t6k9sEKNDn4zRz+eEjU8iipCsGlPaHbSQA8jMt3bv16IP/cSHJDk885T9WNrJQdDuc
 nPtjqMie0+jmyRLi9wqpGVM2r4yrOSCwgFDadYsN4/J7cNMUYObKrTdYaa6t2dZOXI
 HRt43W4OmkuuQ==
Subject: Re: [Buildroot] package/conmon: broken by recent change removing
 dlfcn.h
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,
Christian Stewart wrote,

> Hi Waldemar, Thomas,
> 
> A recent commit added a patch removing dlfcn.h:
> 
> https://lore.kernel.org/buildroot/ZNdpt%2FgB95HIWDAq@waldemar-brodkorb.de/
> 
> This header is needed for RTLD_NOW and causes "RTLD_NOW is not
> defined" type build errors when building for a Raspberry Pi 4.
> 
> Please revert that commit / remove that patch or otherwise fix the
> undefined symbol.

You are right, don't know what I was smoking when testing this.

Thomas, please revert.

Sorry.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
