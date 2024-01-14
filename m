Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B781DC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 09:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7381260AF6;
	Sun, 14 Jan 2024 09:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7381260AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8J78ogWSSRP; Sun, 14 Jan 2024 09:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C048460ADD;
	Sun, 14 Jan 2024 09:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C048460ADD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 852BA1BF584
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 09:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E64760ADD
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 09:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E64760ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diBB9z63BRhZ for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 09:07:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7644260AD4
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 09:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7644260AD4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ADF2813F89C;
 Sun, 14 Jan 2024 10:07:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 10:07:17 +0100
Date: Sun, 14 Jan 2024 10:07:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZaOkRaA62jR1Qf5B@landeda>
References: <20240113213859.647391-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240113213859.647391-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705223239;
 bh=ix51d2rM0bqEo//zhxRg+8DkULM5G8C0iWLWjq/4Gds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HnwmjyvsZGbc7UzthQwZNUkEhMXbdtjCj0cPAGRBPu2EL4D2xusjobAmxRsF72+vc
 W+k4N3HdBtxGl7RAjVpFnJhekscFat7VoSr3GgG2JutNbiQtNkDyw2l7qernFnZOa2
 DiWC/iS92KSfPIxacb3t0dhQrdq1/iKnLuDmQjwUy1fDACRjpVnTpcfVpz8ndrL0OL
 z6EIKX3ogiE/RaBUFPlBorItVM0ov4qlDXOai70JnVAVPjONL8t32Vn4GXyaeo61y6
 e3/TX+0l0meOzv6adBdU1b41HH1yyxxXeLQVCR63S4CGqB/Cu1I08EURK0bFx/vSwI
 aBeNxvTTS80yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hnwmjyvs
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for
 V4L cx23885 devices
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

Bernd, All,

On 2024-01-13 22:38 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/Config.in         | 6 ++++++
>  package/linux-firmware/linux-firmware.mk | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 5befe50122..488d96d973 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -600,6 +600,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CX231XX
>  	  Firmware files for Conexant Cx23100/101/102 USB broadcast
>  	  A/V decoder needed by the Linux CX231XX driver.
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_CX23885
> +	bool "Conexant Cx23885/7/8 PCIe broadcast A/V decoder"
> +	help
> +	  Firmware files for Conexant Cx23885/7/8 PCIe broadcast
> +	  A/V decoder needed by the Linux CX23885 driver.
> +
>  endmenu
>  
>  endif
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index ffb4fc2e7b..bc50d3fa39 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -811,6 +811,12 @@ LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
>  # which is installed unconditionally
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX23885),y)
> +LINUX_FIRMWARE_FILES += v4l-cx23885-avcore-01.fw
> +# No license file; the license is in the file WHENCE
> +# which is installed unconditionally
> +endif
> +
>  ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
>  
>  define LINUX_FIRMWARE_BUILD_CMDS
> -- 
> 2.39.2
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
