Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4673CC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C864053D;
	Sat, 19 Apr 2025 20:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHlGhulm1Nxs; Sat, 19 Apr 2025 20:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BD4D40548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD4D40548;
	Sat, 19 Apr 2025 20:32:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D956230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F57C4053D
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MHlxlErFK3G for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 891F340538
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891F340538
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 891F340538
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:32:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 485B043B73;
 Sat, 19 Apr 2025 20:32:50 +0000 (UTC)
Date: Sat, 19 Apr 2025 22:32:48 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <20250419223248.056fd9ff@windsurf>
In-Reply-To: <20250404-libcamera-0-5-0-v1-9-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
 <20250404-libcamera-0-5-0-v1-9-e2ca9d029aeb@cherry.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeitddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehfohhsshdosghuihhlughrohhothestdhlvghilhdrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepk
 hhivghrrghnrdgsihhnghhhrghmsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmrghrtghushdrfhholhhkvghsshhonhesghhmrghilhdrtghomhdprhgtphhtthhopegvrhhitgdrlhgvrdgsihhhrghnrdguvghvsehfrhgvvgdrfhhrpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745094770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDigiDqDebVHWc+veeehL36k06qR2ymdl5B7wUedM88=;
 b=mibP+EtKhhLRbNwlxkdSaqMwjEAoqD0iE1y62mCKozmkrHzRxlJvzN1GY4AproC0c9O5cv
 5zYZv6ALJokQhwCdNcBhhGPgpCa+kXzfI0R8Ro3Zgmr+pznUgtmZkRqIiMMHF1Lxmsnqj3
 Ku8NgwfChOnR1faVyxmm7jG//ZfNRlsufZNtBx6cT5RPo5xTJ5G3KWNWmK5eY61faIWslz
 AWyPVH5pFL8k5vtD6mzjX0E05Lk0+TS8/CFikbGZel4yYTDzzRdSXb79mcXR9FjSWjtw5G
 I0cxZfHfG999/tS/GrNDa9QOTN/chJ+VarMaGyiDNbyfuWDL0nb8goNa6kfB5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mibP+EtK
Subject: Re: [Buildroot] [PATCH 9/9] package/libcamera: add support for PiSP
 pipeline
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Quentin,

On Fri, 04 Apr 2025 18:47:40 +0200
Quentin Schulz <foss+buildroot@0leil.net> wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_PISP
> +	bool "rpi/pisp pipeline"
> +	depends on BR2_arm || BR2_aarch64
> +	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +	select BR2_PACKAGE_LIBPISP

Make sure that all dependencies of BR2_PACKAGE_LIBPISP are accounted
for when you "select" it.

Otherwise, looks good!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
