Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11204C8302F
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 10:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEEA041C6C;
	Tue,  1 Jul 2025 10:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrDO-7R_9Gpc; Tue,  1 Jul 2025 10:13:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE6E407E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE6E407E7;
	Tue,  1 Jul 2025 10:13:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97B52DF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 10:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94C188084A
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 10:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kLfUMG0nSGk for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 10:13:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55AFB80B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55AFB80B83
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55AFB80B83
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 10:13:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D48943136;
 Tue,  1 Jul 2025 10:13:18 +0000 (UTC)
Date: Tue, 1 Jul 2025 12:13:17 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: <buildroot@buildroot.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250701121317.7792bf97@windsurf>
In-Reply-To: <20250701093020.371352-1-neal.frager@amd.com>
References: <20250701093020.371352-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhur
 hesghhmrghilhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751364798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3Rk6ViFnVIcK4pVWS596oCeeKlrjLZ23xe9l6mm61c=;
 b=anz52wDZFXvmlazyBdRZKWU+iCiCMjMrM7j20NygaJlRirsingGblu3YDvXydOpYiQ0oc+
 CYigrknFjQBcvIC22TJeTHdHRa+WsbI+OD45qsm4Fi7JgLQM3VjgYlaQdmtXUiZ2R4aEGH
 r6DNo/1DN40Ggnev6Yx7gXs5EoaNpk5Cptzrs0rljJ0JSw0Toa3faP4hmWvZlV/azdKF8L
 cEhXIxyeU1kBzG8c7GQwIleoqP8q2BRzu7YdVpilPcHJJDmGsOdgl6f5tS/AUzCq1STU9n
 9crW6kRQNG7BVyoQAT0PrEEUagCc4+Ii6lY2pVEAmshnJUTzYa8FyBkt5gqBNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=anz52wDZ
Subject: Re: [Buildroot] [RFC PATCH 1/2] package/Makefile.in: microblaze:
 enable -mxl-barrel-shift as default
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

Hello Neal,

Thanks for working on this topic!

On Tue, 1 Jul 2025 10:30:19 +0100
Neal Frager <neal.frager@amd.com> wrote:

> +# microblaze arch atomic extensions require barrel shift
> +# instructions to be enabled, so make it default
> +ifeq ($(BR2_microblaze),y)
> +TARGET_CFLAGS += -mxl-barrel-shift
> +endif

Since this is a really important compiler flag for things to work
correctly, I believe we should add it to ARCH_TOOLCHAIN_WRAPPER_OPTS
instead of TARGET_CFLAGS, so that it gets encoded into the toolchain
wrapper, like we do in arch/arch.mk.arc to add -matomic on certain ARC
targets.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
