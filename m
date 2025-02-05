Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7460CC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47101424D8;
	Wed,  5 Feb 2025 11:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWC9NRVjhUDA; Wed,  5 Feb 2025 11:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E90F424D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E90F424D1;
	Wed,  5 Feb 2025 11:50:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67DB912A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BB5E6071D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wk9DiyIzCiq1 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34BF660680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BF660680
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34BF660680
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23816442E4;
 Wed,  5 Feb 2025 11:50:10 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:50:10 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205125010.5927617f@windsurf>
In-Reply-To: <20250205103042.12955-1-peter@korsgaard.com>
References: <20250205103042.12955-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhkeelhfeifeehffdthfehhfdvteeuvdetveduvdekhfffvddtgeeigfekleekteenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738756211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zpb3wIQbLeBT5dJjrEVUBYWd0qIZoJYKNtDTp2HCLPQ=;
 b=Y4lTqtUSpC70OaJVrXPPgb0xIJyrFRupEmfUaIzqaiCKxYXjbZ4CYiQV7z6qs2fPmd2DgJ
 /7m06aZq+KG9FGc8VoI1vp+p1ddO7sDSYJP8laHwSmL/afT2ugZRe4MNFSrqQrVRKQelIg
 gW1XMoZkV35bGo2iIqn3C0QqJEQsfLVukzSuyJTXbgMcVaFE8kAtQEk5Lsrr3n3DuX9x1p
 z5zonGq0DDMKP/aQiGhTW8hzBhVdHP2t8pKCQDu8ehJG9PDX3RUv+o4RH1oROX2XU1+rFB
 JcRptaETp391GVO+3x1cOX2AfhPP4giCJ3JPoG2Z5X43dXXVqdN8tB08IWfilQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y4lTqtUS
Subject: Re: [Buildroot] [PATCH] package/obsidian-cursors: drop package
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

On Wed,  5 Feb 2025 11:30:41 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes http://autobuild.buildroot.net/results/97ac940d6e279cfa493c6b5d9b4d318d8dda10da/
> 
> The tarball is no longer available for direct download as kde-look.org has
> hidden the downloads behind a nag screen, there are no reverse dependencies
> or DEVELOPERS entry for it and the package has not been updated since it was
> added in 2015 by commit ae2faeffb17d ("obsidian-cursors: new package"), so
> drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in.legacy                               |  7 +++++++
>  package/Config.in                              |  1 -
>  package/obsidian-cursors/Config.in             |  6 ------
>  package/obsidian-cursors/obsidian-cursors.hash |  2 --
>  package/obsidian-cursors/obsidian-cursors.mk   | 18 ------------------
>  5 files changed, 7 insertions(+), 27 deletions(-)
>  delete mode 100644 package/obsidian-cursors/Config.in
>  delete mode 100644 package/obsidian-cursors/obsidian-cursors.hash
>  delete mode 100644 package/obsidian-cursors/obsidian-cursors.mk

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
