Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A640C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C730C4013F;
	Wed, 29 Dec 2021 09:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tI_amc4zwVqH; Wed, 29 Dec 2021 09:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3324F400C7;
	Wed, 29 Dec 2021 09:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81F531BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BEE960AC3
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qycJce880KDV for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:19:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C06C60808
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:19:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 65C3BE000A;
 Wed, 29 Dec 2021 09:19:10 +0000 (UTC)
Date: Wed, 29 Dec 2021 10:19:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Eugen Hristev via buildroot <buildroot@buildroot.org>
Message-ID: <20211229101909.40edab29@windsurf>
In-Reply-To: <20211229084809.39991-1-eugen.hristev@microchip.com>
References: <20211229084809.39991-1-eugen.hristev@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/microchip,
 atmel: update Linux kernel to linux4microchip 5.10
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Dec 2021 10:48:09 +0200
Eugen Hristev via buildroot <buildroot@buildroot.org> wrote:

> Linux4sam has moved to linux4microchip.
> First linux4microchip release for the SAMA & SAM9X60 boards is
> linux4microchip 2021.10.
> Bump all boards to use this kernel version.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 4 ++--
>  configs/atmel_sama5d2_xplained_mmc_defconfig           | 4 ++--
>  configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 4 ++--
>  configs/atmel_sama5d3_xplained_defconfig               | 4 ++--
>  configs/atmel_sama5d3_xplained_dev_defconfig           | 4 ++--
>  configs/atmel_sama5d3_xplained_mmc_defconfig           | 4 ++--
>  configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 4 ++--
>  configs/atmel_sama5d4_xplained_defconfig               | 4 ++--
>  configs/atmel_sama5d4_xplained_dev_defconfig           | 4 ++--
>  configs/atmel_sama5d4_xplained_mmc_defconfig           | 4 ++--
>  configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 4 ++--
>  configs/microchip_sam9x60ek_mmc_defconfig              | 4 ++--
>  configs/microchip_sam9x60ek_mmc_dev_defconfig          | 4 ++--
>  configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig     | 4 ++--
>  configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 4 ++--
>  configs/microchip_sama5d2_icp_mmc_defconfig            | 4 ++--
>  configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 4 ++--
>  17 files changed, 34 insertions(+), 34 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
