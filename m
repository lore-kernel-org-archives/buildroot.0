Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2D7C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 14:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57E760DD2;
	Tue,  1 Jul 2025 14:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfQUDgIGfckT; Tue,  1 Jul 2025 14:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2162860DC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2162860DC7;
	Tue,  1 Jul 2025 14:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83AE5DF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 14:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A5C14012A
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 14:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmxPxwiPRx_1 for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 14:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36B3240068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36B3240068
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36B3240068
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 14:53:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B57D744427;
 Tue,  1 Jul 2025 14:53:25 +0000 (UTC)
Date: Tue, 1 Jul 2025 16:53:16 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250701165316.2b030958@booty>
In-Reply-To: <20250619153922.891360-1-neal.frager@amd.com>
References: <20250619153922.891360-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphephedurddujeelrddutdefrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeehuddrudejledruddtfedrheehpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthgvrheskhhor
 hhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751381607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmA818COSThXipv97uSEhkdl8e+ZkRQTVIuilQsYzwA=;
 b=lRjyhDTixcY93h452fGeoXnEtijYMqHRFugFu2jSxrh1MOxuZvJSEGy59qUq0nH/laa/4Y
 nn6GtArQAQQrxeLD+TZl0+R1XNOJnCroh7ygPrYKsdqgawVP6npiCiCyfVkWnoBsZnBHVY
 bgr4nWePdI05axa3gWZQNPXISL40UD4HEzIeF5J6tlM525MQQDVt/Dwpy31K/+UTf1ZU1M
 Hakj9LhWz4keDNtZPOKdGj9rYKE6jGnSvn32gspJFWM84yHiS8nvTZ1Vx5A4+P6k2TTxbB
 Ll0iYwnJZwVjwzVJ+JSVt/fs2Gwf3Ug7d71GDKhAakEAeRQkD2kjO7MPiDFuAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lRjyhDTi
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot: add support for custom
 zynq ps7_init_gpl.c
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

On Thu, 19 Jun 2025 16:39:22 +0100
Neal Frager <neal.frager@amd.com> wrote:

> On Zynq, the booloader is responsible for some basic initializations, such as
> enabling peripherals, DDR and configuring pinmuxes. The ps7_init_gpl.c file
> (and optionally, ps7_init_gpl.h) contains the code for such initializations.
> 
> Although U-Boot contains ps7_init_gpl.c files for some boards, each of them
> describes only one specific configuration. Users of a different board, or
> needing a different configuration, can generate custom files using the Xilinx
> Vivado development tools.
> 
> This patch adds Buildroot support for custom zynq ps7_init_gpl.c files in the
> same way that is already done for zynqmp when working with custom hardware
> that is not already supported by u-boot.
> 
> To test this feature, the following configs can be added to any zynq_defconfig:
> 
> BR2_TARGET_UBOOT_ZYNQ=y
> BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE=<path to custom board ps7_init_gpl.c>
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
