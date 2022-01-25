Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5185FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 068D440966;
	Tue, 25 Jan 2022 17:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKL9hQSQTWc0; Tue, 25 Jan 2022 17:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EAFA40946;
	Tue, 25 Jan 2022 17:39:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 221621BF957
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D661401C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgP6n15IB2RC for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:39:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF6AF400D9
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:39:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B617C0005;
 Tue, 25 Jan 2022 17:39:15 +0000 (UTC)
Message-ID: <2d5dcf47-01c7-8a69-5ac9-25440798bd19@korsgaard.com>
Date: Tue, 25 Jan 2022 18:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20211226104520.663206-1-thomas.petazzoni@bootlin.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20211226104520.663206-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/glibc: add a patch to fix build
 issue in kernels >= 3.15 and < 5.1 on Microblaze
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/12/2021 11.45, Thomas Petazzoni wrote:
> As explained in the patch itself, there is a bug in the handling of
> __pselect32() in glibc for the Microblaze architecture. There a
> special Microblaze variant that was added to support kernels older
> than < 3.15, but it "hides" a generic implementation that is needed to
> support kernels newer than 3.15 but older than 5.1 (which is when the
> time64 support for 32-bit architectures was added, making __pselect32
> no longer needed).
> 
> This bug causes a glibc build failure for kernels >= 3.15 but < 5.1,
> on Microblaze.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.11.x, thanks.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
