Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4220FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:14:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC6C61054
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFC6C61054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B76EE4062A;
	Fri, 12 Nov 2021 22:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YE2XUtnEZRe; Fri, 12 Nov 2021 22:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB2CC4062B;
	Fri, 12 Nov 2021 22:14:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9FBD1BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA0FD60747
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mswaqVm1T4_c for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:14:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08160606F1
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:14:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5D8FC19F4F8;
 Fri, 12 Nov 2021 23:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636755244;
 bh=NyR034EYk7zEKhRhevxoNbkpgeT8T4Ga5MHjfmmtrks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qrLBAUguCb+6hz7zNFZPyqLSzfa53+Ny5JhDXgNaDCRiiIKfa967M2ziwsEl4T7Lv
 WYGM+apXmk15JwWurmnsD1YlglATIwDNYnrLGiaRrevdo4ogEQ1Id5Hv2LY6048Fvr
 mWNQ/KqvuhIZJFHdRVG4pYCSvSjDDmnTYb7gZOcS3fWYpt1MDg1SYF/8PjHCyA/a1C
 uB7yOwpyyKMGWtVnxDMuFKvHhUsidg44oHvLeN7T2wPDVFl781YV/dRyBS99YySNl6
 1wUN5heNKPxD+vSczKeU609NSDuTqy/yDmpe+av44MnxJ64DxKBJVewP9+43CgiBZW
 fPaML4P35IlSw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 23:13:54 +0100
Date: Fri, 12 Nov 2021 23:13:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211112221354.GF247986@scaer>
References: <20211111200439.15379-1-ps.report@gmx.net>
 <20211111200439.15379-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111200439.15379-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next v1 2/7] package/rpi-firmware: bump
 version to fa9a006
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

On 2021-11-11 21:04 +0100, Peter Seiderer spake thusly:
> Changelog (since ):

Changelog was missing, I added a crude copy-paste of git-log from
upstream.

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index 0ff7a73a37..7cbfd1b249 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  80af5efb51677edb7af6746a553dc2d8ad3f532ff44e4b7263f1e12d4bf72ffd  rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342.tar.gz
> +sha256  a079a31fc80a23421589edcacef94faa713b12d3e77b92710ae2594c8d549477  rpi-firmware-fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25.tar.gz
>  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 3a4741a0ff..5e8b0379ba 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPI_FIRMWARE_VERSION = 2ef3800b1b71c0e30c2a61ecad6e007ae96ea342
> +RPI_FIRMWARE_VERSION = fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25
>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
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
