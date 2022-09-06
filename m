Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CD0ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1279683280;
	Tue,  6 Sep 2022 20:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1279683280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oq9iEw-Uqegj; Tue,  6 Sep 2022 20:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C262831BD;
	Tue,  6 Sep 2022 20:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C262831BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBD771BF2A6
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6C3583118
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6C3583118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jE0UoKOIz5u for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:07:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508C181911
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 508C181911
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 20:07:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f72e:cac9:64c4:382d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CBBFF13F892;
 Tue,  6 Sep 2022 22:07:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 22:07:18 +0200
Date: Tue, 6 Sep 2022 22:07:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220906200718.GA1490660@scaer>
References: <20220904205702.1488199-1-geomatsi@gmail.com>
 <20220905201727.GJ1490660@scaer>
 <23566bac-ad05-3bd6-1b0b-ad4f3b3f5c20@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23566bac-ad05-3bd6-1b0b-ad4f3b3f5c20@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662494844;
 bh=+t8ZikoX6QKlSDKmn6tX2NIkcRkknyd+pZ1Q0m6Za+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VVEjmmJj4gHkVw5h2D8iRvLTQ4QuGRT7+2gkZ0WHdfxf4RiprxTsP+2HhVrkdh/6a
 B7bhIWJFA6XZZJMiIMav9zfkah69QJFXEZbmRQyS3HdhFHb+qFdbq+NmX7oFA6Tpcz
 F6Pa7O4Ij8NWJWY3/eXd5+qki4x+DuF00+Dfnzl2ejlsB/r2trQY0jZrKRGzRbbCBp
 Y8qdj5mZG0z7vdLPZpthi4YKw//936Fag3fDUsOf0Q1v4FdGu0eN2N7hj/fIGucYzv
 26BLv5LSCJUKUE09NhWQJUkf1iMrhM1Izw5jCPEyCkijElWKWCPewB6bOuth/GVmwd
 gpsLaLzBMQyXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VVEjmmJj
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: perf: add
 host-python3 dependency
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
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-06 21:46 +0200, Arnout Vandecappelle spake thusly:
> On 05/09/2022 22:17, Yann E. MORIN wrote:
> >On 2022-09-04 23:57 +0300, Sergey Matyukevich spake thusly:
> >>Linux kernel commit 00facc760903 ("perf jevents: Switch build to use
> >>jevents.py")
> >00facc760903 is only parts of 6.0-rc kernels so far, so unless one uses
> >bleeding edge technology, there is no issue. So, paying the price of a
> >host-pytohn3 build just for release-candidate kernels is a bit too much
> >in my opinion.
> >So, I added a config knob to drive this, like we have for host-openssl
> >and a few other host programs for building the kernel.
>  If only python is needed, no modules, then $(BR2_PYTHON3_HOST_DEPENDENCY)

Dang, that's right, I totally forgot about that one...

> should be used instead. That checks for python 3.4 but I think that that is
> fine for the kernel as well. If not, we should probably bump the minimum
> system python3 version.

The imports are:

    import argparse
    import csv
    import json
    import os
    import sys
    from typing import (Callable, Dict, Optional, Sequence, Set, Tuple)
    import collections

I think hey all are from the stdlib, so no external module needed

So, indeed, BR2_PYTHON3_HOST_DEPENDENCY seems a much better fit...

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
