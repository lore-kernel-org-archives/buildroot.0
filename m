Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CE2C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A09C80E60;
	Tue,  1 Sep 2026 21:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PkYgpyCT4Kd; Tue,  1 Sep 2026 21:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788298249;
	bh=C5y8cGzXKs/TPcVhW3KkA7PQl9hXWDMH6DknjEhUE7g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DR4MvqKwQwVw/Aosyu3RSZa29g5pkkPEjtqjpAW59mAG15U9CqLi9Cxq/PgeIhYpT
	 U3jh3GAOAyyO6SwXKzW9GsiD4zlce15L7nSaKf0+EYQLsno12r83vgyVftiZ6/Y7TX
	 sE7luREIsCmwquNvm3ToB9V0h+CKLwWuCA8UmZ+WFnHntt0qjSPgqlnuhOJgYvZCZs
	 bOAy1rmAUg8h6DzkkmFjMRDoX5E4PRN5mrujJlUQFJW9BO5TUpaMhmpptzpH5TVJJG
	 swElUhnJbySCVzoFmKqG3gM/PEhNTls67hlRe/7dqTIxwCo/62SpH+W2UnmpYmMutw
	 hImvXra97gdZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 307F980E34;
	Tue,  1 Sep 2026 21:30:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E89279
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB5F740A1A
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-3b9E6uqNSw for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00A9540845
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:30:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 012F84E414B6
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:30:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C3DBA6053C;
 Tue,  1 Sep 2026 21:30:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35FB011C7923D; 
 Tue,  1 Sep 2026 23:30:38 +0200 (CEST)
Date: Tue, 1 Sep 2026 23:30:38 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <apdDnBBsMKgfUAac@windsurf>
References: <20260817155413.2644351-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260817155413.2644351-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/vorbis-tools: fix build with GCC 15
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

On Mon, Aug 17, 2026 at 09:24:11PM +0530, Shubham Chakraborty wrote:
> vorbis-tools fails to build with GCC 15 because its bundled legacy
> getopt implementation uses unprototyped K&R C function declarations
> (such as `extern char *getenv();`). GCC 15 defaults to -std=gnu23
> (C23), where unprototyped functions are strictly treated as (void),
> causing compilation to fail with:
> 
> getopt.c:399:21: error: too many arguments to function 'getenv'; expected 0, have 1
> 
> Fix this by preserving Buildroot's TARGET_CFLAGS and appending -std=gnu17
> for toolchains that support it (GCC >= 8).
> 
> Tested with `./utils/test-pkg -p vorbis-tools -a`:
> 32 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/dda/dda9e20f43368898b913bf2b00a8491ba089643f/
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

The problem only seems to occur with musl, not glibc. Why? This means
it's not just a GCC version issue.

Also, can we actually fix the issues? It seems like it's just 2
prototypes that are wrong.

But even for musl, why is it trying to use its own version of getenv()
and getopt()? musl is providing those features.

So I don't doubt that passing -std=gnu17 papers over the problem, but
the analysis is a bit weak, and the proposed solution not quite up to
the quality standard that we expect.

Could you research this a bit more?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
