Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55A6C6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 07:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 295DF4174C;
	Sun, 25 Sep 2022 07:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 295DF4174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XUIrdgBv4Yq; Sun, 25 Sep 2022 07:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0711841744;
	Sun, 25 Sep 2022 07:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0711841744
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73F901BF5DC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4633982C61
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4633982C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qjv_hp-nUqC for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 07:47:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E770882C4D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E770882C4D
 for <buildroot@busybox.net>; Sun, 25 Sep 2022 07:47:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C984EFF806;
 Sun, 25 Sep 2022 07:46:57 +0000 (UTC)
Date: Sun, 25 Sep 2022 09:46:56 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220925094656.4b1de0d7@windsurf>
In-Reply-To: <20220923234616.7045112d@windsurf>
References: <20220921222934.07100d0c@windsurf>
 <20220922124010.26034-1-mf@go-sys.de>
 <20220923234616.7045112d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664092018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpUaCElZuyykXzdmfG9pSOWJP1ojHx9MZPV+kqsfYKk=;
 b=ZpjATO6IYQSy3elMXpC+SV9V5a3OrEdK/Nb+moPM7TpozfT7QwMRQdEvoUg6SvXjJaTGDA
 JDHtO+GCRJKy2LxO6pbk6iBQWUH6G54wK6949IjVlAE0shE4MHQpLEAIyCxcscUEPBfHeI
 YcMKbkZiA0bJpQ1BQ/AHYtjVGk3Q1d6svq29T3JesjDgCvabbQKAr/mR6mx70FLcR9hdXn
 abIf24OP9jvwNZV0TlA6KV2+ri/Fbdu17UQZOileDRLroOfyfM4OZgGQiaaaRoThNFyYGB
 529d4smwGCIMK/jZm7xaaAFAW7zAbmbmX5VNIXp3ovTC92D+eP8aAapwKwRDzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZpjATO6I
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{glibc,
 localedef}: bump to version
 glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Fri, 23 Sep 2022 23:46:16 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Applied to master, thanks. Let's see what the autobuilders have to say
> about this!

Turns out the autobuilders are not very happy: this new version of
glibc fails to build on a good number of CPU
architectures/configurations:

  http://autobuild.buildroot.net/?reason=glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3

Could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
