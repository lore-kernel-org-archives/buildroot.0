Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74628C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D6781A23;
	Sat, 19 Apr 2025 14:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOO7Hh6f_Xq2; Sat, 19 Apr 2025 14:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B5681A8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B5681A8E;
	Sat, 19 Apr 2025 14:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F451230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30BB181A24
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kI86494wCdt4 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 155F781A23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 155F781A23
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 155F781A23
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:44:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD7AD432C1;
 Sat, 19 Apr 2025 14:44:08 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:44:08 +0200
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250419164408.1c659d83@windsurf>
In-Reply-To: <20250417043845.2171938-1-lancethepants@gmail.com>
References: <20250417043845.2171938-1-lancethepants@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheplhgrnhgtvghthhgvphgrnhhtshesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745073849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxqgjD3e4ROwHTcWj/DUjIN5SoOsrNr7B2Jpv3QQ/8c=;
 b=kgKktguNR8DIHIVsQSmcEdSxNuOjweo2PHqLePb/OQZ1TNyNM/L+AdvJLllYceVdTX3a/R
 PAPwLUQPvPSbQHy0aXGdDYPqdncPIb1iLL/WNfgrVShaM3/V4v8vKC/jRVzEF8HJ9IMzbo
 MTVLOZPjrLt9VS72p98qMSsGfBbvuzC648iYLMsEey/h8jc9BSL0Mvt+ocNeMuyvwHMWvE
 8uixDXIHGOl54c87FrJ6QBJZwmIbf4cl9GnpO8cA0JxMeNgh4appKekRMpDboyMD9dfL0f
 +aHuM7Zpcopbc1EqxnAuFzwouZxhVMbhLSIkco13ywu2xczQaTwUZz54+nwJNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kgKktguN
Subject: Re: [Buildroot] [PATCH 1/3] package/libubox: bump version to 3868f47
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

On Wed, 16 Apr 2025 22:38:42 -0600
Lance Fredrickson <lancethepants@gmail.com> wrote:

> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Changelog:
> 
>  - 3868f47 blob: constify attr argument to blob_memdup
>  - eb9bcb6 ustream: prevent recursive calls to the read callback
>  - 12bda4b CI: add CodeQL workflow tests
>  - a2fce00 CI: add build test run
>  - c1be505 udebug: fix crash in udebug_entry_vprintf with longer strings
>  - 6339204 CMakeLists.txt: bump minimum cmake version
>  - ca3f6d0 udebug: fix file descriptor initialization for __udebug_buf_map
>  - df5b714 udebug: add mips specific quirk
>  - d27acfe udebug: add more checks for uninitialized buffers
>  - 40acbe3 udebug: wait for response after buffer add/remove
>  - e84c000 udebug: add inline helper function to test if a buffer is allocated
>  - 325fea5 udebug: add functions for manipulating entry length
>  - e80dc00 link librt if needed for shm_open
>  - 260ad5b udebug: add ulog support
>  - b77f2a4 uloop: fix build using C++ compilers
>  - d4c3066 udebug: add udebug library code
>  - b3fa3d9 uloop: reset flags after __uloop_fd_delete call
>  - 8a5a431 uloop: fix typo in signal handling rework
>  - f7d1569 uloop: properly initialize signal handler mask
>  - 13d9b04 uloop: add support for user defined signal handlers
>  - 82fa648 uloop: add support for interval timers
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
> ---
>  package/libubox/libubox.hash | 2 +-
>  package/libubox/libubox.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, series applied to master!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
