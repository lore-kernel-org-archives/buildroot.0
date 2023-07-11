Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E241EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 20:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED1C48376E;
	Tue, 11 Jul 2023 20:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED1C48376E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5xuzsrjC38f; Tue, 11 Jul 2023 20:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DBBC836C3;
	Tue, 11 Jul 2023 20:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DBBC836C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95A381BF420
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51088836C3
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51088836C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8nIuobmcfp9 for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 20:08:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4077835A9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4077835A9
 for <buildroot@busybox.net>; Tue, 11 Jul 2023 20:08:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7432EFF808;
 Tue, 11 Jul 2023 20:08:10 +0000 (UTC)
Date: Tue, 11 Jul 2023 22:08:09 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230711220809.0060a026@windsurf>
In-Reply-To: <20230711180422.565252-1-francois.perrad@gadz.org>
References: <20230711180422.565252-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689106091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNhxumzlQ7wiPnxDn62CjD9v48yfTjAupgJm+8xYsWs=;
 b=M3UXEF944NKhikQkONcetxdGJuck4+jN1DJkxd7aK32Kp7K0pg5FIqxVvD4x32mNj6qTRL
 XJ2MrGjdR0BWKlt6WI/TEurdTjz0X2fujJmF0wReIqH3TAZNhUG6dGiLxJzQNAilGQuPEq
 YCCPdPjPdn9PaofjqMfyrmhJq5aNPcABLABloCeNHIOR0G5gAbSmXSaHaGR11Ys9AEizHv
 5EVf7k4u+bIzW06eoKHHyv3PFYPsBvX8GhdRHcPpcey9YxKBP1GuMW32oU8wmrrMQXUr8A
 6b/rSgitiq1AXUrqELCJMcREAdQyZkiTlHeBrwdTOEFFLnhM5/zBdZmWYiUxIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M3UXEF94
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 20:04:22 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++--
>  configs/olimex_a20_olinuxino_lime_defconfig  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
