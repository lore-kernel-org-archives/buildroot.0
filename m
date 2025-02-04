Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9219C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99EBB80D08;
	Tue,  4 Feb 2025 17:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZqNr9eErS1F; Tue,  4 Feb 2025 17:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CDDB80FFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CDDB80FFE;
	Tue,  4 Feb 2025 17:21:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E668185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4970C60D65
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1lwNVPAZ3fK for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:21:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DB7860B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB7860B6B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DB7860B6B
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:21:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A8B244261;
 Tue,  4 Feb 2025 17:21:17 +0000 (UTC)
Date: Tue, 4 Feb 2025 18:21:16 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Nathaniel Roach <nroach44@gmail.com>
Message-ID: <20250204182116.137988be@windsurf>
In-Reply-To: <20250109012111.28783-1-nemaakhilesh@gmail.com>
References: <20250109012111.28783-1-nemaakhilesh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekgfelgfeihfekheeuteelffegfeelledvlefgieehjeeugeevfeffveffffdvhfenucffohhmrghinhepghhnohhmvgdrohhrghdplhhisghguhguvghvqddvfeekrdhnvgifshdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepnhgvmhgrrghkhhhilhgvshhhsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehnrhhorggthheggeesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738689677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENZMX3W6dN58g3sUSz7MIxY2FZYCS27zlpP7iExr0X4=;
 b=Vwq9FzRI0F39PPUEwE0si5AE3my7oYgVEWEuG2Fufa/V37ICR4wlsvtG8MWDSYSt66c0rp
 ZsUcy+xD82ebSNvPzQmFZjxRJ8C4kbWRZ27DpijBdy+XtAE7D+SnxxjgOiKVb4fcRCnRhf
 arYYlOSq8R6wX2tsDUSpZ3M0+PSM+t5EKkJ6/83hRtfa+Rszd/vS89/k77iQCU08YML3K1
 6nRMZ3XXIUCTJLdJkYPUXXLuBfhxPBLUX4xxmYS2bVfm9Mz9lck3WzqSfckZy4HC4KCbSD
 3WTn6Cf5OotjJUPErmwOMVJ7YSh8llKwTt/It5+vr2MFvKhZSTF9fEHmRnELZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vwq9FzRI
Subject: Re: [Buildroot] [PATCH 1/1] package/libgudev: bump to version 238
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

On Wed,  8 Jan 2025 17:21:11 -0800
Akhilesh Nema <nemaakhilesh@gmail.com> wrote:

> Changelog: https://download.gnome.org/sources/libgudev/238/libgudev-238.news
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/libgudev/libgudev.hash | 4 ++--
>  package/libgudev/libgudev.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
