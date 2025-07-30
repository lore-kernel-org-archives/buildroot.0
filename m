Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D276C87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 08:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49DCF6134C;
	Wed, 30 Jul 2025 08:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGSg_JUR0Eua; Wed, 30 Jul 2025 08:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 530826134E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530826134E;
	Wed, 30 Jul 2025 08:27:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DCA4186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 08:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73A9F8336F
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 08:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMZjf-xJk829 for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 08:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FD858384B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD858384B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FD858384B
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 08:27:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA39B43270;
 Wed, 30 Jul 2025 08:27:21 +0000 (UTC)
Date: Wed, 30 Jul 2025 10:27:20 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Message-ID: <20250730102720.49992419@windsurf>
In-Reply-To: <20250729200249.1387290-1-thomas.perale@mind.be>
References: <20250728224733.1d1727e9@windsurf>
 <20250729200249.1387290-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejfedtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfdtledvgfdvgfeutddvtdefudeutddufeehiedugffggefftdduleejtedvfeenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdhpkhhgqdhgvghnvghrihgtrdhmkhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtp
 hhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohephigrnhhnrdhmohhrihhnrdduleelkeesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753864041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wekJjJ9+gZ5gekRWyG04qCVtGSYs25O0pAvtwbZYzs=;
 b=m1OfMT3rkqkvblUnnJ9jtzvr0iTH0lh0ZD9MTbXZ9T7ZN+8MmPaIBkYIi7xZ4lGvG7sNsq
 yD5ZSWfU211ETxU1ghmMxcoHrg8Ks4LxfOO9y4mW/05RZHlCcL3dXZhoirSzBXHHwnh+Ba
 wxlZW0p4Hp/Dfc7a+kXUFPS3uJRlYWqWVLoabctls44Nx0N8CplNKvKDsqnAiMAihBBpFT
 Q/JZchpvJRqMdvLCiz4bi20XQ39Jdq3ICHVXECydsnYjwRgt33NHxam6X/iJgKo5DMc9Ey
 F/glb7m5soPgPhSvXywmTCSf+vlpJU5HFx/Up5METdtgWSDWeXaoD3+wA+Ym4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m1OfMT3r
Subject: Re: [Buildroot] [PATCH] package/aardvark-dns: add CPE identifier
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

+Yann in Cc.

On Tue, 29 Jul 2025 22:02:49 +0200
Thomas Perale <thomas.perale@mind.be> wrote:


> Thanks for giving a look. I saw similar trick was used in a number of other
> packages (icu, tinyxml, glibc).
> 
> If I'm not missing anything there are no way yet to define both the a
> <pkg>_VERSION and <pkg>_DL_VERSION variable. See the following code from
> pkg-generic.mk:
> 
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-generic.mk#L491-500
> 
> If <pkg>_VERSION is defined it will always override <pkg>_DL_VERSION.
> 
> Defining the aardvark-dns version like this could be a solution to the issue
> you raised but would require some changes in pkg-generic.mk
> 
> AARDVARK_DNS_VERSION = 1.15.0
> AARDVARK_DNS_DL_VERSION = v$(AARDVARK_DNS_VERSION)

Correct, that would be ideal, and I tried to implement exactly this a
while ago:

  https://gitlab.com/tpetazzoni/buildroot/-/commits/dl-version?ref_type=heads

And didn't manage to get something that works fully (my patch series
has a test that verifies the different combinations, and the tests are
failing). I'm pretty sure I discussed my code with Yann E. Morin back
in the days, and our conclusion was that adding another variable was
probably needed to solve the issue, but it was a while ago, I don't
recall the exact details.

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
