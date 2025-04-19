Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F6AC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54236067C;
	Sat, 19 Apr 2025 21:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8j7pF6NiDHZG; Sat, 19 Apr 2025 21:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FAD66067D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FAD66067D;
	Sat, 19 Apr 2025 21:26:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04B9122F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DED944068F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cf3e3C21B3DS for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE6BB4069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE6BB4069B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE6BB4069B
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:26:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C5694397C;
 Sat, 19 Apr 2025 21:26:18 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:26:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
Message-ID: <20250419232617.513bdde0@windsurf>
In-Reply-To: <20250410180141.2194321-1-dario.binacchi@amarulasolutions.com>
References: <20250410180141.2194321-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegurghrihhordgsihhnrggttghhihesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdro
 hhrghdprhgtphhtthhopehlihhnuhigqdgrmhgrrhhulhgrsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745097978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7M7fssi+6UdyKSBsSgaDKXHI4sRgW0QqjHr5c4WQYaY=;
 b=ESqtBlGYLDxvBEbQh9Z9gZ/20BKI8FRY//GnLwOl2qAL+LZrbCaNlSE1v/rPHSkH4/9qM+
 R6i8wBt+FA56qUuqVLmipaPkmJmAINoZpoTJHrOuw7yriYJImGOCU8YWrbyJsAs227D9CV
 UTknTCGeDH657F4dM2MDdJkBDIyWru+kTVr1z0CHHTdeZdClFUhJzDgUJdRzVDxjOvghmU
 /sn6p10hDFr5h7+DJ8I8FrGoOfGtK3KXnRxakIZb/fWWX8htBpsBZhThuuYA7HJH7Crjc4
 +Z5lXcg1LTUuTRR51QI8SNja0cR6uEZ/aRjDL0OSu1NYTi1+k6wI6YhMM/LFtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ESqtBlGY
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux
 to 5.15.179 and U-Boot to 2025.04
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

On Thu, 10 Apr 2025 20:01:41 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 5.15.179 and U-Boot to
> version 2025.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
>  .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
>  configs/stm32f746_disco_sd_defconfig                          | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
