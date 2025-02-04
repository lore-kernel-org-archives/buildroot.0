Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2790FC02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8ACD607D2;
	Tue,  4 Feb 2025 16:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi2ptemNYGxf; Tue,  4 Feb 2025 16:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18B9D60BCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18B9D60BCE;
	Tue,  4 Feb 2025 16:53:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF9EF185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABD7D40347
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3yVGBKyROSe for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37BC740148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37BC740148
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37BC740148
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:53:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67FC44427E;
 Tue,  4 Feb 2025 16:53:29 +0000 (UTC)
Date: Tue, 4 Feb 2025 17:53:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20250204175328.5bb82606@windsurf>
In-Reply-To: <20250118214053.115126-2-bernd@kuhls.net>
References: <20250118214053.115126-1-bernd@kuhls.net>
 <20250118214053.115126-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehheelfeejudekjeekueetteejtdeihfegleeuffetvedtteeivddtgeeigffgheenucffohhmrghinhepghhithhhuhgsrdhiohdpthgrghhlihgsrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738688009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZHwsNsPwtXTzYG+uQknavrRioQE2XOvCMspYlWVGAc=;
 b=fspQmW8CkuHjT07Yf9gi+Rr2Tb2z5z4C6N0Qxq5DIcATBV8rVNmm3dXCw6NBFB0DfpHI+0
 B6xZRRKZMMt7r9p2T85iiPHgPcvh6JidoUwNUSxjBoe4MTvhBcp6CZK0uZyUYs0KbvzwcN
 v9yTP5Q6ApA6j7PlKALdx7DjqemTwV0NOpeWlUbNl2XxK6wr7rAGtGaWcsna6pgjMeIt9x
 t7h3IbS42Y8x8XVNlTwsM3xEXp2mtWTKTb9a1XVNdyJjTMsGblYaaC6scEDR4Ev/Wdadkq
 smj/qXQNFm/eWWGfArI5lV5kfRHYhfDc65VKiBmAaDquvpamarkVoDClOEpfOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fspQmW8C
Subject: Re: [Buildroot] [PATCH 2/2] package/taglib: bump version to 2.0.2
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

On Sat, 18 Jan 2025 22:40:53 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> -TAGLIB_VERSION = 1.13.1
> -TAGLIB_SITE = http://taglib.github.io/releases
> +TAGLIB_VERSION = 2.0.2
> +TAGLIB_SITE = https://taglib.org/releases
>  TAGLIB_INSTALL_STAGING = YES
> +TAGLIB_DEPENDENCIES += utfcpp

= sign was enough here, += is not necessary.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
