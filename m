Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEED2C636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 15:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 092A98134B;
	Tue, 31 Jan 2023 15:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 092A98134B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9xeIz5j1MmT; Tue, 31 Jan 2023 15:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B0A81441;
	Tue, 31 Jan 2023 15:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43B0A81441
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF701BF28A
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 15:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3100581249
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 15:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3100581249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XtMxt9Gnafb for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 15:16:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89C880DF9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C89C880DF9
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 15:16:02 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ACE731C0005;
 Tue, 31 Jan 2023 15:15:59 +0000 (UTC)
Date: Tue, 31 Jan 2023 16:15:58 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230131161558.5982b380@pc-7.home>
In-Reply-To: <37a680ce-9213-de60-4d6c-306a787d4bad@benettiengineering.com>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-5-maxime.chevallier@bootlin.com>
 <37a680ce-9213-de60-4d6c-306a787d4bad@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675178160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqrfZGcYXSVDO6zciZwDh4viGSY+T/jeWr/AkqCJH/o=;
 b=PlEdRy803SymmANfCxkXN7VBb3vaMHw1cMxwpXGy027XlqCK+/jF3EprTpSp5PdMyh6p7A
 obFYIpLWNdxFw7w+t9jUgtI80cJlfOkwHVX9s2tacsRR9xqAN4AaIOydKXdDlxgcoTDgjK
 qP4w85Y9UsdNG9I/brMMDwpS6y0n0YRehC1sbMPpeUgzNVoueoH0xiceHl/w3sgcJhsJ0/
 Bxu2iGaOLm+B35a/oxEpLeg78SIxfWP1Rn4A9xcHdYaPZhJfiY1HZItWvwdWsfcSG5s2x/
 6GoD3y5248gpZU3vZ4vtbZVxCa43a6ArxEthH04Zya4/rTqVxLjvp8xUM2bMrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PlEdRy80
Subject: Re: [Buildroot] [PATCH 4/4] package/trace-cmd: bump to 3.1.5
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Tue, 31 Jan 2023 00:12:47 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Hi Maxime,
> 
> I was trying to build trace-cmd but it hangs while calling the first
> make on building stage.

Aw ok, do you have some logs of what happens before it hangs ?

> I've tried with both make 4.3 and 4.3.91. Which make version are you
> using?

I'm using make 4.3 on my side.

Thanks for giving my patches a try :)

Maxime


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
