Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84792C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3093880C1E;
	Wed,  5 Feb 2025 15:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5DCPoh-04H9; Wed,  5 Feb 2025 15:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5404F81586
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5404F81586;
	Wed,  5 Feb 2025 15:37:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 515D8CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3593780C1E
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVCREx6jMH5P for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15A5781586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A5781586
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15A5781586
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:37:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C8CD4326A;
 Wed,  5 Feb 2025 15:37:50 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:37:50 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205163750.6072f1bc@windsurf>
In-Reply-To: <20250125210741.378348-1-thomas@devoogdt.com>
References: <20241116160819.70007-1-thomas@devoogdt.com>
 <20250125210741.378348-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduieethfeftdejvdegueeuudehiefggeelheettdevvedtkeevieeutdehjeetheenucffohhmrghinhepghhnohhmvgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsseguvghvohhoghguthdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738769871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKbQJklS8mbZHCjj5jj932PBmVLID4Ah+X9OReoXWwA=;
 b=OeJD0emPSpPaY1WT1zO0nbgAoHxFl7B1md0WzbGG4GpqSCvFbrQltMWUAktofUFusLJ7a9
 2qmDXniV8r5e4YhksTKe3BDwFL1Tu9iGsC3A+A4A+6NAgwxRWhB6MxoqGN223Lo7tmi/MD
 qZ0jAfRnqJQ01DR6eNgZguzgZAYFk3dkbx9TtNJd9dEPg/bk3OqfYo8Tx2fafWRu9gtAiD
 d3JL+v7Jxym2Nb+04GqBDmYKc8P+bBEaGCDKhM3ApLLAcNOAsfzRpq6NrL2BfXCFJHZcB+
 4ZZ95HqCLDue+9eSqVLOYmtJ8qq7nWRdCpjT8oFB4gEE+7+3aZUxjFtBiyqs+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OeJD0emP
Subject: Re: [Buildroot] [PATCH v2] package/libgtk4: bump to 4.17.3
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

Hello,

On Sat, 25 Jan 2025 22:07:39 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> https://gitlab.gnome.org/GNOME/gtk/-/blob/4.17.3/NEWS
> 
> Note that libgtk4 never selected BR2_PACKAGE_CAIRO_{PNG,ZLIB},
> this is also not needed since [1]. Instead, we have to select

I was confused by the "also" in this sentence. I would have found
clearer to say:

"Note that libgtk4 never selected BR2_PACKAGE_CAIRO_{PNG,ZLIB} as it is
not needed thanks to [1]. However, we need to select BR2_PACKAGE_LIBPNG
.... <add some reason here>. In libgtk3, this was indirectly done as
libgtk3 selects BR2_PACKAGE_CAIRO_PNG."

> +LIBGTK4_VERSION_MAJOR = 4.17

Odd middle number indicate development/unstable releases. The current
stable release is 4.16.12. Could you use this version instead?

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
