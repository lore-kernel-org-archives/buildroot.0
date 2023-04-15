Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3134FC77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 17:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC5B8845A0;
	Sat, 15 Apr 2023 17:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC5B8845A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NuLR1mbE1nG; Sat, 15 Apr 2023 17:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D735845C2;
	Sat, 15 Apr 2023 17:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D735845C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33B131C3F78
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C7766115C
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C7766115C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0O-GYi4FYOEk for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 17:57:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3113461142
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3113461142
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 17:57:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8082F5FFAC;
 Sat, 15 Apr 2023 19:57:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 19:57:18 +0200
Date: Sat, 15 Apr 2023 19:57:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20230415175718.GS2819@scaer>
References: <20230401173700.3341224-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230401173700.3341224-1-geomatsi@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681581440;
 bh=u95KmIf1zsK86tso/VBDk8TWz+Sko3fI1mavdCQQg48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zn9HT95t3qbXSNSDYn5/h7T0ZhnGDIhhC0iJrYw5ugOh4ejrlQ1DU6kXpK1ft/j7C
 L06rQ4162qavnOSW0/avRH1l1Uyo+FTTQzrSzAycgOqiwNPtv4HIvi0grupwrENkas
 WOt80PIXIy7CifaS945iOAg0xfLbft0Qqa+dHT5+vg8bxHhWoU6D/tU51m5jpBQNm+
 wWXc/YwfJe8Pz7ArzbCZiRgdkbVzLxU1IkhmfcOew0grNNvrVu4SOTpc6P51wX2X46
 bs1TmevuOjAZhodxiCXRmVj+ek4iJx/seeWLYnHSQVecpac9pTcqNug6b98aGUqpnQ
 2FPokmDre+/SA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zn9HT95t
Subject: Re: [Buildroot] [PATCH 0/3] allwinner: arm: misc BSP updates
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

Sergey, All,

On 2023-04-01 20:36 +0300, Sergey Matyukevich spake thusly:
> Hi all,
> 
> Here is a patch series with BSP updates for several boards with Allwinner
> arm CPUs. U-Boot version updated to 2023.01 and Linux version updated
> to 6.1.14.
> 
> Note that orangepi-zero and orangepi-zero-plus2 are not updated in this
> patch series. I observe WiFi issues on those boards with Linux v6.1.
> So those issues need to be investigated before updating BSP.
> 
> Regards,
> Sergey
> 
> Sergey Matyukevich (3):
>   configs/linksprite_pcduino_defconfig: bump BSP versions
>   configs/orangepi_one_defconfig: bump BSP versions
>   configs/orangepi_pc_plus: bump BSP versions

Whole series applied to master, thanks!

Regards,
Yann E. MORIN.

>  configs/linksprite_pcduino_defconfig | 6 +++---
>  configs/orangepi_one_defconfig       | 6 +++---
>  configs/orangepi_pc_plus_defconfig   | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> -- 
> 2.40.0
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
