Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E5CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 22:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F93C61208;
	Thu, 24 Feb 2022 22:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HtpVcVgoiHK; Thu, 24 Feb 2022 22:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA8FD60A9D;
	Thu, 24 Feb 2022 22:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0E51BF2FD
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 22:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69783833D3
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 22:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id it7B8XHYLPV9 for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 22:07:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1CD282F40
 for <buildroot@busybox.net>; Thu, 24 Feb 2022 22:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645740466;
 bh=oCaENlBAO5Z57cx+Hzxu3p01UW73970rf2HvBqVtyko=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dR1APwhmot9bcCpm8bZrnO/SuX+svlgHbhiPhCaLVhExI2AnWxpP5TYv1XljmV+pS
 LCkWQ9+L3fYu8H7Z9pCs4xIzU+WEhPUBFH3mW0GLQzlfne3i1Gg83q8zeaEtoCAIX+
 zKHcGvrJ7WitE0U2x54S7SyWZmIm0Qu9p8H4x7D0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.189]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1nK514248a-005YXy; Thu, 24
 Feb 2022 23:07:46 +0100
Date: Thu, 24 Feb 2022 23:07:44 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Guillaume Bres <guillaume.bressaix@gmail.com>
Message-ID: <20220224230744.1306f790@gmx.net>
In-Reply-To: <CAJe0E3fs9xSP3jEQ__1_6JWRLYTMMywouQdF6kVKCu=4ykf2Bg@mail.gmail.com>
References: <CAJe0E3fs9xSP3jEQ__1_6JWRLYTMMywouQdF6kVKCu=4ykf2Bg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:1UX42Az8HlalrdfRsRxdLJU9dx08qaeejFdwCKY4pfm1CVlHu13
 M4th12bwHFtyLC/yUcVjG8uC8Dch+z3SYT5Vb7JUCGLGDahSe07V0xlYws0G2kWRu85JkVY
 YBYgUe/rSqMfHoWaqCqv5mHJADX5Zv0EjD+kqheXsXObJL/iEKqa+/zKMqvMKEa9BuqbT5E
 YVJ8mGAvVSNqRZFrQIgSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ck+UtBOBGcQ=:60+luI8KUXxqoxhFNE41aP
 A7P7PZh2pNOqS4SRpRdgbQWNIlYftrAD3uwlW3dyA76GT/J5tTt6Qhni2BfD987CzY8mDoTvb
 88eN5tivvhWgh+GPzDQK/g8WX5BplT/pEJwxYbVHIn9iz/pcMojHqO2a+kSD14mc3b3JAhLgx
 kaxW1gUQX0/18LfXmJ39szhw5ocLIvjXbhI9EBKx9mX3m6dfU4XzOvtYatT0REnvvj8WhHW2f
 nNX22987K63MzfOh0FyUa0e8U1ToqY4OlPo28JJo5XcB9bdhLLns3RmSMDktkBpalGqOkwLu8
 1ftNQMoBGFgGmhrJO7ciHABboL/g/SIJgysGZG+jejs9LJUCTer5uNcCWsJ8NYyPtnOuiFNMd
 fm69rGa+a+9z/NyYXXV5aGA+dCdzLsGKk9yl2J/pzTPZQyxvpngmRGr2aJOc7BMZObca/8k7T
 52b8TMLtqea7XAxo1RW0qRyvtMyhldNT2pz6l5nZElNhuY87MPSs3o8HiOJ8DqsPCDfadWej0
 B3TkiwQOaJLkRbUMgXfPUWabDnsiDwlxc5Iza1JPys+x4/B/dmGIuMVQlQjZEBvV79s3Bib4J
 09IWyMxnP6rv4hPndoTgTFaDE1VL51JvBM0s53PpAnPTDNz9GJsYtMnbK6HP0XCaTfSm7u/K6
 6JDpcqHIqYYt7WEuB6aYieA6/RqrxS+32aLm2XcT98ufwI7hKh/NoOU55eC+GsOO5SI1/pGHT
 DfoRhmv6AGcqSakgrp8kLLl/gQQ7xgOoy8hVASmVnzySdtxumMhvJ2o+2VFRa40RMzDzw2jGx
 eyiMZvLSXKOWesVK+FQ2BO9ESZtDcbamVbKi+2/rhYDSysDZC41L2nCgiofDg0uDn0Rk/qMgm
 UhLPDSDZ6YfSM9qkrtLoDu53m9Ri9q6+5hR0JRX+WJ644J0WEiJTjE3Iextuo6MniLZlDEuFJ
 BgLO+aHBqRa1OUgjJOaby/SGz5p11KCUVoGRpaI1VeH+8ws9+EdOXkX0L3fX1ytXnU8MHw0oE
 c5Zly5AFgplhL6ZlASQlJwb6p5gfeNk29LibUOE9guU3S75MHMa1Czg5lshCTI3GDHC53mQdq
 CyleDghRpEKaKY=
Subject: Re: [Buildroot] [v3] package/ntpsec: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Wed, 23 Feb 2022 18:51:59 +0100, Guillaume Bres <guillaume.bressaix@gmail.com> wrote:

> Hello Peter,
>
> sorry for the delayed test, the usual "busy on too many things".
>
> Today I ran the current patch serie on "zedboard_defconfig": everything
> works fine but SYNC is never fully acquired. The estimated "offsets" from
> the pool is close to 2^32 (limit?), jitter is large, delay is realistic,
> but those values never get averaged out.

Do you mean 'zynq_zed_defconfig' or do you work on an legacy buildroot version?

Can spot nothing special in the defconfig despite an ancient linux kernel/headers
version (4.16, or 3.18 in legacy zedboard_defconfig)...

Anything special in the config file?

> What do you think is going on? I don't think it's related to our work but
> to the demon itself.

Maybe better ask at ntpsec mailing list/bugtracker ([1])?

> v1_2_1 is fairly old, I hope they provide a new tag soon because a lot of a
> work has been accomplished in the meantime.

New release seems to be scheduled for end of this month [2]...

>
> At work we use our custom fork (for custom encryption), I rebased to master
> last week, I have never experienced such behavior.

Did only test/run on raspberry pi 3/4 (both 32 and 64 bit, glibc, uclibc)...

Regards,
Peter

[1] https://www.ntpsec.org/channels.html
[2] https://lists.ntpsec.org/pipermail/devel/2022-February/009961.html

>
> Guillaume W. Bres
> Software engineer
> <guillaume.bressaix@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
