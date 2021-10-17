Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5508DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:23:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAFD460F44
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAFD460F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62301402EC;
	Sun, 17 Oct 2021 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n76U-3_ZaqZh; Sun, 17 Oct 2021 20:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B29140160;
	Sun, 17 Oct 2021 20:23:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4803E1BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 441C34029E
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4BxxH73Nz53 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:23:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 591354029B
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:23:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8E91C7802E5;
 Sun, 17 Oct 2021 22:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634502199;
 bh=F0kgxTCgxbQMKLCRsyVoFgmm0zkIngK+UbUV/NBdOXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NlG2lF/AnFMVo0bQ4ws0EKSHV8BJ3QTZfwfF4YvY+bdKC1OcjWAgx9BdJ5vfDKtnx
 CathCHmtpmsL2inyd2NgwPD9vO2iSxi98Cty+Ewyl8HKus/eAq3y8MX99Wanx5IZtA
 SCyTHFyaaFMLshz8m+HJzJaU09CbH7wEab/3md+CTImJj/O0l1gRc2nrmhhhZb2ZwD
 QF05p5YV1grrChKa86s0/hYJafhvQ0qSY4Osgn2i+be85V9mu0m8928ZP4+iPBBckR
 QdkI4U+Qq+3wwyft4euj5Exd4b+Dow7Q/+9lBXBZ9tGHYBOnt9fuv5i9Y2FfwoDYil
 HrsskUj7fSFWg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 22:23:09 +0200
Date: Sun, 17 Oct 2021 22:23:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211017202309.GQ2400@scaer>
References: <20210921202137.7092-1-ps.report@gmx.net>
 <20210921202137.7092-6-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921202137.7092-6-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 6/6] package/rpi-wifi-firmware: provide
 convenience links for RPi3A+, RPi3B+ and RPi4B firmware configuration files
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
Cc: Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-09-21 22:21 +0200, Peter Seiderer spake thusly:
> Provide convenience links for BCM43455/CYW43455 based RPi3A+, RPi3B+ and RPi4B
> WIFI firmware configuration files to avoid runtime firmware loading warning in
> the kernel logs, e.g. (RPi3B+):
> 
>   brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2
> 
> or (RP4B
> 
>   brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt failed with error -2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've slightly reworded and rewrapped the commit log, and applied to
master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v4 -> v5:
>   - new patch
> ---
>  package/rpi-wifi-firmware/rpi-wifi-firmware.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
> index 28926ff4f0..582e0aa8f5 100644
> --- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
> +++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
> @@ -12,6 +12,9 @@ RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
>  define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
>  	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
>  	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
> +	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
> +	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> +	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
