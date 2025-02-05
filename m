Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681EDC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA1083C94;
	Wed,  5 Feb 2025 15:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p78B1FF-bTpc; Wed,  5 Feb 2025 15:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D835820F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D835820F5;
	Wed,  5 Feb 2025 15:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B3EA12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D77E41406
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2b0DSKNr2sQ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DE4D411AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DE4D411AC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DE4D411AC
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:07:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6E092047D;
 Wed,  5 Feb 2025 15:07:44 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:07:43 +0100
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org
Message-ID: <20250205160743.3bc05438@windsurf>
In-Reply-To: <20241205173643.2334343-1-alex.bennee@linaro.org>
References: <20241205173643.2334343-1-alex.bennee@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejheeghefhieelffegiefgueehieefffefgeeivdegleejgeeileetjeffkefgteenucffohhmrghinhepohiilhgrsghsrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738768064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqCcKwOw5SDfRQXrtIjHaAPi61i4GnSHAKuUM67oQUU=;
 b=WODakWwJG95epga8FPaFQnOosNFfV+NtiqbQW6RwKo5pQ/its7GZ35Qe/n63DHfKxnsXLV
 LElEkgaLaWqsJRrGON8aYNTPvxvx9GOErvvXOMyAQrn5/hOmL2hsTn5rUU2RH+0dVx/npN
 GmuJoCxud66yCsvjIa1G5GVdw00xWopIZLB5NYTLh+soYYdAKHAuVTvONFQywVkyh4wMJ7
 /vlobRniNNp5TTiRhrAzLt3LfLDJoeOaBwJv03Dxplc7LchhLqQSgdhk5RdQOBxnqBjvYN
 yP+bDbVkHH1N8cz3U+4GuXFkTn07VIqX2Z8j0A+EoiY5pVyL8EExU2qeRaZYvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WODakWwJ
Subject: Re: [Buildroot] [PATCH v2 0/4] Enable venus vulkan encapsulation
 and add vkmark
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleCwKCk9uIFRodSwgIDUgRGVjIDIwMjQgMTc6MzY6MzkgKzAwMDAKQWxleCBCZW5u
w6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPiB3cm90ZToKCj4gVGhpcyBpcyBhIHJlc3BpbiBv
ZiBhIHNlcmllcyBJIHNlbnQgb3V0IGluIEF1Z3VzdC4gVGhpcyB0aW1lIGl0Cj4gYXBwbGllcyBv
biB0b3Agb2YgdGhlIHNlcmllcyBCZXJuZCBoYXMganVzdCBzZW50IG91dDoKPiAKPiAgIFN1Ympl
Y3Q6IFtCdWlsZHJvb3RdIFtQQVRDSCAxLzddIHBhY2thZ2UvbGliZHJtOiBhZGQgaG9zdCB2YXJp
YW50Cj4gICBNZXNzYWdlLUlkOiA8MjAyNDEyMDIxNzQwMDguMTEzNDY2Ny0xLWJlcm5kQGt1aGxz
Lm5ldD4KPiAgIERhdGU6IE1vbiwgIDIgRGVjIDIwMjQgMTg6NDA6MDIgKzAxMDAKPiAgIEZyb206
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpCZXJuZCBoYXMgc2VudCBhIG5ldyBzZXJp
ZXMgYXQ6CgogIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
bGlzdC8/c2VyaWVzPTQ0MDg5MgoKc28gSSdtIGNvbmZ1c2VkIGhvdyB0aGlzIHNlcmllcyBvZiB5
b3UgZml0cyB3aXRoIGl0LgoKSW4gd2hpY2ggY29tbWl0IHNob3VsZCAic3VwcG9ydC90ZXN0aW5n
OiB1cGRhdGUgdGVzdHMgZm9yIFNPRlRQSVBFIiBiZQpzcXVhc2hlZD8KClRob21hcwotLSAKVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
