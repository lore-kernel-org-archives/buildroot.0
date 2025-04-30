Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55678C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 13:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10839403EB;
	Wed, 30 Apr 2025 13:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGuMMn-z4kpZ; Wed, 30 Apr 2025 13:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33342403D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33342403D4;
	Wed, 30 Apr 2025 13:06:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBE8BE4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE7AD400D1
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flgKwvyAlH3O for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 13:06:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB7BB41A89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB7BB41A89
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB7BB41A89
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:06:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E528C438AD;
 Wed, 30 Apr 2025 13:06:19 +0000 (UTC)
Date: Wed, 30 Apr 2025 15:06:18 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250430150618.32a6a3e9@booty>
In-Reply-To: <20250424063619.789456-2-neal.frager@amd.com>
References: <20250424063619.789456-1-neal.frager@amd.com>
 <20250424063619.789456-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746018381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBWl+Ror0zU2lRO/DApqB5L3mE4kjA34db4S/OGZpHw=;
 b=BtILF9FZ0GqztQIGzPb1k/Hbf/AI28dsVesRNO6Cq26G4/IJxINIIVOncJAFeoxKnICMsr
 upcJXeCxqI3uZd/pH8+ovSP5R083gsF+4bEihjt+8YiEMzmCqWZTyoCV0VsLZ/10GCyR//
 fvFeLHVysTRnIDd2UzvqyHcjAbfBxLy2dtC0IhO/m4gh8zeb++gCxFrCGxGaVPyYOgrQa0
 mCvwAXdFTj6uyQP9DS6TKyQSnqXS5lI4ua6q2KeGniEaZItyNXwjyetoH0s4A2WzEw6Ql6
 nhuM88ro5aTUtkTZKQJ+5hmF8o3A97J01AVdd1C0F++VhRlf2KxiMhbtfXZZ6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BtILF9FZ
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/xilinx: add xilinx-fpgautil
 to xilinx defconfigs
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
Cc: ibai.erkiaga-elorza@amd.com, arnout@mind.be, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 fabio.caccamo@amd.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 24 Apr 2025 07:36:19 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This adds the xilinx-fpgautil application to all Xilinx zynq, zynqmp and
> versal defconfigs.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
