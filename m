Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC77C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCA6F60813;
	Mon, 21 Apr 2025 21:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKJYuvnk_4Gn; Mon, 21 Apr 2025 21:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E5160B3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E5160B3C;
	Mon, 21 Apr 2025 21:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAF431BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 916F440620
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irPie3jAVVMA for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96A70405D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96A70405D1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96A70405D1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:34:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7106342D83;
 Mon, 21 Apr 2025 21:34:09 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:34:08 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Titouan Christophe
 <titouanchristophe@gmail.com>
Message-ID: <20250421233408.57701fec@windsurf>
In-Reply-To: <20250331171212.1059104-1-fiona.klute@gmx.de>
References: <20250331171212.1059104-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggvpdhrtghpthhtohepthhithhouhgrn
 hgthhhrihhsthhophhhvgesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745271249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efOM4OIe/AHTVNlbXl4vEauB0QRE2fWXmQm7EUVJD6E=;
 b=OTsAcCMwrndfvw0GwtH2jzCkcgtTEXCXKJ+uu46Of3ChsdgSiXuFM97pJFSCBc2S7oT5OS
 ZOtpkdrJumrz0I8Z+lF4rSAAu+RoMuUItEaVCF6ttYpFWLL6IzYgWd6AZDtcWrXRn1Zsyr
 85askmxu9CZss40e7jifse8jmmsshlU8OyPj/uFked+G9j3rfnZvNeICa5YqN/rTu9KgCR
 WN/oXbyuT6KLRvmSKLO0mnRvasfgMrnKnpBpekP66MrCMuHFrGLzmZ9LRuUQqfLN+u85Yc
 D1A2shszWUKzyqnxLJZnt2P/B7m3PE/QxBySScWxI6h8llUi3vBvQXiEEpitzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OTsAcCMw
Subject: Re: [Buildroot] [PATCH 1/1] package/mosquitto: fix init script
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

Hello Fiona,

On Mon, 31 Mar 2025 19:12:12 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Restart would regularly fail because it did not wait for the old
> process to be gone before starting the new one. Rewrite the script
> according to current style to fix that, and add reload support (see
> mosquitto docs for limitations of reload).
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied, thanks!

> Policy question: Mosquitto supports configuring a PID file in the
> configuration, but not on the command line. Using that would improve
> the init script: We could let Mosquitto fork to background on its own,
> instead of via start-stop-daemon. The default config would be easy to
> adjust, but it would require people already using Mosquitto with
> custom config files to adjust those to add the pid_file setting. Would
> that be preferable for Buildroot? If yes, I can update the patch.

To be honest, no strong opinion. What you did in the patch sounds good
to me, and the fact that the init script would have to rely on specific
settings in the configuration file looks less nice to me, so I applied
your patch as-is.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
