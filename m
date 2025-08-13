Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79767C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4864281362;
	Wed, 13 Aug 2025 16:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Y3lhHsPw0FP; Wed, 13 Aug 2025 16:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F878145D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F878145D;
	Wed, 13 Aug 2025 16:15:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 072831B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA04040366
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEQ1HTBaU1ek for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:15:10 +0000 (UTC)
X-Greylist: delayed 28890 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Aug 2025 16:15:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5E5B4035B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5E5B4035B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5E5B4035B
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:15:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 994DE441D5;
 Wed, 13 Aug 2025 16:15:04 +0000 (UTC)
Date: Wed, 13 Aug 2025 18:15:03 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Cc: "yann.morin@orange.com" <yann.morin@orange.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Message-ID: <20250813181503.0a6b1bfc@booty>
In-Reply-To: <SA1PR12MB5615804C1824C82F59F1FEAFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3> <20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
 <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxyq8E0t+89Dxh2@yd-6wlzhs3>
 <SA1PR12MB56150000BDD0EC7C783A9CEFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813153132.5942d8f7@booty>
 <SA1PR12MB5615D280061C41231F1D0DA3F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813164154.797c9077@booty>
 <SA1PR12MB5615804C1824C82F59F1FEAFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeekieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdehleevieduvefhuddvvdefvdfgveehveffueejffehueffveejhfejkeeuffegnecuffhomhgrihhnpehoiihlrggsshdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohephigrnhhnrdhmohhrihhnsehorhgrnhhgvgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhts
 egsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepihgsrghirdgvrhhkihgrghgrqdgvlhhorhiirgesrghmugdrtghomhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755101705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9B4SspeRdFBOdG7J+wLBCA5sG0Q+BH8/5Pc0eYF56Q=;
 b=V7SeREv4Hc0sYojvmJJ72f8I9mPIbDU/53EvDabzEA6UYmUUgXQZoMLBN2JKmvkXDg0LdO
 /3YT0GKj5dGubKYpQkOucS8sKkRRo/AL7JOUhvj+cx3odXLmyvz1MEFPtjvf6WZWTt4zHk
 UjRDRXV+bQqDMo4cqQ+R5nN6hpF4Naar6u+2lPYmoQMZI1/ZO7QRfkpQ2tRF+Y4yraoZla
 4beZympVzKrlinffDHJ0GeNSP8OGn5RjmJZgbKPMkDpTRwUspUUg0y6q9m72Y57IostKPQ
 RHY1GyhJW+P6AWHon0ReQRjqZkNau6mdUWtBEaB9O5xg1uWgxqbcqUJQmJGvmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V7SeREv4
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Aug 2025 15:28:00 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Luca,
> 
> >
> > Hi Luca,
> >  
> > >
> > > Hi Yann,
> > >
> > > [--SNIP--]  
> > > > > When the dependency is not tricvial, I think it is good to introduce an
> > > > > intermediate symbol:
> > > > >    config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS  
> > > [--SNIP--]  
> > > > I see your point, but don't you think adding another symbol is still
> > > > a bit overkill?  The dependencies are still only 3 lines and are rather
> > > > straight forward.  
> > >  
> > > > This would not be unheard of, there already are a few packages with very
> > > > few arch dependencies, but that still have a dedicated symbol, see for
> > > > example (some are more interesting, as they do have comments for each
> > > > dependency they carry):
> > > >  - bayer2rgb-neon
> > > >  - bitcoin
> > > >  - bpftrace
> > > >  - dpdk
> > > >  - host-flutter-sdk-bin
> > > >  - (host-)gdb
> > > >  - gtkiostream
> > > >  - ... and so on...  
> > >  
> > > > Note that we usually do that for libraries, so that it is easier to
> > > > inherit their dependencies in selecting packages, but of the above,
> > > > only two are libraries.  
> > >  
> > > > But maintainers will have to decide what they want. ;-)  
> > >
> > > In the end, I changed my mind on the issue since there are two places where
> > > the arch dependency is used. The BR2_TARGET_XILINX_EMBEDDEDSW as well as the
> > > comment about the dependency needs.
> > >
> > > To avoid having the two be out of sync, it makes sense to create a
> > > symbol BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS that keeps all the arch
> > > dependencies in one place. This way, when I add BR2_cortex_a78 in the near
> > > future, I will only have one place to add it instead of two.  
> >  
> > > I agree this is a good idea.  
> >  
> > > However the same logic can apply to other Xilinx firmware and related
> > > packages, such as xilinx-prebuilt. Thus I'd rather create a single
> > > symbol that can be reused for both packages, and it should probably be
> > > in boot/Config.in. It should be also named without "EMBEDDEDSW", e.g.
> > > BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS.  
> >  
> > > Side note: I personally don't recommend sending new iterations so
> > > quickly, without letting the discussion settle, it produces a lot of
> > > noise. I'd wait at least a few days after the latest e-mail in the
> > > discussion before sending a new version.  
> >
> > Yes, you are right that we can create a global symbol in boot/Config.in called:
> > BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
> >
> > This symbol could be used for both xilinx-embeddedsw and xilinx-prebuilt.
> >
> > Not only would this enable us to only show the xilinx-prebuilt package as an
> > option when one of the correct cpus is selected, but we could also use the
> > BR2_cortex_a53 and BR2_cortex_a72 to limit the available choices in the
> > family variant selector. This would prevent selecting BR2_cortex_a72 and
> > having a zynqmp or kria xilinx-prebuilt family selection or vice versa.
> >
> > It would not change the need for having the family and board information
> > because the xilinx-prebuilt treats zynqmp and kria boards differently due to
> > the directory names where the pmufw.elf files are located even though these
> > are both based on BR2_cortex_a53.
> >
> > But at least creating a BR2_TARGET_XILINX_ARCH_SUPPORTS would put the arch
> > dependencies of Xilinx components in one place. We could even update the
> > uboot package BR2_TARGET_UBOOT_ZYNQMP symbol to be dependent on
> > BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS instead of BR2_aarch64 as well.  
> 
> > Sure.  
> 
> > The only exception would be the zynq platform. The BR2_TARGET_UBOOT_ZYNQ
> > symbol would stay dependent on BR2_arm because it is the only family that is
> > not an aarch64. I suppose I should add a BR2_cortex_a9 dependency to
> > BR2_TARGET_UBOOT_ZYNQ as well, so that it limits the option appearing even
> > more.
> >
> > https://patchwork.ozlabs.org/project/buildroot/patch/20250619153922.891360-1-neal.frager@amd.com/  
> 
> > That's true as well.  
> 
> > If you do all of there, please keep them as separate commits in the
> > series to be easier to review:  
> 
> > - add BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
> > - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in xilinx-embeddedsw
> > - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in xilinx-prebuilt
> > - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in uboot  
> 
> I will separate the patches to the individual Config.in files, but to
> simplify the usage of BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS, I plan to
> use it right away in the first patch by doing the following in boot/Config.in.
> 
> +if BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
>  source "boot/xilinx-embeddedsw/Config.in"
>  source "boot/xilinx-prebuilt/Config.in"
> +endif

Aah, yes, if it is that simple I guess a single patch will be fine.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
