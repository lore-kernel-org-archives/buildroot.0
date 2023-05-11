Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E632CC7EE22
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BF81820C8;
	Thu, 11 May 2023 20:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF81820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drYwT9f-V94R; Thu, 11 May 2023 20:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B505081FD2;
	Thu, 11 May 2023 20:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B505081FD2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7C111BF283
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF98C41F07
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF98C41F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KM8hP7y9V7yI for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 20:18:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94A7941F03
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94A7941F03
 for <buildroot@buildroot.org>; Thu, 11 May 2023 20:18:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b925:bb32:bfe1:7e0e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A198A20039F;
 Thu, 11 May 2023 22:18:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 May 2023 22:18:45 +0200
Date: Thu, 11 May 2023 22:18:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <20230511201845.GL252090@scaer>
References: <20230511175913.2360697-1-kris@embeddedTS.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511175913.2360697-1-kris@embeddedTS.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683836329;
 bh=CWg5ZJEmUregaJdboE+bSahiM20mj+VCsI0dW2AODbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TRn2bHEWtEa90vc3Z3emE0Ud7zotRAWuqgeaJUvEtTJN5u0rfJJux0VG8u8+sucad
 UNff78TZHngjanFts8i5HicCLiIaz7rtQC2bWc03XX218ZCS4pWmC056H9Vtxf9Z3W
 JDP0jBAdhlAqWhPhutUDsyKlA+MhHUKXywSQBLaLiz9pZ7WkTyCi/TWdCPG+7QaXYT
 VNoJjcUqs4uOJJ5bPxRo7ds0vzA5LSyrAtll3R/FFhWdIptNJ1n8O8N2qqklA2C+sj
 zuq6SqVz7EGOinv/eOzQuovwb+OnjdNb9d6Btd7Y9J42cqPtnLH6zE0rYV+jA1xZKB
 3UgxFOqyGi06A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TRn2bHEW
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-firmware: bump to 16.1
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
 Mark Featherston <mark@embeddedTS.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kris, All,

On 2023-05-11 10:59 -0700, Kris Bahnsen via buildroot spake thusly:
> According to release notes from Microchip, this fixes a memory
> leak in AP modes, fixes a failure with an undisclosed but specific
> AP, and re-certified with WFA for WILC1000.
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wilc-firmware/wilc-firmware.hash | 2 +-
>  package/wilc-firmware/wilc-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
> index 6e7850df16..802cb4f9b1 100644
> --- a/package/wilc-firmware/wilc-firmware.hash
> +++ b/package/wilc-firmware/wilc-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  2c2e2927a65fe4d7ec2f9872fca35c6b7bf12090ac62116d63c5f17b95a3a786  wilc-firmware-wilc_linux_15_7.tar.gz
> +sha256  a06a6a46e03ca00d35da220f7a9f353cc650e5e5657a7988ea732913ad26d9a0  wilc-firmware-wilc_linux_16_1.tar.gz
>  sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
> diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
> index e31829d430..12c825cf92 100644
> --- a/package/wilc-firmware/wilc-firmware.mk
> +++ b/package/wilc-firmware/wilc-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WILC_FIRMWARE_VERSION = wilc_linux_15_7
> +WILC_FIRMWARE_VERSION = wilc_linux_16_1
>  WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
>  
>  WILC_FIRMWARE_LICENSE = PROPRIETARY
> -- 
> 2.40.1
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
