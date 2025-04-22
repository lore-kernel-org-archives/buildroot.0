Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0E2C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5FCC81122;
	Tue, 22 Apr 2025 19:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lXnrS-O3Vs2; Tue, 22 Apr 2025 19:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC4480E32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC4480E32;
	Tue, 22 Apr 2025 19:43:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DBB71A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 636DF80E32
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jfj59n-v5GGU for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A7DE80BB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7DE80BB9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A7DE80BB9
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:43:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5489943B6B;
 Tue, 22 Apr 2025 19:43:10 +0000 (UTC)
Date: Tue, 22 Apr 2025 21:43:09 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20250422214309.330035ae@windsurf>
In-Reply-To: <20250421-fix_linux_tools_parallel-v2-1-301086814e0b@rivosinc.com>
References: <20250421-fix_linux_tools_parallel-v2-1-301086814e0b@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhkeekgeevgfekhfeggfelffdvgfdtteduuedthfehfffgkeeileefhedvkeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpr
 hgtphhtthhopeihrghnnhdrmhhorhhinhdrudelleeksehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745350990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sy6fLSG5+PxwyuI79MCzUJ03CQARP/M999MWVynl3wY=;
 b=fmTKLuOUjsSUx5iIvavoobZ4DnMwGu1CionGKqSR+gR3IB8Y2QkYEyOOGWQuXukg86RNOH
 6nwPKlrScm8NG99FzNQp3J9V+v0hUnqD6H4Xu42ybw8ejOJULLYPwB9j8CA2i4K1pioeja
 aCpegkLyd6GGFvYc49vvj5ryFjWdFPX4P7TD1VKoaOJ9ty7WleUP0jz+aoVT1TiwU2e+aT
 kJYw1b+1pl1EYg/jZANVrRmxFOnQZss9XYHAVYVVx90Izs/mPl2Ovhi+k91cvZc7jP+ktf
 Fn5w+//RbSEuK+9A9i6TgDvHW95x7SlmPfsmsaSd0t0UOQqy1uyCWE+OY0iEAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fmTKLuOU
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: Fix parallel
 compilation
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

On Mon, 21 Apr 2025 23:36:59 -0700
Charlie Jenkins <charlie@rivosinc.com> wrote:

> linux-tools opportunistically set linux as only a patch dependency. This
> unfortunately introduces a race condition in the shared linux scripts
> when using PER_PACKAGE_DIRECTORIES and using top level parallelism. The
> race manifests as the error "/bin/sh: 1: scripts/basic/fixdep:
> Permission denied". This happens when the linux package and the
> linux-tools package are being compiled in parallel.
> 
> The linux-tools currently using fixdep are perf and rtla. When the
> timing is correct, perf, rtla, or the kernel Makefile will try to use
> fixdep while one of the others is compiling fixed, resulting in fixdep
> being briefly not available.
> 
> To fix this, set linux as a build dependency instead of a patch
> dependency.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> While the timing of this seems like it should very rarely be triggered,
> on my build server I hit this issue nearly 100% of the time.
> ---
> Changes in v2:
> - Added more details to how/why the race occurs
> - Link to v1: https://lore.kernel.org/r/20250409-fix_linux_tools_parallel-v1-1-14135d77acf1@rivosinc.com
> ---
>  package/linux-tools/linux-tools.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Nice commit message, thanks a lot! Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
