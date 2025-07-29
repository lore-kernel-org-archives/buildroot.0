Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5883C87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 12:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D9A61085;
	Tue, 29 Jul 2025 12:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4J6xQGGTZhXR; Tue, 29 Jul 2025 12:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D306961047
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D306961047;
	Tue, 29 Jul 2025 12:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44A09D94
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 12:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 328F180E92
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 12:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TzKSIxkgM4u for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 12:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FFDA80E89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FFDA80E89
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FFDA80E89
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 12:20:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB52C4430B;
 Tue, 29 Jul 2025 12:20:21 +0000 (UTC)
Date: Tue, 29 Jul 2025 14:20:20 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20250729142020.2cb38e75@windsurf>
In-Reply-To: <20250729094732.165580-1-titouan.christophe@mind.be>
References: <20250728102956.81525-1-titouan.christophe@mind.be>
 <20250729094732.165580-1-titouan.christophe@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelhedtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqddutddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegfeffteelveegleefgeeggfefkeffjeefffevieeuudeuhefhkeegueegjeevueenucffohhmrghinhepnhhishhtrdhgohhvpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtihhtohhurghnrdgthhhrihhsthhophhhvgesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoo
 hhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753791621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t11dYIyyO/a4m4o7JR4GyVBEWwhf/MZkTsBtQWouTJw=;
 b=Tvwm68jyFgkq0SBIbEJzdoPYIQHPiQWFcBZQs8PNmnjXlrUkXOdnvhYFJ2Rri3SylTGsu7
 q4HUQn4NYYcrm2lxegnrZEHUI0/fh1MW/jRzt+nhp6QIeBpTXrE7hyfSJDfN/n3SP9bxlR
 2QT8kXpkVzb65HiAM5TlWGlP89naAymBJc3NBNzzGVrz4p1pbTaosqqh780LSjoeBbqQ/G
 vSF6LoCpIRVmgZfC6b8kJbC3uG5qCGdV2kTjNZCu5t8b4xsOJgVZPJyWszIhRDCad+FOgJ
 zzPeBO2BqO+1u3Ub9qXBjeA2CkZAKEoGJ8bUAtbYhFk+ick8E6gdELSu4jJEUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tvwm68jy
Subject: Re: [Buildroot] [PATCH v2] package/rust: add CPE_ID_VENDOR
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

On Tue, 29 Jul 2025 11:47:32 +0200
Titouan Christophe <titouan.christophe@mind.be> wrote:

> This gives a proper cpe-id string to the Rust buildroot package,
> as it can be found in the NVD database:
> https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:rust-lang:rust
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Thanks for the updated version:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
