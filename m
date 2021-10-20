Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F3EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:39:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB086137C
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BB086137C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C9940757;
	Wed, 20 Oct 2021 16:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HE89WcPHdyAd; Wed, 20 Oct 2021 16:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88CD4405AC;
	Wed, 20 Oct 2021 16:39:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6EED1BF372
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C33246076F
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MM40yU5OzlEU for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:39:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8224C60618
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:39:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a893:adcc:f501:21b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AFBD8780333;
 Wed, 20 Oct 2021 18:39:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634747989;
 bh=0VHWrfYhfbyyhLmjOWLC+CpElZuK5cJeQWd4TFXU3Iw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RatD0lBZYSIQSUKwgPdpz7re+TNSfOgebQ6Nsk+Y9ysANbdd3uk+jM/aolq6bbSyL
 yt723xymaKowNFYF+95xgNfkgk0uB/5ElVLU2oLf5IbW+bV7JByBgSUS4rJnyZ4353
 nPwnNW1D35B7ECQpS0t0+qvfWoulpGwB+8OMJudi9yDN+O5XhXKlIkg9dpbMwSH4E6
 gBCQKa6Q3eX4Nowe5bvwHY7YGI59sRQWzqZJ3tzAFJfzhMIL9hP70/g/RWnQSK66pH
 qoAdbvFXdJeQgFmlIynhj/rBr6b2KKfK2jKGNGt8PpdzDI3I97X/WvNiOUPnl2vhlW
 NK3zpaHzwkitw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Oct 2021 18:39:40 +0200
Date: Wed, 20 Oct 2021 18:39:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20211020163940.GB2400@scaer>
References: <20211020120327.5768-1-grzegorz@blach.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020120327.5768-1-grzegorz@blach.pl>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/rpi-firmware: Fix config.txt
 installation
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

Grzegorz, All,

On 2021-10-20 14:03 +0200, Grzegorz Blach spake thusly:
> Variable PACKAGE_RPI_FIRMWARE_CONFIG_FILE is always undefined,
> so RPI_FIRMWARE_CONFIG_FILE should be used instead.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

Applied to master, after rewriting the commit log to blame myself with
the last-minute change. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/rpi-firmware/rpi-firmware.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 8a6a435f63..0929d6af1e 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -28,9 +28,9 @@ define RPI_FIRMWARE_INSTALL_BIN
>  endef
>  
>  RPI_FIRMWARE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE))
> -ifneq ($(PACKAGE_RPI_FIRMWARE_CONFIG_FILE),)
> +ifneq ($(RPI_FIRMWARE_CONFIG_FILE),)
>  define RPI_FIRMWARE_INSTALL_CONFIG
> -	$(INSTALL) -D -m 0644 $(PACKAGE_RPI_FIRMWARE_CONFIG_FILE) \
> +	$(INSTALL) -D -m 0644 $(RPI_FIRMWARE_CONFIG_FILE) \
>  		$(BINARIES_DIR)/rpi-firmware/config.txt
>  endef
>  endif
> -- 
> 2.27.0
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
