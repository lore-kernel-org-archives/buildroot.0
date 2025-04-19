Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064C0C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F2F812A3;
	Sat, 19 Apr 2025 21:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WctJhDwr-WVc; Sat, 19 Apr 2025 21:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD0A812A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD0A812A5;
	Sat, 19 Apr 2025 21:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18F54230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 993B66085B
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyqqzXZLWDU2 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:29:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8B986067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8B986067C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8B986067C
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:29:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F46C439F2;
 Sat, 19 Apr 2025 21:29:09 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:29:08 +0200
To: Ian Merin via buildroot <buildroot@buildroot.org>
Cc: Ian Merin <Ian.Merin@entrust.com>, "angelo.compagnucci@gmail.com"
 <angelo.compagnucci@gmail.com>
Message-ID: <20250419232908.3009a704@windsurf>
In-Reply-To: <BN7PR11MB2788A512245CC5396C83CD8CFFB52@BN7PR11MB2788.namprd11.prod.outlook.com>
References: <BN7PR11MB2788A512245CC5396C83CD8CFFB52@BN7PR11MB2788.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepkfgrnhdrofgvrhhinhesvghnthhruhhsthdrtghomhdprhgtphhtthhopegrnhhgv
 ghlohdrtghomhhprghgnhhutggtihesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745098150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCL8SBP5QhO97+2QAAVxAW/NCMFF9JxqXJCmFPIdOhc=;
 b=jUajpAhLeRiCWTKN+2+pGpXq7Et3JF3iKjfwG+f7z+nCPFqFj7NP6ODley6IPBQOboHnb4
 2pL+O3F6pxQKPh9dhoH1EPvOiBh6/G+gt0qpmn3vgSNdQjAeMShV1sbnzWe5pJaPgNRX4X
 VKOebtU7hUMlCquVtaldtpXFksnUoY0mDDii5uO/wd3QzV44KHglKGAzxPWRVf1tc7Fs2e
 bZ5I2qGyO62jRlwcsuHUXAteKrjK0dFsbxr9MWEwBbJ25PQzhBIrCzpq32CmkaVOCT4OuF
 Fj7EZpuvBQV0BW74jKl+f6UChJQSdlJHBacr3qR1HjCGWbSciPTz8t3e7/DLhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jUajpAhL
Subject: Re: [Buildroot] [PATCH] package/apparmor don't reference
 libapparmor variables
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

On Tue, 8 Apr 2025 17:47:58 +0000
Ian Merin via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Ian Merin <Ian.Merin@ncipher.com>
> ---
>  package/apparmor/apparmor.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
