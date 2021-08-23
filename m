Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E547DC4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:06:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236BD61183
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 236BD61183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E69C280F81;
	Mon, 23 Aug 2021 22:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fh8_K-Sj1jbi; Mon, 23 Aug 2021 22:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A04280F82;
	Mon, 23 Aug 2021 22:06:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 219D21BF2F7
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E46E403B4
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNwVzyRROoJK for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 22:06:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77B94402E9
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 22:06:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 67D3C200003;
 Mon, 23 Aug 2021 22:06:35 +0000 (UTC)
Date: Tue, 24 Aug 2021 00:06:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210824000634.07d68905@windsurf>
In-Reply-To: <cd13188c-9e4b-635d-e582-ec10285c922d@mind.be>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818122511.005d6a5c@windsurf> <20210818110558.GY27036@scaer>
 <20210818221842.5926641d@windsurf> <20210818210431.GZ27036@scaer>
 <cd13188c-9e4b-635d-e582-ec10285c922d@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Mon, 23 Aug 2021 22:55:30 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  I have a theory, but it's a bit far out... We basically have this:
> 
> gcc -o empty empty.c
> objcopy --dump-section .interp=/dev/stdout empty > loader.txt
> 
> The timestamp of 'empty' is going to be near the end of the gcc run. The
> timestamp of 'loader.txt', on the other hand, is going to be all the way at the
> beginning of the shell run. So, if the filesystem doesn't have nanosecond
> precision, it's possible that 'empty' and 'loader.txt' have the same timestamp.
> 
>  It's not a good theory, though, because make shouldn't consider 'loader.txt'
> older than 'empty' if they have exactly the same timestamp.
> 
> 
> 
>  Ooh, I just discovered something nasty! Apparently, objcopy updates the
> modification time of its input file...
> 
> $ touch empty; ls -l --full-time empty loader.txt; make SHARED=yes loader.txt;
> ls -l --full-time empty loader.txt
> -rwxr-xr-x 1 arnout arnout 24K 2021-08-23 22:53:27.450172624 +0200 empty*
> -rw-r--r-- 1 arnout arnout  28 2021-08-23 22:52:57.949935937 +0200 loader.txt
> objcopy --dump-section .interp=/dev/stdout empty > loader.txt
> -rwxr-xr-x 1 arnout arnout 24K 2021-08-23 22:53:27.563173530 +0200 empty*
> -rw-r--r-- 1 arnout arnout  28 2021-08-23 22:53:27.563173530 +0200 loader.txt
> 
> I guess this way there is some chance that loader.txt gets a modification time
> just before the updated mtime of empty...
> 
> So the solution would be to touch loader.txt just after creating it. We could
> patch it like that, give it a go in the autobuilders, then send the patch upstream?

Wow, great investigation! Really odd that objcopy updates the mtime of
its input file, though.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
