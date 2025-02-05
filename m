Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36206C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 003E240606;
	Wed,  5 Feb 2025 10:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dH9egIqA3_5s; Wed,  5 Feb 2025 10:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D08FA40612
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D08FA40612;
	Wed,  5 Feb 2025 10:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1D2312A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3ACC80ACA
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hWSxSAzhJCm for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8243980AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8243980AAB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8243980AAB
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:16:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73BB5433F8;
 Wed,  5 Feb 2025 10:16:47 +0000 (UTC)
Date: Wed, 5 Feb 2025 11:16:46 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20250205111646.05076080@windsurf>
In-Reply-To: <20240207171829.2676569-1-buildroot@bubu1.eu>
References: <20240207171829.2676569-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejfedtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfffhefhfefgffevtdfgteejleduteevleeludehhfdvjeelueeiheevffffheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhgsuhdurdgvuhdprhgtphhtthhopegrshgrfhhkrgejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738750607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmqIBOWJiF/5kmzYas+00HH/HC8wG6CtIeU4THj1Z1g=;
 b=LXKdy2Ovqi3ijRR2frUBTHO5OAWF/J2p891/0WQ3RyLGpKz9Z1q9LT60S1lS/E1A3bgxCS
 ABgf1J/Cqgsk3XHf5s5OSIkhud7O5vJjds/6vdC8JjAXLHvvqaem/9h2otw3+LfP0QqAhJ
 asdMpf5LSCU5TLnOTG+R8tRRc0NrdHG/XfVkyCi0zSDPwyL2YhrytqIDNN90bp/Zg/HjI0
 S3tTBN5WmE64agRkw59W8AELSBfSp5KHqLgrmOevlgKfkxfIg2ZygLDU3wZnQQVC/FXtNA
 8mtDLQe3NXTmqAPhnuVBZX7dgKOUVoMKXBKuYMyEcMhxvFm8acae89PwlZIVYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LXKdy2Ov
Subject: Re: [Buildroot] [PATCH] package/python-waitress: new package
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

On Wed,  7 Feb 2024 18:18:27 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> The test runs the flask sample app through the waitress wsgi server
> instead of the flask development server.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/Config.in                             |  1 +
>  package/python-waitress/Config.in             | 11 ++++++
>  package/python-waitress/python-waitress.hash  |  5 +++
>  package/python-waitress/python-waitress.mk    | 14 ++++++++
>  .../tests/package/test_python_waitress.py     | 34 +++++++++++++++++++
>  5 files changed, 65 insertions(+)
>  create mode 100644 package/python-waitress/Config.in
>  create mode 100644 package/python-waitress/python-waitress.hash
>  create mode 100644 package/python-waitress/python-waitress.mk
>  create mode 100644 support/testing/tests/package/test_python_waitress.py

Sorry for the huge delay, applied! You had forgotten to update the
DEVELOPERS file with the new package and test.

Thanks for having added a test together with the package BTW!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
