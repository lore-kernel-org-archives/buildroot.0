Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49C3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 866D860B73;
	Tue, 28 Dec 2021 21:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIR-2LR26eUN; Tue, 28 Dec 2021 21:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC1A560B66;
	Tue, 28 Dec 2021 21:03:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6054E1BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B30440879
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wxtb59KYvK65 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:03:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4089540342
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:03:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4E841100005;
 Tue, 28 Dec 2021 21:03:15 +0000 (UTC)
Date: Tue, 28 Dec 2021 22:03:14 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Eugen Hristev <eugen.hristev@microchip.com>
Message-ID: <20211228220314.06304518@windsurf>
In-Reply-To: <20211104152329.1560933-1-eugen.hristev@microchip.com>
References: <20211104152329.1560933-1-eugen.hristev@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/microchip_sama7g5ek: add new
 defconfigs
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
Cc: Eugen Hristev via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Eugen,

On Thu, 4 Nov 2021 17:23:28 +0200
Eugen Hristev via buildroot <buildroot@buildroot.org> wrote:

> Add new defconfigs for sama7g5 evaluation kit.
> Update README with new defconfigs.
> Board uses linux 5.15 mainline.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  board/atmel/readme.txt                        |  2 +
>  board/microchip/sama7g5ek/genimage.cfg        | 31 +++++++++
>  configs/microchip_sama7g5ek_mmc_defconfig     | 26 +++++++
>  configs/microchip_sama7g5ek_mmc_dev_defconfig | 69 +++++++++++++++++++
>  4 files changed, 128 insertions(+)
>  create mode 100644 board/microchip/sama7g5ek/genimage.cfg
>  create mode 100644 configs/microchip_sama7g5ek_mmc_defconfig
>  create mode 100644 configs/microchip_sama7g5ek_mmc_dev_defconfig

I have applied both patches. On the first patch, I dropped
BR2_OPTIMIZE_FAST=y from the defconfigs, as we normally don't override
the default optimize level in our defconfigs, and I also added you in
the DEVELOPERS file for the files added for these defconfigs.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
