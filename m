Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D82C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 22:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D9040908;
	Mon,  7 Aug 2023 22:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D9040908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIK8npS3SOm9; Mon,  7 Aug 2023 22:08:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4527E404E1;
	Mon,  7 Aug 2023 22:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4527E404E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA4B1BF28E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3783A81A29
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3783A81A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lM38QE0IIPD2 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 22:08:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 251AE815CD
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 22:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 251AE815CD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 466111BF205;
 Mon,  7 Aug 2023 22:08:17 +0000 (UTC)
Date: Tue, 8 Aug 2023 00:08:16 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230808000816.36f1fbea@windsurf>
In-Reply-To: <20230807055936.2343266-1-neal.frager@amd.com>
References: <20230807055936.2343266-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691446097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVxQyKBR9gbtsSAZm4tJSXEUbMOWgUDAB4ky5AvT7ss=;
 b=Gp5iKu14SlV7g1JYbQk2mCaDA7ho35RjyawE233Nw+rcWOWjz2qpTv4OOZSBYEfVvQF8l5
 jeOtInTGMbUFs9htZ6JaZjJZ75a5e/PzAYH2VtcNqqa9PfayYO8n09l6Zb1w6ufc+OsgpG
 cnjPrQ7Qe2iGz/++kC9FrbVOMW9NnsumI/cBMJuCIyfHdclf2OV6shVbEsxhEeQSHdVdiQ
 F6P6eCnerR319655MNzT8Zy7lfo8n0OZIl5cXowHyAPCDOz7JtSWWl+Bpr/velEWWXJUgj
 C/hUpsQSuj+MmSFx7oWEyz44WfG6lcLx5Wi26MIEWYFWLLA8Bb+MV4pAvHq/Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gp5iKu14
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/versal_vck190_defconfig:
 bump to xilinx-v2023.1
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 7 Aug 2023 06:59:36 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch bumps the versal_vck190_defconfig to xilinx-v2023.1 which includes
> the following updates:
> 
> - Linux v6.1.5
> - U-Boot v2023.01
> - TF-A v2.8 (including mainline patches)
> - PLM xilinx_v2023.1
> - PSMFW xilinx_v2023.1
> - versal-firmware uses new github.com/Xilinx/soc-prebuilt-firmware repo
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

This mixes up updating a package and a defconfig, which we normally
don't like. But admittedly this package is heavily tied to the versal
platform, so it kind of makes sense. So: applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
