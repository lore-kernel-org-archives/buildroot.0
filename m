Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53482C83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 07:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB39540EF9;
	Mon, 28 Jul 2025 07:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-J8efc48f1n; Mon, 28 Jul 2025 07:13:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2201D40CF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2201D40CF5;
	Mon, 28 Jul 2025 07:13:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98FAEDA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 07:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EE97822C9
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 07:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ateH5mPjogFp for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 07:13:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D3D78227E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3D78227E
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D3D78227E
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 07:13:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 083A5442A1;
 Mon, 28 Jul 2025 07:13:05 +0000 (UTC)
Date: Mon, 28 Jul 2025 09:13:04 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <20250728091304.0bd6bbc2@booty>
In-Reply-To: <20250727082253.883440-1-thomas.perale@mind.be>
References: <20250727082253.883440-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegjeehjeelheekuedvleekleegveffledvfeeiudduhfduhfejkeegveehtddtgfenucffohhmrghinheprghprggthhgvrdhorhhgpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753686786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PyidKzejSLR4yGdvA4lnrAaukOHVc/ZyNiaFnfvQOgo=;
 b=hLNSiEHi90n5BbjJ3a0Y4fNTPK4TGzhkO1lfFccoPcv3GP7Uz3ZySYQV8Fd9QpCbIfsHvq
 h62CDREU4/5GqDNL25S4+myhwZlpIjs0H+dWGTn2UgtXqkyu5DgnhmgF1rfHuwqvzHI5a+
 EOJqToPhNNqsBZeBV3xCpSUwKCkCg6mOiWPzHGssGn6In9QEFhAE4sc/JTqtYr6X+fHnVn
 CfihZtHVgCDgEXrqI7cT/yvU1UO7d2RIFu8VWDDnXAZbfd7PXjGmLkfw4/Cd3+f1jbcd6M
 eHOisYIM8fAtHJ/dmMUuSpQW5gPIYDNfKa24DzNIeq11AEkFK10Uc+tg5Iir8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hLNSiEHi
Subject: Re: [Buildroot] [PATCH] package/qpid-proton: update mirror url
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

Hello Thomas,

On Sun, 27 Jul 2025 10:22:53 +0200
Thomas Perale <thomas.perale@mind.be> wrote:

> The current mirror now only has the version 0.40.0 available.
> 
> Older version of apache packages moved to the "archive.apache.org"
> location.
> 
> Fixes: https://autobuild.buildroot.org/results/853/853c354b9bde4408e122046496fd3f0e7ffb0b55
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
