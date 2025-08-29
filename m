Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552DCC8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 09:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF74841C5;
	Fri, 29 Aug 2025 09:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSJxZ07-bIiG; Fri, 29 Aug 2025 09:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 352E2841D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 352E2841D9;
	Fri, 29 Aug 2025 09:02:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A87369
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74334414D5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxPxtDszBcRS for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 09:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68F984125F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F984125F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68F984125F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:02:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A81FF4337B;
 Fri, 29 Aug 2025 09:02:19 +0000 (UTC)
Date: Fri, 29 Aug 2025 11:02:18 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250829110218.4d19bc9f@booty>
In-Reply-To: <20250814052631.3412836-2-neal.frager@amd.com>
References: <20250814052631.3412836-1-neal.frager@amd.com>
 <20250814052631.3412836-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeefgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1756458140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QMoXZolcrF+XNsUEQo8Szjkm4wAZC7bGa+mtk2etYE=;
 b=ZzzyanwDU7X1iH0NwNU6BN4b3AFjogTLO9mX3wN0FVi/jDPg5ScGYcL4HbRLxH3Xmx3MDq
 onA/yzZZdknPuO2hTUWH/KUmN+bhEc+C6uGNNPiAYBFIqwOKN7/8sSvokdHYqrjQmgLhsm
 oEE3INDYxjULpJEY4WO1+35GX0KFrbnqA3mj1tjQ9iekd+/dJ6Uf4mJ9yU12lupBSnXyTd
 KtwZXEufHUqNvw5BtNWT3Q/mlhBMCPgkEMn2zFHiJw7wa0/VQ0m3D5p+4uNocJohWIKOrh
 aQ371EQfQeDV+iJ7GDI82aqQo6HXXLwn/a8ty8ZTCheuwHssacWY+gOXRwTE1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZzzyanwD
Subject: Re: [Buildroot] [PATCH v6 2/5] boot/xilinx-embeddedsw: only allow
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Aug 2025 06:26:28 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds an architecture cpu dependency to each application to make
> sure that users can only build applications which are applicable to their
> target device family.

Generally speaking, git commit messages should use imperative tenses:
"This patch adds" -> "Add", etc.

I won't be nacking this patch just for this, but it would be nice for
the future.

> The versal_plm and versal_psmfw applications are specific to versal devices
> which are based on BR2_cortex_a72.
> 
> The zynqmp_pmufw application is specific to zynqmp devices which are based on
> BR2_cortex_a53.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - Replaced new family variant config option with an architecture cpu
>   dependency, so no new configs are needed.
> - Updated patch title and commit message accordingly.
> V2->V3:
> - Changed package dependency to only appear if the cpu is BR2_cortex_a53
>   or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
>   appear with zero application options if another BR2_aarch64 cpu is
>   selected.
> V3->V4:
> - Added BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS, so that all arch
>   dependencies are in one place
> V4->V5:
> - Replace leading space copy paste error with tabs
> V5->V6:
> - Take advantage of BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS from
>   boot/Config.in to remove dependencies on BR2_aarch64.
> ---
>  boot/xilinx-embeddedsw/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> index 0dd6433608..3826f2e18e 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -1,11 +1,9 @@
>  comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
>  	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
> -	depends on BR2_aarch64
>  	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
>  
>  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
>  	bool "xilinx-embeddedsw"
> -	depends on BR2_aarch64
>  	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
>  	help
>  	  Build boot firmware applications from source for Xilinx

Shouldn't these two line removals be in patch 1?

Otherwise looks good.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
