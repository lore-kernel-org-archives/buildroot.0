Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23359C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE8AA81450;
	Mon, 31 Oct 2022 12:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE8AA81450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iB7x7Tp7fT21; Mon, 31 Oct 2022 12:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C83381434;
	Mon, 31 Oct 2022 12:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C83381434
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F65B1BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 385BE60B20
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385BE60B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-rZLHJoB20k for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:40:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2503060008
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2503060008
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:40:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 525E1B0053E;
 Mon, 31 Oct 2022 13:39:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 13:39:28 +0100
Date: Mon, 31 Oct 2022 13:39:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tim Gover <tim.gover@raspberrypi.com>
Message-ID: <20221031123928.GB1058960@scaer>
References: <20221031114643.6648-1-tim.gover@raspberrypi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031114643.6648-1-tim.gover@raspberrypi.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667219973;
 bh=X2sGjDY/7OBM+TB2tITv2YMS5QhZdjx/ytWrLFV3kTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oscqiEqhZGZ6qtgbfk+DBAJu6dzHwoIItRzsIWqUJHQg7ORZZOkWmosru5Uss1WPr
 QUyN/cyaMhy7tNU+BiRvCVfBk2BrdlT4yuxkz1KFBPxfn5Bboy4brN9TIXSQmn8mQ0
 hd7v5Vvg8T7/RpymR1MF/p24Lkc/RUfX2CMG9ED2SNhz2lZU6giC+Hy5rTYycpJ0+3
 zJ9sH+EM7nfTrivEHI3AcXe91cmxOJsb0+AErsSPpnTpbdODl8SzSzBNKmdzCczwYF
 iAVmr4MIoBDkfnyGcDywQ/BkLea24iJO6B2FGmWEp/xk0n64nxH+dCF6A5qwdj0xrk
 qOAeVuF2SQWFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oscqiEqh
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: add
 overlays/README
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tim, All,

On 2022-10-31 11:46 +0000, Tim Gover spake thusly:
> If a custom os_prefix directory is specified then the Raspberry Pi
> firmware probes for the README file in overlays directory.
> 
> Since the README file is small let's include it, otherwise,

197KiB is _not_ small. In fact, the README is bigger than every dtbo,
and accounts for ~25% of the size of all dtbo combined.

> the firmware won't recognize the overlays directory if the user
> later moves it to an os_prefix specific sub-directory.

What is the goal here, in the context of Buildroot, where we only
install one set of overlays?

If a user moved the overlays, they already have a script that does that,
so they should also ensure that script properly prepares config.txt to
specify the proper os_prefix, and so it is just a matter of adding a
'touch' on the README in the same script.

Regards,
Yann E. MORIN.

> From
> https://www.raspberrypi.com/documentation/computers/config_txt.html#overlay_prefix
> 
> Unless ${os_prefix}${overlay_prefix}README exists, overlays are shared
> with the main OS (i.e. os_prefix is ignored).
> 
> Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index d4d1d07b3f..908d7def6a 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -48,6 +48,7 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>  	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
>  		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
>  	)
> +	$(INSTALL) -D -m 0644 $(@D)/boot/overlays/README $(BINARIES_DIR)/rpi-firmware/overlays/
>  	$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DIR)/rpi-firmware/overlays/
>  endef
>  else
> -- 
> 2.25.1
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
