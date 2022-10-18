Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1CBC43219
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 07:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A4A040A8F;
	Tue, 18 Oct 2022 07:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4A040A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-guoqLa5uNx; Tue, 18 Oct 2022 07:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A923640A5F;
	Tue, 18 Oct 2022 07:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A923640A5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8361BF354
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 07:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58079417C9
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 07:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58079417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fo19SpF62-Q4 for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 07:04:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15650417C8
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15650417C8
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 07:04:45 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7EC7424000A;
 Tue, 18 Oct 2022 07:04:43 +0000 (UTC)
Date: Tue, 18 Oct 2022 09:04:42 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221018090442.2cb7fda8@booty>
In-Reply-To: <CH2PR12MB5004B9D704E2468C787578ACF0299@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221017071002.48266-1-neal.frager@amd.com>
 <20221017155854.48220785@booty>
 <CH2PR12MB5004B9D704E2468C787578ACF0299@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666076684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AffAAm6kvKEayflUphTf75B2axgsBH0zWpwKVGHzgZQ=;
 b=eI2xo8BF/25QOJ0CHaWwtG5SNwMqNMSW45yd+MGWBCnlHxu6KaJ30ndIu/Mr/MkGz1rKxm
 /u2ZFOpjFHt8/XYZlm6wJJ+03WcW75YZCNCpD9uJ9IuEBlCoTQyzf1FjkynryND2v3k44+
 CbzqQwl0z3hscRwiRPAiarpphYexjXK9xcJRGDk4a7sP7FRQMoIhL7uUZYghNoNFeQPyEg
 9x8kKvrCgdF7OsTSuCRJ4KT5kMwhEIjIJ+L8iG1peDc47Upx+Q4IOrpSE+Ya44yv9/suwd
 SmCVldZbjLjZT1IGrE3djuLCD+g8QqMW9xwbPHjUf5NSRENO7joYgGs5WIA57A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eI2xo8BF
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: fix
 pmufw sw reset
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal, Michal,

On Mon, 17 Oct 2022 14:15:16 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Luca,
> 
> > Why are these binaries board-specific? I thought this used to be only
> > needed for the "community workflow" before U-Boot SPL was able to load
> > a pmufw cfg object.  
> 
> Good question!  I had a feeling you would ask this.

;-)

> In the case of the zcu102, zcu104 and zcu106, the pmufw binary is not board specific.  The same pmufw binary will work on all 3 boards and even custom hardware, if a developer wants to use it unchanged.

OK, I see. (@Michal) I compared the zcu102 and zcu106 binaries and they
are different, thus I wondered.

> But since the pmu reset gpios are customisable among other things, the kria kv260 actually uses a different pmufw configuration.  And developers may wish to modify the pmufw for their target as well.
> 
> Since the Xilinx firmware repository is created using the petalinux prebuilt images for each target hardware, we chose to have a pmufw.elf in each board directory to match what comes from the petalinux builds.

Sure, knowing the process clarifies the reason for having different
places for firmwares that are equivalent.

> That said, since the Xilinx repository has a pmufw.elf in each individual board directory, I thought it would be cleaner for buildroot to use the pmufw.elf for each specific target.  Even if the zcu102 and zcu106 pmufw.elf binaries are really interchangeable.

Sure it is.

Thank you both for the clarifications!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
