Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC7AC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 061E8417F8;
	Wed,  5 Feb 2025 11:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_YKGragpBg1; Wed,  5 Feb 2025 11:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF5C42499
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF5C42499;
	Wed,  5 Feb 2025 11:50:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F86CCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED6D812D2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyJHn7VoUsvs for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF30B81291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF30B81291
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF30B81291
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AC16442F3;
 Wed,  5 Feb 2025 11:50:21 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:50:21 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205125021.25b8c7d0@windsurf>
In-Reply-To: <20250205094505.1274-1-peter@korsgaard.com>
References: <20250205094505.1274-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefgeeuffffvddthfekueehteegffeghefgudelheelkefhveetiedvgeetlefhheenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpghgvnhdvvhgurhdruggvpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738756222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=coO73lBqyJmmI8vvl2IBqyoGJVlAUgr+8NQ+5YetZV0=;
 b=ZOzhGyJ+UgbZ8s1BFDxeTRDNz6Rk6M6A0yUNrphhVjyRFZeCAks1osHomqyLQmR5xeJroA
 knLk7jFUja7I+aTNhoJdIq/spxpp+nQnOqMP0bgaelqltKIk30rM/m1vi5eI+BjLAJchFy
 Q6wPuMDo4cffD2KOAy67/pN/3dcUJeTGfQl7oZ4Ru7ugWnH5U+UCnjypkRj7D5pjDCqTjR
 Rz6P1cnAX6Z3y+Cg5hNcnhkglsqvkSrE98HTY7rvlcnIchAKZZKHI/MBCTfsoV3rEYw4Jf
 CFsNWPEGQC+sH3D3pq4WJEPr1sQNm8Kn3k/rnFqJA5bGyBy8XsIEPyK+V8B8vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZOzhGyJ+
Subject: Re: [Buildroot] [PATCH] package/w_scan: drop package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Feb 2025 10:45:05 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes http://autobuild.buildroot.net/results/da054694f0056027e83e77a1cedff5659885f2ca/
> 
> The upstream location is gone (taken over by a domain squatter), there are
> no reverse dependencies, it is not listed in DEVELOPERS and hasn't been
> updated since 2017 with commit 0762015f144f ("package/w_scan: bump version
> to 20170107"), so drop it.
> 
> It looks to be superseded by a C++ version at
> https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html, which can be added if
> there is interest.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .checkpackageignore                           |  2 -
>  Config.in.legacy                              |  7 ++++
>  package/Config.in                             |  1 -
>  package/w_scan/0001-musl.patch                | 26 -------------
>  ...002-si_types-h-fix-build-with-gcc-10.patch | 37 -------------------
>  package/w_scan/Config.in                      | 14 -------
>  package/w_scan/w_scan.hash                    |  3 --
>  package/w_scan/w_scan.mk                      | 18 ---------
>  8 files changed, 7 insertions(+), 101 deletions(-)
>  delete mode 100644 package/w_scan/0001-musl.patch
>  delete mode 100644 package/w_scan/0002-si_types-h-fix-build-with-gcc-10.patch
>  delete mode 100644 package/w_scan/Config.in
>  delete mode 100644 package/w_scan/w_scan.hash
>  delete mode 100644 package/w_scan/w_scan.mk

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
