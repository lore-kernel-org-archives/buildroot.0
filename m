Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3702C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636E881EE2;
	Mon, 20 Feb 2023 20:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636E881EE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Su9Ty-1M5ZB; Mon, 20 Feb 2023 20:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7DC81F0B;
	Mon, 20 Feb 2023 20:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7DC81F0B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F11F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C8E8410D8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8E8410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ebv0uHiSSXU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:36:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92DB410D5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B92DB410D5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:36:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B54FDFF802;
 Mon, 20 Feb 2023 20:36:41 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:36:40 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220213640.4a61b2c2@windsurf>
In-Reply-To: <20230220132552.1825946-1-fontaine.fabrice@gmail.com>
References: <20230220132552.1825946-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676925402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzZNAifVPrU9mRbL5dc0L5GW6Rzk0EKXKkMuiv46Cj8=;
 b=etWd4f6vH7cNfRZVPtF18Mb0WOQ/lmD6sxA6fJoDPyoU3CSfhPN2w3EasHsV9mXCh8bUc8
 DMeXb/cO1AZFA+k7+yifK7ubtoWd+tbU6KHDGw9w1aGlgKC2LRr2e5I7iAu69CIGblm34g
 tXJDdduBUCTQHeKBpM1F3kZJUCsmlwa4hYE0ctg8txzsfeuGdPn8qIhX0DnL1AyRTtZJro
 /lAdORHg7unVW5hLxq8661jAcB2fOHi6qUF7JlA4A+4B/lJqF9/6jQ7HuXD5cWWBSb5Z2z
 HNgCGUAIXb3NviAD/b3/mZswawckB6p30a2C/kK6yLLJwsVXAu5tTNYaf38q+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=etWd4f6v
Subject: Re: [Buildroot] [PATCH 1/1] package/speechd: fix build with help2man
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 14:25:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with help2man raised since the addition
> of the package in commit 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:
> 
> LC_ALL=C help2man -n "speech synthesis daemon" --output=speech-dispatcher.1 ./speech-dispatcher
> help2man: can't get `--help' info from ./speech-dispatcher
> Try `--no-discard-stderr' if option outputs to stderr
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cc1817efb4a5d54ffd2e7ac2f4fc773535f70972
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/speechd/speechd.mk | 1 +
>  1 file changed, 1 insertion(+)

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
