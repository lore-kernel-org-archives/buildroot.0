Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD1EC5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 21:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70FD740BE6;
	Mon,  2 Jun 2025 21:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_wslbTguZpS; Mon,  2 Jun 2025 21:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2179B40A6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2179B40A6F;
	Mon,  2 Jun 2025 21:23:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C351415F
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B52518214B
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 21:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFbaxx3TsBDL for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 21:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7952D81B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7952D81B48
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7952D81B48
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 21:23:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67A874396A;
 Mon,  2 Jun 2025 21:23:29 +0000 (UTC)
Date: Mon, 2 Jun 2025 23:23:28 +0200
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20250602232328.1088c65e@booty>
In-Reply-To: <20250602184049.933226-1-dalang@gmx.at>
References: <20250602184049.933226-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkeejgeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrlhgrnhhgsehgmhigrdgrthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvth
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748899409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmbgqX+TPbTRu9p92j5wuI6vHm0xfrdNvqci7ioYSMk=;
 b=pYB9AZRGF17fvJWkTvnkoG19/llnftCyYANMBYDdxYtDAgZ+6DchB6ot6loKclDjBkqPIX
 eqS7YCnriUY8wLxDweO6AJXT4hM6+2Tz9s2sbJQ4mQjEKnLlh+eO3CRLSTExZh+VCF0WMe
 g9MvhpZUQ5rJLl+pP3aqilONl+DRRLeuK4Fd+jEWI/tjLMhiFcj6uFMUDSrNt2EnbhwMwh
 9ypzZD4+FxU6kD4xr3FPGspqq9ouvb1u44gC3gHs5ZppPvKPAajgAEl1QCFgSsmjiR7QMv
 X+RUroWIP4jnl72iekLT52KHg59x28xZuGv80EEOivjKiAjW9uRGD3i9g5U8+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pYB9AZRG
Subject: Re: [Buildroot] [PATCH] package/exim: drop stale CVE-2022-3559
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Jun 2025 20:40:48 +0200
Daniel Lang <dalang@gmx.at> wrote:

> The CVE database was updated and includes the additional "up to
> (including) 4.97" version information.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
