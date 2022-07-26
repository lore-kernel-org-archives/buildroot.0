Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA21C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45B814013F;
	Tue, 26 Jul 2022 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45B814013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFIQOCrQMbSt; Tue, 26 Jul 2022 20:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5667D40116;
	Tue, 26 Jul 2022 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5667D40116
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3E111BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FEF6408F2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FEF6408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xugEGxsHGIcP for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:52:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5614408F1
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5614408F1
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:52:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F3023240009;
 Tue, 26 Jul 2022 20:52:50 +0000 (UTC)
Date: Tue, 26 Jul 2022 22:52:50 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220726225250.2d25ac5d@windsurf>
In-Reply-To: <20220517101912.3243181-1-christian@paral.in>
References: <20220517101912.3243181-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658868771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWbZ5xrTnwBNA/SytOS0rEh3wIRXUx4GA76Rs0QDH48=;
 b=A3gEjV0YTcgmT4O3LCLGHtD72SJ+zJCCBWZARMqXGb3Q2AYLZPDqhQNvKow+MAZJ+zDwVL
 ajzR1tXcHVWX7BPV9vPQieSaH2lnZXxGb9vtgIRCyXV+f38jfDUYfESihF1g25pUuliKSs
 O2jFw0drXLJHGEbx2/ixgetNFFTgZ1BHnW8Gd5rriKPTj+p7UF/vdVwC4nFweH1oVqEbrF
 XMDyNLjdfrHB7L1oz5gdKwTejkLE1jBjB7ZLjmtxKM+cVUjn1ArF9fDgbS4qsFLa8Xeofi
 dEGww2ygkYGe0RcdnKvoWEM7KaLLLlKzBIEQjesPmzt7WT85MaS6nRuoimPi8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A3gEjV0Y
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/arm-trusted-firmware: allow
 enabling without uboot or edk2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 May 2022 03:19:12 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> It should be possible to compile ARM_TRUSTED_FIRMWARE without u-boot or EDK2.
> For example, one might want to produce "bl31.bin" for use as an init stub for
> the Raspberry Pi 4.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  boot/arm-trusted-firmware/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

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
