Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8ADC00528
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 22:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87A56821BB;
	Wed,  2 Aug 2023 22:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87A56821BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyeRyOUOQoFu; Wed,  2 Aug 2023 22:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 930808200E;
	Wed,  2 Aug 2023 22:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 930808200E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 112321BF97D
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 22:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 622658124F
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 22:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 622658124F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8n1TXsYVgTKo for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 22:12:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 274EC80F51
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 22:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 274EC80F51
Received: by mail.gandi.net (Postfix) with ESMTPSA id D89611C0004;
 Wed,  2 Aug 2023 22:12:31 +0000 (UTC)
Date: Thu, 3 Aug 2023 00:12:30 +0200
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20230803001230.284ba84d@windsurf>
In-Reply-To: <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20230802220321.6af766af@windsurf>
 <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691014357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwO6KOVtT0tAi3Bct68vof1d3UKA+s85I2BC70yeRi8=;
 b=CzMXXHVgkDllmCG1HRQM2GeyFQnvxfQfzLtqlfOavpVWg+QTeyJQWVmswaiCA9h+obgwIk
 0ctvEv7d3YxdmKF3bS20sx2n2nIRuATzIypK+dTVen30MY43A5ehoPjlVzbxAGQAGD/7Qi
 994yQpMGELLu1D/MilQGhAJ04Gk1BzrffS4QJnMwM0HL8xBNTrIwXOfBfyWmIxKnO5X1Dl
 9C6iX0I6gXoxkgdFFaxvZBiE3Iie+17bdV4ecBNNfSurhXXa11R5EmjmNg9xgQnKjbMhBz
 11D6siN0j1SMt6rD/nY710B4lkCnNVrWd40yvLtf3LVz82KGWl8/oFHdQYlMLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CzMXXHVg
Subject: Re: [Buildroot] ARC support in Buildroot
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
Cc: ARC Buildroot mailing list <arc-buildroot@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

Thanks for your feedback! See below.

On Wed, 2 Aug 2023 21:20:28 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> We do have an interest in ARC cores support in Buildroot and in fact
> we and our customers actively use it.
> 
> And the reason you were not seeing our contributions is two-fold.
> 
> From one point of view ARCompact & ARCv2 support is so good
> in the upstream components that barely anything needs to be done for them.
> Possibly I'm missing something but the only report I keep getting with
> ARC-related problems it's glibc build failure for ARC700 - that problem
> was discussed some time ago and I sill have that action-item to fix it.

Well, if the support in upstream GCC/binutils/GDB is so good, why do we
still have ARC-specific version that are now outdated?

config BR2_GCC_VERSION_ARC (based on gcc 10.x)
config BR2_BINUTILS_VERSION_ARC (based on binutils 2.34! super old)
arc-2020.09-release-gdb for GDB

Can we drop those special versions and assume what's in upstream
GCC/binutils/GDB is good enough?

> On the other hand, we were busy working on ARCv3 ISA support, see [1] & [2].
> Of which the latter is a family of 64-bit processors!

Very nice!

> And so, while it was all work-in-progress we kept all the work in our fork [3],
> including changes related to ARCompact & ARCv2 processors.

Would be good to see things being upstreamed of course :)

> That said, we do plan to upstream our ARCv3 support in all the projects
> as usual, and Buildroot will be one of the first projects seeing these changes.

OK.

> Great question! We do have now QEMU port for ARC and similarly to other
> components it was not yet upstreamed as we wanted to have ARCv3 supported
> there well enough, which is achieved now. If of any interest it could be
> found here [4]. We're still polishing it, but it's definitely usable.
> As a matter of fact for a couple of years now QEMU is an essential part
> of Zephyr SDK [5] and used for per-PR upstream verification of Zephyr RTOS.
> And since Linux along with Zephyr RTOS are the key payloads for QEMU, it's
> only essential to run Buildroot-built images in QEMU for ARC.
> 
> Now, why you didn't see any QEMU-related defconfigs in the Buildroot,
> it's because we intentionally introduced a "virt" platform in QEMU which
> fully matches our reference FPGA platform (HAPS) and proprietary simulator
> (DesignWare nSIM). That said "snps_archs38_haps_defconfig" will equally
> well work on HAPS, nSIM & QEMU ;)

I think then it would be good to add a readme.txt in Buildroot about
the snps_archs38_haps_defconfig configuration.

Currently, we have 4 ARC configurations:

snps_arc700_axs101_defconfig 	-> no readme.txt
snps_archs38_axs103_defconfig   -> no readme.txt
snps_archs38_haps_defconfig     -> no readme.txt
snps_archs38_hsdk_defconfig     -> has board/synopsys/hsdk/readme.txt but it points to https://embarc.org/platforms.html which is a dead linke

> That said, I hope my comments make sense and improve your perception
> of ARC support in Buildroot and kinda gives a feeling of our interest
> in the project. Let me know, though, if there's anything you feel we really
> need to improve and what might be useful for the Buildroot from our side.

See above :-)

I think the action points are:

(1) Drop ARC-specific versions of GCC/binutils/GDB if you confirm it's OK

(2) Add readme.txt about the different defconfigs so we understand
    which platform they target, and where it can be found, if freely
    available.

(3) Perhaps make it possible to build the ARC-specific qemu, so that we
    can out of the box have a qemu that we can use to boot test one ARC
    platform. Then we can enable that in our Gitlab CI

> P.S. That's too bad that due to some bureaucracy nonsense I was not able
>      to meet you and other folks in Prague last month, even though I had
>      all booked and planned. But I hope to see all of you on the next
>      event like ELCE.

Yeah, definitely. Next year ELC will be in the US, there will be no ELC
in Europe. There is Embedded Recipes in September in Paris, then FOSDEM
in Brussels in February.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
