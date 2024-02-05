Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A8DC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 095D0417F6;
	Mon,  5 Feb 2024 10:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095D0417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyvLyhiTSouG; Mon,  5 Feb 2024 10:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA9741817;
	Mon,  5 Feb 2024 10:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA9741817
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35B041BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E9B88227F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E9B88227F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_pnezMDWh4z for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:19:39 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A217682267
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A217682267
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F0CF113FA40;
 Mon,  5 Feb 2024 11:19:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 11:19:30 +0100
Date: Mon, 5 Feb 2024 11:19:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: kris@embeddedts.com
Message-ID: <ZcC2MgwHx2F8fACA@landeda>
References: <399bbbdbc865bb5fab6fa7dbdad653f9aa240da2.camel@embeddedTS.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <399bbbdbc865bb5fab6fa7dbdad653f9aa240da2.camel@embeddedTS.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707128375;
 bh=SxPlsLZ4wOUg9+JduPkLCKAr0Qm11sWU7L6A4Fdd84I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rx7bjoo4srE6kV+Sa6jYkgxdT8NiIj8c0J95KSZ+WNjIRkwtVyyxkC+yKRTNJ9jSH
 3A+bBxcg2x1NL1lmbu6CnqJf2BmygoZYYLOGUoJZMNOHsJ/RQ93fuEcmuQBNFXrYoY
 PwQHj3hTevUpULCKxF3Bb0hTDxc9ZhrSG7qQfAIfIrfDTH4Wy+LWbSLKSFlA/UvDsF
 6/nGJAssCQA4ZMJ7/UL1nk45MiWjyJ9XL4b1oUMG28gMWkxiuAw5dlJXFbTiP33Ec5
 Axyl2oJYYzNqdvS2FBa7aZ7dk+DOCZrmdUXiWdCFltluBLjwwf5/uI6cOGLZ+OcYlI
 6p67xZ5CyAAIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rx7bjoo4
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc_firmware: bump to 16.1.2
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kris, All,

On 2024-02-01 13:59 -0800, Kris Bahnsen via buildroot spake thusly:
> From 55e8d294997af933bb3d832b73229bebefa45044 Mon Sep 17 00:00:00 2001
> From: Kris Bahnsen <kris@embeddedTS.com>
> Date: Thu, 1 Feb 2024 20:46:39 +0000
> Subject: [PATCH 1/1] package/wilc_firmware: bump to 16.1.2
> 
> Release changelog:
> - Use default values for IQ calibration correction when the eFuse
> register has zero values.
> - Fix for "WILC1000 Firmware initialization issue" by updating
> the PMU clock switching sequence during firmware initialization.
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>

It seems your patch got badly mangled, and I had issues applying it
(git-am whined the patch was empty). And I notice that the mail headers
are included in the patch. Not sure what happen. Using "git send-email"
is known to send correctly formatted patches, so maybe check if you can
do that next time.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wilc-firmware/wilc-firmware.hash | 2 +-
>  package/wilc-firmware/wilc-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
> index 802cb4f9b1..8a7957a1d2 100644
> --- a/package/wilc-firmware/wilc-firmware.hash
> +++ b/package/wilc-firmware/wilc-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  a06a6a46e03ca00d35da220f7a9f353cc650e5e5657a7988ea732913ad26d9a0  wilc-firmware-wilc_linux_16_1.tar.gz
> +sha256  6cd5fc52150520bedb736f58124063041b4d9849ea33481a8b075f51aec64f8e  wilc-firmware-wilc_linux_16_1_2.tar.gz
>  sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
> diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
> index 12c825cf92..3381162bbd 100644
> --- a/package/wilc-firmware/wilc-firmware.mk
> +++ b/package/wilc-firmware/wilc-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WILC_FIRMWARE_VERSION = wilc_linux_16_1
> +WILC_FIRMWARE_VERSION = wilc_linux_16_1_2
>  WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
>  
>  WILC_FIRMWARE_LICENSE = PROPRIETARY
> -- 
> 2.34.1
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
