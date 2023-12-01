Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E90C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 10:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E11D847D6;
	Fri,  1 Dec 2023 10:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E11D847D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eiJRD0G-fl0Q; Fri,  1 Dec 2023 10:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782C2847D9;
	Fri,  1 Dec 2023 10:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 782C2847D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA15C1BF344
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0D78847C1
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0D78847C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOtxuR1Q3dTm for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 10:04:32 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDBCD847D6
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 10:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDBCD847D6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4c68:322b:52a4:6805])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0BAF62003CA;
 Fri,  1 Dec 2023 11:04:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 11:04:24 +0100
Date: Fri, 1 Dec 2023 11:04:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bram Oosterhuis <dev@bybram.com>
Message-ID: <20231201100424.GM3177259@scaer>
References: <20231104220152.3252635-1-dev@bybram.com>
 <20231104220152.3252635-2-dev@bybram.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231104220152.3252635-2-dev@bybram.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701425070;
 bh=yqJ+0tfVY3rBjbXKC1Oc7QquOr1jNfgXRb44spdW/QA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ujOjcWsSEX+11Nqt+H0F41K0/BZ/UQ0ji2/U/pRxTHcpFzYpNPzYuwsMO648D9hfG
 tn5RvwxmIwU4W5r5DF1oyeoikwJTFQIqz+5X+DlG8t+Dp8B7RaiKhlfbT63lZ8TgdB
 SCuLAp7aFY2MFALaaO+ERX3J4wPPiubGalZOC+VnSriYIncmWcvhmewxeI2t1h5Ihs
 17ZA2PjUIuvlUXDx6mP6YNi/WAZlf5BeQAXmeACpq+H4fb3/G+qtu/FPHfgWTnrzFp
 27wQ8fX9Rm4StlzFzM7pjmHuUXDLaVeR2F2jwN4OtqA4XUIvDs6DEInz6/RMl5R4CH
 vCxsjIOoEULPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ujOjcWsS
Subject: Re: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 83dafbc
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bram, All,

On 2023-11-04 23:01 +0100, Bram Oosterhuis spake thusly:
> Version 83dafbc will match the with kernel 6.1.61
> 
> Signed-off-by: Bram Oosterhuis <dev@bybram.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index ec13115f3b..33e05a2f4a 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  33aea2cb9c3be94c3dd6a96fbb3443eee5af1dc5fc9140e1fadc50832983064e  rpi-firmware-3f20b832b27cd730deb6419b570f31a98167eef6.tar.gz
> +sha256  dd43e77ca1a8969cdb7f05dd72a57f90862071d5a93bdd6aea8246aba85689cf  rpi-firmware-83dafbc92c0e63f76ca2ecdd42462d56489d1c77.tar.gz
>  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 53d6d8ca06..37e010d1de 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPI_FIRMWARE_VERSION = 3f20b832b27cd730deb6419b570f31a98167eef6
> +RPI_FIRMWARE_VERSION = 83dafbc92c0e63f76ca2ecdd42462d56489d1c77
>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
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
