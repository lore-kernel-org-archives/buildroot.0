Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A0C7EE24
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80610822DB;
	Mon,  5 Jun 2023 07:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80610822DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSqq0ocYOwpW; Mon,  5 Jun 2023 07:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C59B9820CD;
	Mon,  5 Jun 2023 07:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C59B9820CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CCBA1BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43BBC40472
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43BBC40472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwazGq4QwsxP for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:48:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D6044051F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D6044051F
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:48:08 +0000 (UTC)
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B4D51BF20C;
 Mon,  5 Jun 2023 07:48:06 +0000 (UTC)
Date: Mon, 5 Jun 2023 09:48:05 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230605094805.2a82c9fd@booty>
In-Reply-To: <20230530071558.24994-2-neal.frager@amd.com>
References: <20230530071558.24994-1-neal.frager@amd.com>
 <20230530071558.24994-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1685951287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxkoZWgnqc9j2WvYzLJKhAFxXX3Rl/GAMLvhloysSmk=;
 b=UXrrsRvhboE8jWj4k2NLLSvrFvGqzHOHUcG9qfUdzzvLvFZGeq1OgYYTZtjwYJNf5GOdCV
 p/0dKh1Fcoup40j8u5B7uPw45rKegnU/mUzfKJWvOsyqr4pzZqgDghJ5nhK8mU872tKiTZ
 OXGR7EnAgZkhyhFr9H5+RMWpY3PQCVkCMs/79+/vTo63yxBggsF8ZP6N242C9nb4QehrHF
 gStEV0ox3ZN0Ca2kMgMZzyM/6+mQBGjtLCorml6JDHa+zdSPenZhXZ/Omrx6ZxsUtf4hk0
 Q8Jq9I3JMpAlG4Szx2HqsV/Ek9XfKAdWw5HBPqjIOx5hED8CKygy3uMWO+vKsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UXrrsRvh
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 30 May 2023 08:15:58 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_zcu106_defconfig to xilinx-v2023.1 which includes
> the following updates:
> 
> - Linux v6.1.5
> - U-Boot v2023.01
> - ATF v2.8
> - PMUFW xilinx_v2023.1
> - Updated pm_cfg_obj.c from Vitis v2023.1
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
