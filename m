Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B382CC87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 09:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6694F607AA;
	Wed, 13 Aug 2025 09:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8yhYg6bkvhi; Wed, 13 Aug 2025 09:13:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D094606EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D094606EE;
	Wed, 13 Aug 2025 09:13:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C62D7938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC58040137
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77bX6_zI3bI2 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 09:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DA3F40134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DA3F40134
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DA3F40134
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:13:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 049A1430D1;
 Wed, 13 Aug 2025 09:13:30 +0000 (UTC)
Date: Wed, 13 Aug 2025 11:13:29 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250813111329.7272240d@booty>
In-Reply-To: <20250813084354.2739722-1-neal.frager@amd.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755076411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=583S4P+fGM2k0aOH6j5+9jyGoXbH4Fa27LuyNNf9jxU=;
 b=hztDF6LlOQa56r1gFStfRRA/Xkac1MPXZMMGQJ4214qEqa13tc31Q8NuuDaT1oME6tZejG
 oqgNRSf8NLrywcznf2AOHfCmLs1UjYmLTfJhqjZvTAsvDRIFKMJHHD2mWe367wgmL3wubz
 pqNZLWKWj3lhtH5LxWFHmKB0+7jXycqqGkRfApj6ttUSMUNpEEcb9A/kM0ncnxUgUvqu7Z
 s4jcNn4L3cXLIOxp7QVqG2BHx6VxMlyFEH7WEeGHq2HsknHm2N9R30BD67KKCCKpuhrtnr
 wy0vDE/981gCF4kgmjI9BB8uPKAmUiX0FmpeBL3/oL2LeTK3RY4zkRaJLwXnRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hztDF6Ll
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
Cc: ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 13 Aug 2025 09:43:54 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds an architecture cpu dependency to each application to make
> sure that users can only build applications which are applicable to their
> target device family.
> 
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
> ---
>  boot/xilinx-embeddedsw/Config.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> index 0dd6433608..96e9ca2fb0 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -5,7 +5,7 @@ comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-b
>  
>  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
>  	bool "xilinx-embeddedsw"
> -	depends on BR2_aarch64
> +	depends on BR2_cortex_a53 || BR2_cortex_a72

The same change should apply to the 'comment' line above, no?

BTW the example I gave in v2 was touching the comment line and not the
the menuconfig line, so each of us changed one place and forgot about
the other one. :-)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
