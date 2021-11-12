Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E878AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:18:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952BD60ED4
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 952BD60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A0BB40183;
	Fri, 12 Nov 2021 22:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pXpq-MCbd60k; Fri, 12 Nov 2021 22:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 003B04018D;
	Fri, 12 Nov 2021 22:18:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ABCA1BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87D6280CAA
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHHcZQ3FljUm for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:18:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7719980BF7
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:18:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D316219F57C;
 Fri, 12 Nov 2021 23:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636755498;
 bh=+rAYZRhHjeh89GFfe62z8uMmMn//4VtK6fzUddGeVvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kqNTmnXwD7SL8a2Eos2RZNUNk8G4rVg+VPeiyWY7DaeXFRqvcwQ2EDrqQRz3LFpyf
 ZeW843Gv2sBpw1/1yHGyMaOxPfV0Hm/pyOs/0SjoVzK+EUHkghgDOwUe6Rx7H/noyD
 LPMhCnt6tOyu6bo1m9wPT6m+MhjBVRxWyo8Ff+ZU67+UcxMhSVuie9qR4ffovOXyeG
 /NPhkkBL6nnqMFM2eJ7xpFwB2K/+XRbaKNpEneBc6JlkxPCT/CS4V5Z37STvVdo34B
 OTCP6BECm+3e5YCpMdfelQ3babjrj8YhUYsMbXwOjHAnjT1qQfp+XiESvB9K12Q75V
 ARLV0Vomszy9w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 23:18:07 +0100
Date: Fri, 12 Nov 2021 23:18:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211112221807.GH247986@scaer>
References: <20211111200439.15379-1-ps.report@gmx.net>
 <20211111200439.15379-4-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111200439.15379-4-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next v1 4/7] package/rpi-bt-firmware: bump
 version to 3888ba2
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
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-11-11 21:04 +0100, Peter Seiderer spake thusly:
> Changelog (since 883b726):
> 
>   - 3e020f7 Add 43436S firmware
>             Future Zero 2 W boards will have an alternative version of 43436
>             that should have different firmware, named brcmfmac43436s-sdio.
> 
>   - 3888ba2 Merge pull request #18 from HiassofT/43436S
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to next, thanks. But see below for a comment of mone...

> ---
>  package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
>  package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
> index 3f37d964d0..7e60aa4632 100644
> --- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
> +++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-bt-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
> +sha256  9bd61431d42322eb0610bd7eed218da255c4472efc203be4332a0872bb562ade  rpi-bt-firmware-3888ba29898bb3f056d5f1eb283cb8de4c533bef.tar.gz
>  sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
> diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
> index 13358b4fda..8d658ce435 100644
> --- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
> +++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPI_BT_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
> +RPI_BT_FIRMWARE_VERSION = 3888ba29898bb3f056d5f1eb283cb8de4c533bef
>  RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))

Why do we have two packages that come from the same upstream repository,
at the same version, and basically just both copy a bunch of files?

Can't we have a single package instead, that also is named after the
upstream repository, and that has two options, each to install either
the BT or WiFi firmwares?

Regards,
Yann E. MORIN.

>  RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
>  RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
> -- 
> 2.33.1
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
