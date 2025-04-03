Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECB6C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 08:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B909404BA;
	Thu,  3 Apr 2025 08:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6G6vkIJGqw29; Thu,  3 Apr 2025 08:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379004123B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379004123B;
	Thu,  3 Apr 2025 08:00:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C57B1F5
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 08:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09B8741246
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GuwXQ8RFhbw for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 08:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AA4541226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AA4541226
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AA4541226
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 08:00:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5EC74329B;
 Thu,  3 Apr 2025 08:00:04 +0000 (UTC)
Date: Thu, 3 Apr 2025 10:00:03 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250403100003.2cd45709@windsurf>
In-Reply-To: <CAGm1_ksE6xFtRustant2MyiSpa3moyv1L_HL0W17UNv6peZ2tQ@mail.gmail.com>
References: <20250326080506.3467586-1-yegorslists@googlemail.com>
 <20250403094430.08d9b2f1@windsurf>
 <CAGm1_ksE6xFtRustant2MyiSpa3moyv1L_HL0W17UNv6peZ2tQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeektdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743667204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnsYsmFvFKYFDKZdY4Pfrx8L1yjCRn9eT/gaiLIOUqY=;
 b=Fsa0PHv1c2PNMIZZ0B/PC1jVFHLXh3yYu4U8O33yEOaaowQU831akROg26pWlI9BZ8TGNZ
 4G88VwdrJP2DiXmwnJfdockGnR1+TQNc0w0NSixAhFEKtGsUra1Wc+Jrf1T54gVfVCxxLp
 4XBHt1jdRioSNvZv+uaddY/yNtg0kXI65OAhK23ZMA4HppWM4lTrsf0uHJX8AOcPvSK3yz
 fUw+2SH1Ym9OIsJGHG05AU7GEH4dkzzpj/7PbLGsje851a8otEiQyEq9g/bsnAS//Jkgcz
 xxAMODq3lWOdONz/jrCgZ5bR6YHLVQqocwrq6xMonsNf9JRdxrbI5usNt9nrBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fsa0PHv1
Subject: Re: [Buildroot] [PATCH] package/ncftp: bump to version 3.2.9
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

On Thu, 3 Apr 2025 09:53:52 +0200
Yegor Yefremov <yegorslists@googlemail.com> wrote:

> I have also noticed this change and already reported to the ncftp
> maintainer. He has just introduced a small change without bumping the
> version.
> 
> There is also another issue with the ncftpbookmarks binary that relies
> on curses instead of ncurses. I have also reported this. Let's wait
> till Mon/Tue and if I don't get an answer from him, I'll send a patch
> fixing checksum and disabling ncftpbookmarks binary.

Fixing the hash will not work, as we have already cached the previous
tarball with the old hash. All what can be done now is for upstream to
release a new version, and us to update to this version.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
