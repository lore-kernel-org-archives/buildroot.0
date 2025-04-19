Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0B1C369D1
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955E0607D2;
	Sat, 19 Apr 2025 20:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bW5ppDT-adH8; Sat, 19 Apr 2025 20:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE876607FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE876607FC;
	Sat, 19 Apr 2025 20:27:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF0768
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C8FA404C7
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzUjuP872u_m for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08FF8406C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08FF8406C3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08FF8406C3
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:27:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 604AE439EA;
 Sat, 19 Apr 2025 20:27:30 +0000 (UTC)
Date: Sat, 19 Apr 2025 22:27:29 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <20250419222729.4979f7e3@windsurf>
In-Reply-To: <20250404-libcamera-0-5-0-v1-5-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
 <20250404-libcamera-0-5-0-v1-5-e2ca9d029aeb@cherry.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehfohhsshdosghuihhlughrohhothestdhlvghilhdrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepk
 hhivghrrghnrdgsihhnghhhrghmsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmrghrtghushdrfhholhhkvghsshhonhesghhmrghilhdrtghomhdprhgtphhtthhopegvrhhitgdrlhgvrdgsihhhrghnrdguvghvsehfrhgvvgdrfhhrpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745094450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUCXnn3r3PDAgYN4B1gjabKsWmxieH3jWWeiSeesvqU=;
 b=OrcyYE0oUCcTiEuiqTStliEPBFxgmz7Y7MddwUuZdU/6AyZyGT1Qb6N0tYlYBxrmSA3xI8
 FfNgf1tjVLUTfFTnUnXEZga9vShbmHtcLPddCrpy5Ata3j8KQeyGzs/gxUT0pO2ejnhYus
 SO1Wlq6hUExO1rN1DMqeJpDaN6v9cE6lY4WCZUHkfjP0b6mq2cSIPzmkfOOekZYzEYU/Um
 6kXRqAjrgxK8j30xnoaTBzeyr9hjX3ANnpOolongrNj/qnD7AqVfgp82GSSisJMNKUPCto
 kJ5TcbtEn8MgV/U9RBhrKG0SyPVu1JKhgXva3RiN9ysnSPF95acj09qNsNokWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OrcyYE0o
Subject: Re: [Buildroot] [PATCH 5/9] package/libcamera: improve
 reproducibility for optional dependencies
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

On Fri, 04 Apr 2025 18:47:36 +0200
Quentin Schulz <foss+buildroot@0leil.net> wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> libcamera has some optional dependencies that automatically detected at
> build time.
> 
> To improve reproducibility, we should add a dependency on those optional
> dependencies if the symbols that build them are enabled so that the
> order in which packages are built does not influence the libcamera
> package.
> 
> Note that the optional libyuv dependency isn't added as:
> 1) it is only used for the virtual pipeline and the android feature,
>    both of which are disabled/not supported right now,
> 2) libcamera has it in a submodule if missing (though if that works with
>    Buildroot is to be determined),
> 3) adding the dependency isn't enough as meson somehow doesn't find the
>    dependency,
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  package/libcamera/libcamera.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

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
