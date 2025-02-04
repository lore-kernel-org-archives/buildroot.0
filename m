Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1FBC02198
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 11:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A09A80CC3;
	Tue,  4 Feb 2025 11:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xL4w5JATS-r; Tue,  4 Feb 2025 11:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F55C81934
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F55C81934;
	Tue,  4 Feb 2025 11:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 626F4185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D5C9411A2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziOKrmeUww3J for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 11:31:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C974E41368
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C974E41368
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C974E41368
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:31:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 325C4442C1;
 Tue,  4 Feb 2025 11:31:22 +0000 (UTC)
Mime-Version: 1.0
Date: Tue, 04 Feb 2025 12:31:21 +0100
Message-Id: <D7JMLXT93N6E.3VLTXH2R3KHUV@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, "Adam Duskett"
 <adam.duskett@amarulasolutions.com>
To: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204-repair_foot-v1-1-498406d0a384@bootlin.com>
In-Reply-To: <20250204-repair_foot-v1-1-498406d0a384@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfvfhhohhmrghsuceuohhnnhgvfhhilhhlvgdfuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiieefhffhueevveelvdfgudduleeuieeifeeuuedvledvveffleehvdduhefhnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhqu
 hgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprggurghmrdguuhhskhgvthhtsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomh
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738668682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVwtVisuf7AuMB+e2F55RhYviOUflGLMYikj9R5MHlo=;
 b=AspLAglbyn9Koqu9CWwdZV4zqDOfwRLj8EWiouATk4aObWj6vPOKvEA6BZ0ec+HzHKR94o
 nQwjt6s2l4VQAPJfKKboFlLUhb3hAXDUOzCZ5B4cq3PUIQ1HQepBYfmq2HxyXhaKxOk7Sd
 h9C8IEZi00VQDnGCWqkWHDD/iEh99M4Zja/PmFmObiUzqUxTN7KXQAFuniVCL3a129oYZo
 yYw5ZqM8Vka16NMhm64aFKdzAMgWffkhbXz9zkn9ttQs0qDRTGYhW8OSMDPyof+ajCEDGd
 sLNhPMh9/ZSvrpPVKZrc5E2CjWlfLgy8aijvkSLgGEgZTns06z32qNMAajf23Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AspLAglb
Subject: Re: [Buildroot] [PATCH] package/foot: support soft-float
 architecture
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue Feb 4, 2025 at 12:27 PM CET, Thomas Bonnefille wrote:
> Architecture using soft float don't support the math FE_* exceptions.
> This commit adds a patch to conditionnally build the FE_* exception
> handling.
>
> Fixes:
>     https://autobuild.buildroot.org/results/88d/88d764dd12bdbdbe633ebc703c461ebe95b75693/
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
Forgot to say that this issue, also happened on 2024.02 and so, this
patch can be backported to the LTS.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
