Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEFCC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 12:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E8D582034;
	Sat,  5 Nov 2022 12:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E8D582034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJQZFN1W-nUV; Sat,  5 Nov 2022 12:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D058202D;
	Sat,  5 Nov 2022 12:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D058202D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42CEF1BF82F
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 12:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9BB60A66
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 12:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D9BB60A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gODopAQVmILL for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 12:34:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 684186068D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 684186068D
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 12:34:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.11.77.72])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 43A082003EE;
 Sat,  5 Nov 2022 13:34:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 13:34:17 +0100
Date: Sat, 5 Nov 2022 13:34:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: daggs <daggs@gmx.com>
Message-ID: <20221105123417.GD3918838@scaer>
References: <trinity-5e5104ec-f62c-4643-b0ac-dfd2df7c6f42-1667640576096@3c-app-mailcom-bs11>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-5e5104ec-f62c-4643-b0ac-dfd2df7c6f42-1667640576096@3c-app-mailcom-bs11>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667651661;
 bh=znlGGl3mKYQOCBF0QcMxPhEC3Lhr0NP0wEiGcbigU0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ImHwNcTOaHJ1e+7xWAXxepwduim7vSH4dCzew1JZp3P72Uf9E/OpW+Ne+u65b6Gi5
 DFBrvKFo53mCVK+5YBsQAa+JB2qUL6MKE0snJp/qBwrXYu3OpzmMqUneWykNv/gC6n
 +jojtwXh4MedG3sJPDrP0y/Vb5zp3S0n/G6B6zIRRuCqtCJKgwEC2lNB0hEy8Ot9Vn
 gWp15iKqO6tAG5XSuSzyBO6tMu/nCWII7Yq0zVtNfyZYg+OfLZ7XR+ZDcyphdrhSFm
 Mt6/mXcHDFm1zGiTzk6eABtQh8I9RoQTmbgMiKCgCH3Q0p3SZUEjPiY5kf49ExJVJP
 nmra1d/2U9Bmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ImHwNcTO
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-04
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

daggs, All,

On 2022-11-05 10:29 +0100, daggs spake thusly:
> > Sent: Saturday, November 05, 2022 at 9:37 AM
> > From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> > To: "Dagg Stompler" <daggs@gmx.com>
> > Subject: [autobuild.buildroot.net] Your daily results for 2022-11-04
> > 
> > Build failures related to your defconfigs:
> >                          odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233868 
> I've tried to reproduce it on latest master and the didn't reproduced, any idea how to reproduce it?

Err... This is simply a case where the disk is full:

    xzcat /builds/buildroot.org/buildroot/dl/linux/linux-5.7.tar.xz | tar --strip-components=1 -C /builds/buildroot.org/buildroot/output/build/linux-5.7   -xf -
    tar: drivers/watchdog/ftwdt010_wdt.c: Wrote only 4096 of 5381 bytes
    tar: drivers/watchdog/gef_wdt.c: Cannot write: No space left on device
    [...]

I don't think there is much issue to try to reproduce...

The runner is gcc159, so probably the disk got filled with build stuff
that did not get cleaned somehow...

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
