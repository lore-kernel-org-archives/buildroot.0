Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7781C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB8460F44
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AB8460F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65ADD607D5;
	Sat,  9 Oct 2021 20:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKrZ7ApqgcD0; Sat,  9 Oct 2021 20:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE7760826;
	Sat,  9 Oct 2021 20:48:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FFA21BF3C6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A226405CE
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdabtdJAQ0S7 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:47:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1189840570
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:47:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DB262FF806;
 Sat,  9 Oct 2021 20:47:20 +0000 (UTC)
Date: Sat, 9 Oct 2021 22:47:20 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211009224720.1fe62afa@windsurf>
In-Reply-To: <20211006213728.1069-1-ps.report@gmx.net>
References: <20211006213728.1069-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/5] configs/raspberrypi*: bump kernel
 version to 24c8b05 (5.10.63)
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
 Vincent Fazio <vfazio@xes-inc.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  6 Oct 2021 23:37:24 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Now based on 5.10.63 (from 5.10.46).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - update from 3e1698e to 24c8b05 (still 5.10.63)
> ---
>  configs/raspberrypi0_defconfig        | 2 +-
>  configs/raspberrypi0w_defconfig       | 2 +-
>  configs/raspberrypi2_defconfig        | 2 +-
>  configs/raspberrypi3_64_defconfig     | 2 +-
>  configs/raspberrypi3_defconfig        | 2 +-
>  configs/raspberrypi3_qt5we_defconfig  | 2 +-
>  configs/raspberrypi4_64_defconfig     | 2 +-
>  configs/raspberrypi4_defconfig        | 2 +-
>  configs/raspberrypi_defconfig         | 2 +-
>  configs/raspberrypicm4io_64_defconfig | 2 +-
>  configs/raspberrypicm4io_defconfig    | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
