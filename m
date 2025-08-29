Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCB2CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 09:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0021784275;
	Fri, 29 Aug 2025 09:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4pdBoS6DV3p; Fri, 29 Aug 2025 09:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED0B8426C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED0B8426C;
	Fri, 29 Aug 2025 09:41:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFDCCD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A647040818
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKu488VxG0Hw for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 09:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FAB6414CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FAB6414CC
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FAB6414CC
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:41:38 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 8D97D5832CF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:18:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F35A443189;
 Fri, 29 Aug 2025 09:18:22 +0000 (UTC)
Date: Fri, 29 Aug 2025 11:18:21 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250829111821.0645b31a@booty>
In-Reply-To: <20250826060943.1394934-3-neal.frager@amd.com>
References: <20250826060943.1394934-1-neal.frager@amd.com>
 <20250826060943.1394934-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeefhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfevieekhffhgfekhffftedutdehveeuudelieehvedugfejtdffueekieffffetnecuffhomhgrihhnpedupghuphgurghtvgdurdgrshdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrt
 ghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1756459104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6hD9xRb6U9yt64oxDkhfuZuAF+LCEwd5pOF9Buk0fE=;
 b=SCKa+FOCqApmwc+kx+oJyPYDIp1ywnnM0dJEXmlPeh4TqJ4Eoc7S7fKGgKkNoOBH2BgjMI
 H1UJFFN4LH09BxHcZKbLhG3Up0iVubmeVNYPQUTln4R7bvImXtBEE4DgxBReaDG0/F5wYH
 FY16Gs0YAta+sBKTOQpeVX6xzMlWtJTmpmY5KAod7kVLRcpmsrcFXJcbMa4NMSISLJkIIj
 ne1/Bg+ziOtN5H8yx9jD0DAsFgpu8IGE7VldaMnCiuQEh8SBu26eG3nzG7hXfdxX4XoOr/
 YxP6ZOUA/Ef1hucOmThGRFsvBvoHi0UIfi4xca1eeK74DgD8Un9z8S7hv+JIiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SCKa+FOC
Subject: Re: [Buildroot] [PATCH v2 3/5] configs/versal_vek280: bump
 xilinx-prebuilt to xilinx_v2025.1_update1
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
 brandon.maier@collins.com, manikanta.sreeram@amd.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Aug 2025 07:09:41 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the versal_vek280_defconfig xilinx-prebuilt package to
> version xilinx_v2025.1_update1.
> 
> As part of this update, the vek280 pdi file has been updated from the
> petalinux flow to the yocto edf flow. In the process, the memory map has been
> corrected to match the Linux intree dts memory node, so the vek280 memory node
> patch is no longer required.

This is not very meaningful for Buildroot users not knowing the
"petalinux flow" and the "yocto edf flow"...

> https://github.com/Xilinx/soc-prebuilt-firmware/commit/f755d022cd9bd2e6a09eed0f80078bca3345279e

...however at this URL one can probably guess the details that are
relevant for Buildroot.

So overall it's OK:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
