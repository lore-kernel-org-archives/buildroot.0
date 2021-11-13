Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222B9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8AAB61106
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8AAB61106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA098404E9;
	Sat, 13 Nov 2021 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCjc7uVIAxkv; Sat, 13 Nov 2021 17:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DDBB403E6;
	Sat, 13 Nov 2021 17:06:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 287461BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 236FE40294
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xl9KRv3ww0wA for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:06:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 178C240281
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:06:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 52AE420002;
 Sat, 13 Nov 2021 17:06:51 +0000 (UTC)
Date: Sat, 13 Nov 2021 18:06:50 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20211113180650.45de409e@windsurf>
In-Reply-To: <20211113143857.2741808-1-festevam@gmail.com>
References: <20211113143857.2741808-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RESEND] imx/genimage: Place the rootfs at a
 proper offset when BR2_LINUX_KERNEL_INSTALL_TARGET=y
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

On Sat, 13 Nov 2021 11:38:57 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Currently, when BR2_LINUX_KERNEL_INSTALL_TARGET=y is selected, issuing
> a "saveenv" command in the U-Boot prompt may lead to rootfs corruption.

I don't see the relationship between BR2_LINUX_KERNEL_INSTALL_TARGET=y
and changing the offset of the rootfs to avoid rootfs corruption.

All what BR2_LINUX_KERNEL_INSTALL_TARGET=y does it add the kernel image
into the /boot directory of the rootfs. It makes the rootfs larger for
sure, but it would still start at the same place.

Are you sure there's any relationship with
BR2_LINUX_KERNEL_INSTALL_TARGET=y here?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
