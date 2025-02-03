Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FB8C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB60605C2;
	Mon,  3 Feb 2025 22:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVE49rC5pWW1; Mon,  3 Feb 2025 22:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D80F605ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D80F605ED;
	Mon,  3 Feb 2025 22:12:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47F0F1A4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B6DD817AB
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmZ0GTBQsG5p for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:12:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 022A2813EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 022A2813EB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 022A2813EB
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:12:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8FDE4437D;
 Mon,  3 Feb 2025 22:12:07 +0000 (UTC)
Date: Mon, 3 Feb 2025 23:12:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20250203231207.1a04a01a@windsurf>
In-Reply-To: <20250130182201.189109-1-bernd@kuhls.net>
References: <20250130182201.189109-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefheevleeiudegvefhlefgtdelieeviefftdevjedvieelhedtheethfdtgeffleenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgnhhurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeduleegrdejkedrvdduuddrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleegrdejkedrvdduuddrvddvtddphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738620728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SI4c5YDJlCxqN1XjOMK8grE/seU3oF4MC2JlEbJURNc=;
 b=JG62Fm+MyjZwkOY8oFp3KrFMIIlXFYJsfzS3wd2Vhm8eI0wxnYIVM5csJrIqybE0ctkLZB
 ei6F1SkSNUuZWUB0SRGUCpmQF13Tx/ocPSYhWBf3A5S7jeRpQDr2EdV0sko3NGrTAp35FX
 8yrWBTa2cY1NUCaGHf8zy4Cb/5FzCQhuO2ZhATxvMeH7IR4mHFYRIPVa97A7hcH57a5+MP
 WYE4U8d30Yap6kPBheTvG1Ll5mjD5D/7zORsMzA8Brs8RWB0f+Vo2whQUGI/DJ5u22EGHr
 jtrFMozjBP10qlLTGQfH1TEn8vIQ6LRhe1hjnTsUSS/zE/R9/v0ftSBKgGrIRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JG62Fm+M
Subject: Re: [Buildroot] [PATCH] package/libcdio: bump version to 2.2.0
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

On Thu, 30 Jan 2025 19:22:01 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/libcdio/libcdio/releases/tag/2.1.1
> https://github.com/libcdio/libcdio/releases/tag/2.2.0
> 
> Switched _SITE to github:
> https://lists.gnu.org/archive/html/libcdio-devel/2025-01/msg00005.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcdio/libcdio.hash | 2 +-
>  package/libcdio/libcdio.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
