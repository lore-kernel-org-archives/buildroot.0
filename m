Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6103C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BCD826B7;
	Tue, 21 Feb 2023 08:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BCD826B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJ17koP3uJYN; Tue, 21 Feb 2023 08:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F820826A4;
	Tue, 21 Feb 2023 08:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F820826A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB4D31BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94465826A4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94465826A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PD07gb6DYdr for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:21:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 054F882668
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 054F882668
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:21:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F51C60009;
 Tue, 21 Feb 2023 08:21:16 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:21:15 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230221092115.1041a5ed@windsurf>
In-Reply-To: <20230216212553.2591068-1-giulio.benetti@benettiengineering.com>
References: <20230216212553.2591068-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676967677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3NJUmRKrs354dKVLy96qyN+xT8lblP85OC+s23QYP8=;
 b=YZd+O5ys5VmTwSH1MA5WmNkUo+lf+UiDOrsdRfrI0WAYDyKvLTq0z3o2P6/TN5odVuGJDs
 /wqQH78Ux1e4dwwytlpf28KtAGVPWXaZ+Y1lQeCa9hRfIVTYSPn33Yhk0JixQM8go8B0im
 n0ZC++T9JX7kScJZCM3Gaa+NVl1oRgsWk8KYoVtE1vvvwSYqpWEPA6NgSztlJ6Y8WAPYqi
 KjeBJQV6Yau1hv9Iaj/Um5khH/mK97qJj0Y7JLVlk2ssEd6Jf7Zf1pKWi6VZIdG48Lkm1m
 QnZn1G+42x8TG06QAbW12Z47lLCM2MXBxjTaLyh09D6hbdPR3SLs0reG/cuSoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YZd+O5ys
Subject: Re: [Buildroot] [PATCH 1/3] configs/imx6ullevk_defconfig: bump
 Linux to 6.1.12 and U-Boot to 2023.01
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
Cc: Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 16 Feb 2023 22:25:51 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's also reorder BR2_UBOOT_ options by moving
> BR2_TARGET_UBOOT_FORMAT_DTB_IMX after BR2_TARGET_UBOOT_NEEDS_OPENSSL since
> this reflects the order in boot/uboot/Config.in file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  configs/imx6ullevk_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Series applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
