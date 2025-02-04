Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FA9C0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 08:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F74940731;
	Tue,  4 Feb 2025 08:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ISLl9U8TNOM; Tue,  4 Feb 2025 08:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF1A4072B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF1A4072B;
	Tue,  4 Feb 2025 08:32:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FB6F185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F6AA60591
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UX-WAR08zVr5 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 08:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5752A60600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5752A60600
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5752A60600
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:32:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2396204A5;
 Tue,  4 Feb 2025 08:32:02 +0000 (UTC)
Date: Tue, 4 Feb 2025 09:31:56 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann
 <buildroot@bubu1.eu>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250204093156.3a738f5f@windsurf>
In-Reply-To: <20250120211707.2381182-3-fiona.klute@gmx.de>
References: <20250120211707.2381182-1-fiona.klute@gmx.de>
 <20250120211707.2381182-3-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgmhigrdguvgdprhgtphhtthhopegvrhhitgdrlhgvrdgsihhhrghnrdguvghvsehfrhgvvgdrfhhrpdhrtghpthhtohephigrnhhnrdhmohhrihhnrdduleelkeesfhhrvggvrdhfrhdpr
 hgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghusghuuddrvghupdhrtghpthhtohepfhhonhhtrghinhgvrdhfrggsrhhitggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738657925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aygk2XBiASwoHCovBF1L6H8OSQhgTqSU0UjVlY1oGEc=;
 b=DFRKX4OAu5kudKhkYPd4peCRgDuONMUNxFegypjGnTz2hormSnwNNtDz5sug9Xi/rlHXLj
 o8r3Ltb5DG6Cb1BVU/HwmhYCA9bEPMMmHu4bnappjkm1/kld7grK76kGqLxn3jFUo81P9E
 ieR7wP9OBijcUvp8Qt5e4Bs+jApcprkzOiJcGMNy23jJ1EMrYANDcBdVtN0WsvnT3NJWP2
 piZVRGENqcTUGEQ0OIPUw6UYWHw6lletBRtWRQTod7nwbM8ujcTKBQv2bdOXb9iM94eFcf
 BpdVjIBcmv5E7zIG6PsAzv64TTo7iEDFq4yFSua/m5zrQ0fEaKD8EwTyU9cwpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DFRKX4OA
Subject: Re: [Buildroot] [PATCH v9 2/6] package/{gobject-introspection,
 libglib2}: bump to {1.82.0, 2.82.4}
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

As discussed yesterday on IRC, I'm planning on working on this topic
today. I already have a few questions, see below. More might come later.

On Mon, 20 Jan 2025 22:17:03 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:


> +# Bootstrap is only needed if building with introspection. Building
> +# with introspection for the target requires introspection to be
> +# enabled for host-libglib2, so checking if host introspection is to
> +# be built is sufficient.
> +ifeq ($(BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION),y)
> +include package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
> +endif

We generally include .mk files unconditionally, so I'll drop this
conditional include, and make it unconditional.

Note: please do not resend new iterations with fixes for now: I'm
applying the patches locally and adjusting things. If all goes well,
I'll be able to merge them today.

If you're on IRC at some point, feel free to provide the feedback
directly on IRC.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
