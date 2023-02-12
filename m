Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BA4C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E29C8175B;
	Sun, 12 Feb 2023 20:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E29C8175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_wZC5MgmbwS; Sun, 12 Feb 2023 20:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A06F5815CA;
	Sun, 12 Feb 2023 20:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A06F5815CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07B151BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D59EA408FB
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D59EA408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axJY60WMu6wL for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:21:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F16E408C6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F16E408C6
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:21:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1CF825FFA5;
 Sun, 12 Feb 2023 21:21:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:21:39 +0100
Date: Sun, 12 Feb 2023 21:21:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230212202139.GP2796@scaer>
References: <20230212163322.480467-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212163322.480467-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676233302;
 bh=h07gYaCh2Aur6DqCvyRv1lFW+ZY47UktiCOGWHqXcKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DGEg609WuoMH7W2Jap60haDEox8vtbXDYUEPhBYg/p/UAiP6DU1L51ZT+evbzeTJr
 4hDkeMjX4e8FrAt3Yimx7/Q/h1tcTG6U6v0IwvN142/6lPG2hE5H+jxDHxX2WLvzFF
 KUzsxWHESDCv1mjOnUUGelRhlXdNQkxPp711Z/ukwf2rgtYIaH0pmAzlgAX2D8gOpf
 fivLP95lwIj0cMp02ehO1cD6KLrgUE0dnbVuz8umKeKcv8nZXQQQtWcUP8/VT8nlnr
 Zl/zKgY4w9KqPkZZy0aWIhT0Az6fcsqcsFIeLvRgLa2JeodC1eTOIxA2mknco/VQQG
 2xNA7MR8DacLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DGEg609W
Subject: Re: [Buildroot] [PATCH 1/2] DEVELOPERS: reorder entries for Julien
 Olivain
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-02-12 17:33 +0100, Julien Olivain spake thusly:
> Entries for "gnupg2" and "test_python_hkdf.py" were not at the right
> position.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ae698f87c5..ece0d986ae 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1685,8 +1685,8 @@ F:	configs/spike_riscv64_defconfig
>  F:	configs/zynq_qmtech_defconfig
>  F:	package/fluid-soundfont/
>  F:	package/fluidsynth/
> -F:	package/gnupg2/
>  F:	package/glslsandbox-player/
> +F:	package/gnupg2/
>  F:	package/octave/
>  F:	package/ola/
>  F:	package/perftest/
> @@ -1716,8 +1716,8 @@ F:	support/testing/tests/package/test_ola.py
>  F:	support/testing/tests/package/test_ola/
>  F:	support/testing/tests/package/test_perftest.py
>  F:	support/testing/tests/package/test_python_distro.py
> -F:	support/testing/tests/package/test_python_hkdf.py
>  F:	support/testing/tests/package/test_python_gnupg.py
> +F:	support/testing/tests/package/test_python_hkdf.py
>  F:	support/testing/tests/package/test_python_magic_wormhole.py
>  F:	support/testing/tests/package/test_python_pyalsa.py
>  F:	support/testing/tests/package/test_python_spake2.py
> -- 
> 2.39.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
