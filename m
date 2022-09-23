Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DC1C6FA82
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 15:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D04CE41681;
	Fri, 23 Sep 2022 15:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D04CE41681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPSZSxw1Huvr; Fri, 23 Sep 2022 15:23:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C1E40915;
	Fri, 23 Sep 2022 15:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99C1E40915
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DBB01BF2FF
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 15:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C54CE40B84
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 15:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C54CE40B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mctlclBBFP40 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 15:23:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F39F40B33
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F39F40B33
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 15:23:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 68E2A35207A6; Fri, 23 Sep 2022 17:23:11 +0200 (CEST)
Date: Fri, 23 Sep 2022 17:23:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: yann.morin@orange.com
Message-ID: <Yy3PX2eJUrQWvxw+@waldemar-brodkorb.de>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
 <20220923121334.GC2981@tl-lnx-nyma7486>
 <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
X-Operating-System: Linux 5.10.0-18-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1663946591; bh=DHcf1hjiPxJ8zX9uXjTv8Dt0F+gI8KQIYNbONGLjLJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/E+5aV7K6NYBx5XKD/wpTLeow8ggqGOc3JWzMjUM4cPr57zOcloc7LY944CTaYDM
 SeSJuLqIw3ihgm8PUvikYLuEERfZBRR5xsLTRLuE4ojVXIwGYkc28PqzFmJJoMtRZs
 Wh1gl/Ioo2olnR4HUTDV6IuuM78u6nsoMffqn2yRILowVrIJuXf0X3iCoESgI9K6vY
 rAD/DQJwzmJRNPQX/+LM79LXtWcXCWwnuXCSmno+j9Q6WEf18fH0YdQCGnHF+UGxbf
 2yn2WrT4F9RWoLjE+VBbFUOy6G75/YDEN9G/ihVzbCScqHDseaBkADuViX3FH2R0tk
 qbQv5Q3JSUOIg==
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-09-22
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
Cc: Stafford Horne <shorne@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,
yann.morin@orange.com wrote,

> Waldemar, All,
> 
> On 2022-09-23 14:13 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > On 2022-09-23 05:30 +0000, Thomas Petazzoni via buildroot spake thusly:
> > >     or1k     |           gpsd-3.24            | NOK | http://autobuild.buildroot.net/results/7adc125e843b21b559f1e8813059d65af58feb8d |     
> > 
> > This is an or1k, shared-only, uClibc-ng, LT (not NPTL) so no TLS, build.
> > 
> > So, I'm not sure to make of this issue:
> > 
> >     ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
> >     ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
> 
> So, here are a few other tests I did (each independtly):
> 
>   - revert uclibc-ng from 1.0.42 back to 1.0.41 -> still fails
>   - revert libusb from 1.0.26 back to 1.0.25 -> still fails
>   - revert gpsd from 3.24 back to 3.23.1 -> still fails
> 
> So, from the look of it, the __tls_get_addr has alwaus been injected in
> libusb [0] on or1k with uclibc-ng and linuxthreeads.
> 
> Now, is that a valid combo?

Normally I would say it is. May be this is an gcc/binutils issue?
Maybe the uClibc-ng or1k maintainer knows more? Stafford do you have
a plausible explanation for this phenomenon?
 
> Do we want to keep LT even for those arch where NPTL exists? I.e. when
> uclibc is configured with threads, use NPTL is there is an NPTL
> implementation for the arch, otherwise use LT. Thoughts?

It might be a solution, yes. But do not forget it is not that
simple, as it also depends on the binary format used, as for ARM
where pending patches for FDPIC will use NPTL and FLAT is
Linuxthreads only. Sometimes it might be useful to use Linuxthreads
to see if it is a NPTL bug or not. May be Stafford have an idea.

best regards
 Waldemar
 
> [0] I don't think it is specific to libusb, just that this is the first
> time it got noticed and investigated...
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
