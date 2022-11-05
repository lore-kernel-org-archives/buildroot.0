Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17F3C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 12:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B24B402CE;
	Sat,  5 Nov 2022 12:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B24B402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heqgpliybs9t; Sat,  5 Nov 2022 12:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A10740179;
	Sat,  5 Nov 2022 12:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A10740179
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71CAD1BF82F
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 12:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A89040179
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 12:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A89040179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dScUPLAFUnKO for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 12:50:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC84440148
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC84440148
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 12:50:07 +0000 (UTC)
Received: from [176.231.53.223] ([176.231.53.223]) by web-mail.gmx.net
 (3c-app-mailcom-bs05.server.lan [172.19.170.173]) (via HTTP); Sat, 5 Nov
 2022 13:50:04 +0100
MIME-Version: 1.0
Message-ID: <trinity-0984207b-922e-4b6f-b8b9-e0e36c5a65f6-1667652604408@3c-app-mailcom-bs05>
From: daggs <daggs@gmx.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 5 Nov 2022 13:50:04 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221105123417.GD3918838@scaer>
References: <trinity-5e5104ec-f62c-4643-b0ac-dfd2df7c6f42-1667640576096@3c-app-mailcom-bs11>
 <20221105123417.GD3918838@scaer>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:EPn318aABiWnuBV91K5Z3VILfOa5dTNx+GtCP61Ljf0uRX3p0lCTBWzaN23ujTgdWWoZB
 XSCCURRVkJtp2cTyHUkquQrOEQUwsIDorFRHm/7o/JpJbJVJHOor1ua3b6WdkzafoK6rIQMdkAgY
 Mwz3XGM1Hhlbil0uuVvsAnxtV2BMnVOiUiDhokSjp50rIH5Oa5e18KadswzQSjTOyV4JQK6kXLZi
 z0aghSGFw3eE0Oe1Ost5/kV26mXCwB38yb5YcHXZUTwp3wsqS1LyMAuAU2sdqlEFZ9zgYAN64znC
 DE=
UI-OutboundReport: notjunk:1;M01:P0:6S5Wgx4TBis=;78oOWaY+zJUL4LiseuHLby1e53M
 mgsCrft1K5gyneXfXp19XHuRfmyhC14R3OQadRojF0KGBBLVOoX7NrgXYJ/kDfMjAMndz1DWi
 q/p5OGUuDbuxake6htt4EW7vkUiQnNA9RWdfJ1WkbxB7N1uNvvyA/jgDavySG/M77JSHxlsgB
 cEnDw9B01FC4Hg7BW/42cFFQHMc+UgAkM+LRF4jewZqDCJv4DOVm+XcTi1TCc10qc6v5/REhc
 9HUo88Pwfz9OUpKNBC5hzYwjG85xy4sG+NQYyVBFSLsxs35EEdbx/CaOpPjqlKjv06CDlsoFX
 3OQKcQjWrBae+tQBnlJVKzeBsnlK0igI4L9WLMSiyk+NbW5mCCtdS9fHiTlv4UU0GF1D4NluI
 NUkjHULZuQhgWHkdh77f8+RlTKpi9hb51DsWMrczTXGfrEw/c42YdocBBruFDnXLjazk+gkxm
 Ca8YDbqpQhBF41equ3u9boSyzzpCIoou9UBbTRsLfvx8Abn6DtVyTtC3ri6zYxmCSO3OkGfXG
 8Ca04JzXA94CvoHPMLIURUJqqhEFt8guXPqhwv2TqHzq1q/uIRTuMW2LoGnkEP9OdwAGPgtJ4
 VhGLi06o5/sfHGpb7vmM5LAuiD3jgP8+fK9SZPXt3IprXx82qoPt7jZOuCEuCYUE76g9OuKl6
 JsCT2db+kP1MmpLPiyDNg0r7up4JGUI7O2sELdRueSIkXt2D3Kl0GsoAYX6W8sLnf3hujgvi+
 VziVGNAd96wtkyxtMbbuPIlcm9zVWDr/237kCOBmjT6KqCBqpADr1NIESRWR8VzxLM3mlttco
 ZKNsVV6TESv6kBAmHEQDhrITFq1oxwdTRtDYhBxKu+Kx4=
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

Greetings Yan,

> Sent: Saturday, November 05, 2022 at 2:34 PM
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "daggs" <daggs@gmx.com>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
> Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for 2022-11-04
>
> daggs, All,
> 
> On 2022-11-05 10:29 +0100, daggs spake thusly:
> > > Sent: Saturday, November 05, 2022 at 9:37 AM
> > > From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> > > To: "Dagg Stompler" <daggs@gmx.com>
> > > Subject: [autobuild.buildroot.net] Your daily results for 2022-11-04
> > > 
> > > Build failures related to your defconfigs:
> > >                          odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233868 
> > I've tried to reproduce it on latest master and the didn't reproduced, any idea how to reproduce it?
> 
> Err... This is simply a case where the disk is full:
> 
>     xzcat /builds/buildroot.org/buildroot/dl/linux/linux-5.7.tar.xz | tar --strip-components=1 -C /builds/buildroot.org/buildroot/output/build/linux-5.7   -xf -
>     tar: drivers/watchdog/ftwdt010_wdt.c: Wrote only 4096 of 5381 bytes
>     tar: drivers/watchdog/gef_wdt.c: Cannot write: No space left on device
>     [...]
> 
> I don't think there is much issue to try to reproduce...
> 
> The runner is gcc159, so probably the disk got filled with build stuff
> that did not get cleaned somehow...
> 
> Regards,
> Yann E. MORIN.

thought so, just wanted to be sure.

Thanks,

Dagg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
