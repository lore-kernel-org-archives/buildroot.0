Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A900EC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5812240892;
	Tue,  4 Feb 2025 17:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-qxPrdS7wD1; Tue,  4 Feb 2025 17:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21496408A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21496408A0;
	Tue,  4 Feb 2025 17:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBFFB12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3999821FC
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dpZ--_kwp_M for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:18:39 +0000 (UTC)
X-Greylist: delayed 2522 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 04 Feb 2025 17:18:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8A3882186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A3882186
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8A3882186
 for <buildroot@busybox.net>; Tue,  4 Feb 2025 17:18:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D4D4440DF;
 Tue,  4 Feb 2025 17:18:35 +0000 (UTC)
Date: Tue, 4 Feb 2025 18:18:34 +0100
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
Message-ID: <20250204181834.740182a9@windsurf>
In-Reply-To: <20240626090026.31083-1-ps.report@gmx.net>
References: <20240626090026.31083-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphhsrdhrvghpohhrthesghhmgidrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhshigsohigrdhnvght
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738689515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7CsP/ay5aRTXG70MSgPmIMZjKmv3xJjusQEoKE7lLo=;
 b=SAVSVENgpK0qHJxw1EzlokjAksUikYszbYO3ph1rV3IGcwvdSbkGlRou4Pk16mClMnByr4
 qLVTsAu5D46xYwhBIsclJ4xH4O6HxvujW7yG7STuHw4OjgzrGQPw7w/r5HXvZJeUfb/Jgr
 HVr88/tULmFPoa1697Nas0LbgFcFRcuATzyCD6iC/1toD3U+8X7Kxfe33oI6cYFpg9rCcS
 w0b3lMYRRW9DGZkF88EjNOjyZg7+j73HIlgSU/JYxYLo4CVD3f7GLyOxw6NVCFCxfXs5ve
 mQlTfhIX7hW1Suan0f/SHdImMyzu49KsSUQgwILVP3FE9dc61KCmAgcMYEzZPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SAVSVENg
Subject: Re: [Buildroot] [PATCH v1] package/pcre2: bump version to 10.44
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

On Wed, 26 Jun 2024 11:00:26 +0200
Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:

> - enable PCRE2_AUTORECONF to fix the following buildi/relink failure:
> 
>     x86_64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used
>     in cross-compilation: '-L/usr/lib'
> 
> For details see [1].
> 
> [1] https://github.com/PCRE2Project/pcre2/blob/master/ChangeLog
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/pcre2/pcre2.hash | 4 ++--
>  package/pcre2/pcre2.mk   | 5 ++++-
>  2 files changed, 6 insertions(+), 3 deletions(-)

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
