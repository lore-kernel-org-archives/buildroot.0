Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2392FC87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9A928230D;
	Sun, 10 Aug 2025 15:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4LgaqHE1qJB; Sun, 10 Aug 2025 15:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F01C7822CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F01C7822CC;
	Sun, 10 Aug 2025 15:52:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D0E8154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2CB7821FD
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFNsRqgK5yBj for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:52:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5466822CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5466822CC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5466822CC
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:52:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E99034443B;
 Sun, 10 Aug 2025 15:52:25 +0000 (UTC)
Date: Sun, 10 Aug 2025 17:52:24 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250810175224.788ea11f@windsurf>
In-Reply-To: <0ead42e3-6522-4f92-8a21-a8c8352375c2@smile.fr>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
 <0ead42e3-6522-4f92-8a21-a8c8352375c2@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdelleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfeiudetueefgeeuudevfeeigeefgfejgfekjeekhfevleehgffgffettdefhfeinecuffhomhgrihhnpehoiihlrggsshdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754841146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2epeQNq0ig42r4gg96Guj4oYfRoDv4KwtT9qxKvgZKs=;
 b=BkkX1ZLq87q9slMrEJbPA/khhkiN5zshajyCgwQ46IHQ2hCze7nRceBfbXWtW8d01aYqwy
 QDLtrQCL7x68bm7oTOcx+5sKFm5VNYWJDO7VurnFepdRtd8wRY7IgA68Zl8Dqc0S3DbomZ
 wXawb6DSthTw7FhJNFS4wgTIffO/QHrifyYNdaE2kZeYaE0dvxcYrzQ27qkAGzOh/6osJJ
 qlRTUKyZXeldl9Atfkf6tGHsKpYeczMhcsVFrIsooshIj+5nf1TEx8uEnutVREIeAAPlvm
 7pwJK438AqDIvkCCr5QoAH1Tcm4U19r2fT6Z7On1yoE70hXcaMpiF+tKhsIS5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BkkX1ZLq
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 drop tweak for Microblaze bleeding-edge toolchains
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

On Sun, 10 Aug 2025 16:11:09 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> I guess you are referring to the pending patch from Neal Frager [1].
> 
> [1]
> https://patchwork.ozlabs.org/project/buildroot/patch/20250728045145.132333-1-neal.frager@amd.com/

Correct. This patch is pending for Buildroot master, but I did
integrate it into my toolchain build.

> Note: patch 3/3 was not received yet on the mailing list (patch too big probably).

Ah, good point. I approved the patch, which was sitting in the
moderation queue (indeed it was too large).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
