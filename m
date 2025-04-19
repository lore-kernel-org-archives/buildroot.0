Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB4FC369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCE1D607FC;
	Sat, 19 Apr 2025 14:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWE-Kcccs0GB; Sat, 19 Apr 2025 14:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0649D6076F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0649D6076F;
	Sat, 19 Apr 2025 14:33:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F98E22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55AAC818D7
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qhqt8GlHCt1e for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:33:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 589CB818B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589CB818B5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 589CB818B5
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:33:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DC771FCE8;
 Sat, 19 Apr 2025 14:33:36 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:33:35 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Message-ID: <20250419163335.11dd2506@windsurf>
In-Reply-To: <20250417112243.4161-1-tianyuanhao3@163.com>
References: <20250414150721.4300-1-tianyuanhao3@163.com>
 <20250417112243.4161-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehtihgrnhihuhgrnhhhrghofeesudeifedrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgrmhgvs
 hdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopeihrghnnhdrmhhorhhinhesohhrrghnghgvrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745073216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3j3Yo7DVoMnb/dCGYcujay94RCqe1KIwwRbwKRc8e2I=;
 b=pByc5ZbhL/R1XUzdVtGqHBTgxBV+AZMAKIr3TzG9RP5vV2M9RxcAlullFMATlrQ6YUjkBo
 Ir6FUnNF8C5x2alqGIxf2DR1tGR87tAgSsq1sppqtr56H15fKnyRglhd7nGWhS8ztPCz6j
 L++uo7LlNOQrI3FDSaynS9rI5XG3Un1Yex+3PMy5dsXjv+LxWEKMn0quiE/gGDZd2mEV78
 Qf7RuwG+m8VK7eyhrBEWBuuLDB285GatAUOB6Rz9vNUDVZihvKLYshX79Pkhmyuds+sGYh
 Fx0OVcESEGAu8dJixbdL1HoKXLHFPkuF4LUs141PSNvoTYIYuGgGKYTortQ8Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pByc5Zbh
Subject: Re: [Buildroot] [PATCH v3 1/1] package/tailscale: install systemd
 service files
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

On Thu, 17 Apr 2025 04:22:43 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yann E. MORIN <yann.morin@orange.com>
> 
> ---
> Changes v2 -> v3:
>   - Create symlink in /sbin  (suggested by Yann)

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
