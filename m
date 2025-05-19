Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9276AC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 13:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E54860F16;
	Mon, 19 May 2025 13:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bzy1-G-9iuKF; Mon, 19 May 2025 13:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D98C60F14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D98C60F14;
	Mon, 19 May 2025 13:28:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B9FE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 13:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ADE781C18
 for <buildroot@buildroot.org>; Mon, 19 May 2025 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_t78xySi3Nt for <buildroot@buildroot.org>;
 Mon, 19 May 2025 13:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A71580D9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A71580D9C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A71580D9C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 13:28:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0D1442D43;
 Mon, 19 May 2025 13:28:19 +0000 (UTC)
Date: Mon, 19 May 2025 15:28:18 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>, El Mehdi YOUNES
 <elmehdi.younes@smile.fr>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher
 <gsmecher@threespeedlogic.com>, James Hilliard <james.hilliard1@gmail.com>,
 Sam Voss <sam.voss@gmail.com>, Torben Voltmer <mail@t-voltmer.net>, Saeed
 Kazemi <kazemi.ms@gmail.com>, Alex Michel
 <alex.michel@wiedemann-group.com>, Leo Yu-Chi Liang
 <ycliang@andestech.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <20250519152818.17d7a901@windsurf>
In-Reply-To: <edfdcc44-495f-445c-b48b-11f281cf2cd1@gmx.de>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
 <20250516133236.16e5aa23@windsurf>
 <4f3b7a04-418b-4563-b556-60c5d6f2c34b@gmx.de>
 <20250516165051.3f20224d@windsurf>
 <edfdcc44-495f-445c-b48b-11f281cf2cd1@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemgeekfedumedvrggtugemhegvudgsmeelfhgstgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemgeekfedumedvrggtugemhegvudgsmeelfhgstgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegvlhhmvghhu
 ghirdihohhunhgvshesshhmihhlvgdrfhhrpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrhdprhgtphhtthhopehjohhsvghphhdrkhhoghhuthesghhmrghilhdrtghomhdprhgtphhtthhopegurghvihgurdhpihgvrhhrvghtsehsmhhilhgvrdhfrhdprhgtphhtthhopehmrghilhesuggsrhhgnhdrtghhpdhrtghpthhtohepghhsmhgvtghhvghrsehthhhrvggvshhpvggvughlohhgihgtrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747661302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kA2xMffIZj6yMIX1Ac2RsAkS8TEuD7h6Zs2q3LhDaiY=;
 b=hjjwvzr1fVPz1UgwRMNf2Pquhvoo5RUoqgW9mtpiVn3zkVgF6i8sM3gku2IIHY6HqsE5OY
 FX5IkOWW263ZbKQZ3c2nlOkU++r46Mz8k5c5tW1PKe8UXCxKPGg330tLh8m7Y6sjdosLW6
 rgE8mNsMQIWZrnAIB8JKhP9wEgO4GFAtgXqJgZcjagiFikeSwDUlLZmNI/mEtX/C5zh4ST
 YEbCFw1UfYMIqFAyAtoEzxWzEOyxzybLANmGkYVpWl1U80//hjPVzVMSH2MlNvkEOllU8V
 AvenMFs5UY9eOCKlWbDHyZDWLcaANyygstU5AUlGY8VkDg/VXSAd6ijooDOjUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hjjwvzr1
Subject: Re: [Buildroot] [PATCH 0/4] package/rust: rust upgrade to version
 1.86.0
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

On Mon, 19 May 2025 14:23:50 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> > Dang, I missed that! Let's see what we can do about this, I'll discuss
> > with the other maintainers.  
> Thanks for getting that sorted! :-)

And thanks to you for having contributed the fix in the first place,
and followed-up at exactly the right time!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
